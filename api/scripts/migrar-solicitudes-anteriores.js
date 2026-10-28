/**
 * Migra las solicitudes contractuales de la plataforma anterior (PHP)
 * a las tablas nuevas del portal (contr_solicitudes, contr_adjuntos, contr_historial).
 *
 * La base anterior NO se modifica: solo se lee. Se puede ejecutar varias veces;
 * las solicitudes que ya se migraron (mismo radicado) se omiten.
 *
 * Uso (desde la carpeta api, con el .env del portal):
 *
 *   node scripts/migrar-solicitudes-anteriores.js \
 *        --origen=esehsjg18_solicitudescontratacion \
 *        --carpeta-anterior=/home/esehsjg18/public_html/solicitudes \
 *        --simular
 *
 *   --origen            Base de datos de la plataforma anterior (mismo servidor MySQL;
 *                       el usuario de la API debe tener permiso de lectura sobre ella).
 *   --carpeta-anterior  Carpeta raíz de la plataforma anterior, donde está
 *                       uploads/constancias/… (para copiar los PDF de las constancias).
 *                       Si se omite, se migran los datos sin los archivos.
 *   --sin-usuarios      No crear las cuentas del equipo de contratación.
 *   --simular           Muestra lo que haría, sin escribir nada.
 *
 * Decisiones de conversión (verificadas con los datos de la plataforma anterior):
 *  - El radicado anterior (ej. 10B9916544) se conserva: el contratista puede seguir
 *    consultando con su cédula y ese radicado.
 *  - fecha_registro está en UTC (la guardaba PHP); las respuestas y constancias están
 *    en hora de Colombia (las guardaba MySQL) y se pasan a UTC sumando 5 horas.
 *  - Vigencias: "2024,2025" se conserva; el formato antiguo "2024-2025" equivale al
 *    año final (el formulario tenía las mismas 6 casillas, solo cambió la etiqueta).
 *    El texto original queda en el historial.
 *  - Estado: Cerrado → respondida · Radicado → radicada (o en trámite si ya tenía
 *    alguna respuesta parcial).
 *  - Las cuentas del equipo de contratación se crean con rol "contratacion" y su misma
 *    contraseña (el hash bcrypt de PHP es compatible). Se omiten "admin" y "gobierno".
 */
require('dotenv').config();
const fs = require('fs');
const path = require('path');
const mysql = require('mysql2/promise');
const { config } = require('../src/config');
const { sumarDiasHabiles } = require('../src/dias-habiles');

const args = Object.fromEntries(
  process.argv.slice(2).map((a) => {
    const [k, ...v] = a.replace(/^--/, '').split('=');
    return [k, v.length ? v.join('=') : true];
  }),
);
const ORIGEN = args.origen;
const CARPETA = args['carpeta-anterior'] ? path.resolve(args['carpeta-anterior']) : null;
const SIMULAR = !!args.simular;
const CREAR_USUARIOS = !args['sin-usuarios'];
const MIGRADO_DE = 'Plataforma anterior de solicitudes contractuales';
const OMITIR_USUARIOS = ['admin', 'gobierno'];
const PLAZO = 10;

if (!ORIGEN || !/^[A-Za-z0-9_]+$/.test(ORIGEN)) {
  console.error('Indique la base anterior: --origen=nombre_de_la_base');
  process.exit(1);
}

/** Fecha guardada en hora de Colombia → Date UTC */
const desdeBogota = (d) => (d ? new Date(new Date(d).getTime() + 5 * 3600 * 1000) : null);
/** Fecha guardada en UTC (mysql2 con timezone 'Z' ya la lee como UTC) */
const desdeUtc = (d) => (d ? new Date(d) : null);

function convertirVigencias(texto) {
  if (!texto) return [];
  const anios = String(texto)
    .split(',')
    .map((v) => v.trim())
    .filter(Boolean)
    .map((v) => {
      const m = v.match(/^(\d{4})\s*-\s*(\d{4})$/);
      return Number(m ? m[2] : v);
    })
    .filter((a) => a >= 2000 && a <= 2100);
  return [...new Set(anios)].sort();
}

const limpiar = (s, max) => (s == null ? '' : String(s).trim().slice(0, max));

async function main() {
  const nueva = await mysql.createConnection({ ...config.db, charset: 'utf8mb4', timezone: 'Z' });
  const vieja = await mysql.createConnection({ ...config.db, database: ORIGEN, charset: 'utf8mb4', timezone: 'Z' });
  await nueva.query("SET time_zone = '+00:00'");
  await vieja.query("SET time_zone = '+00:00'");

  const [solicitudes] = await vieja.query('SELECT * FROM solicitudescontratacion ORDER BY fecha_registro, id');
  const [respuestas] = await vieja.query('SELECT * FROM solicitudes_respuestas ORDER BY fecha, id_respuesta');
  const [constancias] = await vieja.query('SELECT * FROM constancias ORDER BY fecha_subida, id');
  const [usuariosViejos] = await vieja.query('SELECT * FROM usuarios_app');

  const nombreViejo = new Map(usuariosViejos.map((u) => [u.id_usuario, u.nombre]));
  const porRadicado = (lista) => {
    const m = new Map();
    lista.forEach((x) => {
      if (!m.has(x.id_solicitud)) m.set(x.id_solicitud, []);
      m.get(x.id_solicitud).push(x);
    });
    return m;
  };
  const respuestasDe = porRadicado(respuestas);
  const constanciasDe = porRadicado(constancias);

  const r = {
    solicitudes: solicitudes.length, migradas: 0, yaExistian: 0, respuestas: 0, constancias: 0,
    archivosCopiados: 0, archivosFaltantes: [], constanciasHuerfanas: 0, usuariosCreados: [], usuariosExistentes: [],
  };
  const radicados = new Set(solicitudes.map((s) => s.codigo_radicado));
  r.constanciasHuerfanas = constancias.filter((c) => !radicados.has(c.id_solicitud)).length;

  /** Copia los PDF al almacenamiento privado y los registra (omite los ya registrados) */
  async function copiarConstancias(solicitudId, cons) {
    for (const c of cons) {
      const nombreArchivo = path.basename(c.ruta_archivo);
      const destinoRel = path.posix.join('contratacion', 'anterior', nombreArchivo);
      if (solicitudId) {
        const [[ya]] = await nueva.query('SELECT id FROM contr_adjuntos WHERE solicitud_id = ? AND ruta = ?', [solicitudId, destinoRel]);
        if (ya) continue;
      }
      r.constancias++;
      const origen = CARPETA ? path.resolve(CARPETA, c.ruta_archivo) : null;
      if (!origen || !origen.startsWith(CARPETA) || !fs.existsSync(origen)) {
        r.archivosFaltantes.push(c.ruta_archivo);
        continue;
      }
      r.archivosCopiados++;
      if (SIMULAR) continue;
      const destino = path.join(config.privadoDir, destinoRel);
      fs.mkdirSync(path.dirname(destino), { recursive: true });
      fs.copyFileSync(origen, destino);
      await nueva.query(
        "INSERT INTO contr_adjuntos (solicitud_id, origen, nombre, ruta, mime, tamano, creado_en) VALUES (?, 'respuesta', ?, ?, 'application/pdf', ?, ?)",
        [solicitudId, limpiar(c.nombre_archivo, 255) || nombreArchivo, destinoRel, fs.statSync(destino).size, desdeBogota(c.fecha_subida)],
      );
    }
  }

  if (!SIMULAR) await nueva.beginTransaction();
  try {
    /* ===== 1. Cuentas del equipo de contratación ===== */
    const idNuevo = new Map(); // id_usuario anterior → id en cms_usuarios
    for (const u of usuariosViejos) {
      if (OMITIR_USUARIOS.includes(u.usuario)) continue;
      const usuario = u.usuario.toLowerCase();
      const [[existe]] = await nueva.query('SELECT id FROM cms_usuarios WHERE usuario = ?', [usuario]);
      if (existe) {
        idNuevo.set(u.id_usuario, existe.id);
        r.usuariosExistentes.push(usuario);
        continue;
      }
      if (!CREAR_USUARIOS) continue;
      r.usuariosCreados.push(`${usuario} (${u.nombre}${u.estado === 'inactivo' ? ', inactivo' : ''})`);
      if (SIMULAR) continue;
      const [ins] = await nueva.query('INSERT INTO cms_usuarios SET ?', [
        {
          nombre: u.nombre,
          usuario,
          password_hash: u.password,
          rol: 'contratacion',
          area: u.cargo || 'Contratación',
          activo: u.estado === 'inactivo' ? 0 : 1,
        },
      ]);
      idNuevo.set(u.id_usuario, ins.insertId);
    }

    /* ===== 2. Solicitudes ===== */
    for (const s of solicitudes) {
      const radicado = String(s.codigo_radicado).toUpperCase();
      const resp = respuestasDe.get(s.codigo_radicado) || [];
      const cons = constanciasDe.get(s.codigo_radicado) || [];
      const [[ya]] = await nueva.query('SELECT id FROM contr_solicitudes WHERE radicado = ?', [radicado]);
      if (ya) {
        // Ya migrada: solo se agregan las constancias cuyo PDF no se había encontrado antes
        r.yaExistian++;
        await copiarConstancias(ya.id, cons);
        continue;
      }
      const registro = desdeUtc(s.fecha_registro);
      const ultima = resp[resp.length - 1];
      const cerrada = s.estado === 'Cerrado';
      const vigencias = convertirVigencias(s.vigencia);

      const fila = {
        radicado,
        cedula: limpiar(s.cedula, 20).replace(/[^0-9A-Za-z-]/g, ''),
        nombre: limpiar(s.nombre, 150),
        correo: limpiar(s.correo, 150),
        telefono: s.telefono == null ? '' : String(s.telefono),
        tipo_entrega: s.tipo === 'Fisica' ? 'fisica' : 'correo',
        vigencias: vigencias.join(','),
        descripcion: limpiar(s.descripcion, 10000) || '(sin descripción)',
        estado: cerrada ? 'respondida' : resp.length ? 'en_tramite' : 'radicada',
        plazo_dias: PLAZO,
        fecha_radicacion: registro,
        fecha_vencimiento: sumarDiasHabiles(registro, PLAZO),
        respuesta: cerrada ? limpiar(s.respuesta || ultima?.respuesta, 10000) || null : null,
        fecha_respuesta: cerrada ? desdeBogota(ultima?.fecha) || registro : null,
        respondido_por: cerrada && ultima ? idNuevo.get(ultima.id_usuario) ?? null : null,
        acepta_datos: 1,
        migrado_de: MIGRADO_DE,
        id_anterior: s.id,
      };
      r.migradas++;
      r.respuestas += resp.length;
      if (SIMULAR) {
        await copiarConstancias(null, cons);
        continue;
      }

      const [ins] = await nueva.query('INSERT INTO contr_solicitudes SET ?', [fila]);
      const id = ins.insertId;
      const hist = [
        [id, null, 'Ciudadano (plataforma anterior)', 'Radicada', `Solicitud recibida en la plataforma anterior. Vigencias registradas: ${s.vigencia || 'sin vigencias'}.`, registro],
        ...resp.map((x) => [
          id, idNuevo.get(x.id_usuario) ?? null, nombreViejo.get(x.id_usuario) || 'Usuario de la plataforma anterior',
          'Respuesta (plataforma anterior)', limpiar(x.respuesta, 5000), desdeBogota(x.fecha),
        ]),
        [id, null, 'Sistema', 'Migrada', 'Importada desde la plataforma anterior de solicitudes contractuales.', new Date()],
      ];
      await nueva.query('INSERT INTO contr_historial (solicitud_id, usuario_id, usuario_nombre, accion, detalle, creado_en) VALUES ?', [hist]);

      await copiarConstancias(id, cons);
    }

    if (!SIMULAR) await nueva.commit();
  } catch (e) {
    if (!SIMULAR) await nueva.rollback();
    throw e;
  } finally {
    await nueva.end();
    await vieja.end();
  }

  console.log(SIMULAR ? '\n=== SIMULACIÓN (no se escribió nada) ===' : '\n=== Migración terminada ===');
  console.log(`Solicitudes en la plataforma anterior: ${r.solicitudes}`);
  console.log(`  migradas: ${r.migradas} · ya existían: ${r.yaExistian}`);
  console.log(`Respuestas pasadas al historial: ${r.respuestas}`);
  console.log(`Constancias pendientes: ${r.constancias} · ${SIMULAR ? 'se copiarían' : 'copiadas'}: ${r.archivosCopiados} · sin archivo: ${r.archivosFaltantes.length}`);
  if (r.constanciasHuerfanas) console.log(`Constancias sin solicitud en la base anterior (se omiten): ${r.constanciasHuerfanas}`);
  if (r.usuariosCreados.length) console.log(`Cuentas creadas con rol Contratación: ${r.usuariosCreados.join(', ')}`);
  if (r.usuariosExistentes.length) console.log(`Cuentas que ya existían (se reutilizan): ${r.usuariosExistentes.join(', ')}`);
  if (r.archivosFaltantes.length && CARPETA) {
    console.log(`Archivos que no se encontraron en ${CARPETA} (primeros 10):`);
    r.archivosFaltantes.slice(0, 10).forEach((f) => console.log(`  - ${f}`));
  }
  if (!CARPETA) console.log('No se indicó --carpeta-anterior: los PDF de las constancias no se copiaron.');
}

main().catch((e) => {
  console.error('✖ Error en la migración:', e.message);
  process.exit(1);
});
