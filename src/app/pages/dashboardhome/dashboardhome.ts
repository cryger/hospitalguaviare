import { Component, computed, inject, signal, OnDestroy } from '@angular/core';
import { CommonModule, DatePipe, registerLocaleData } from '@angular/common';
import localeEsCO from '@angular/common/locales/es-CO';
import { RouterLink } from '@angular/router';
import { toSignal } from '@angular/core/rxjs-interop';

import { CotizacionesService } from '../../shared/services/cotizaciones/cotizaciones';
import { ContratacionService, PqrsfdService } from '../../shared/services/solicitudes/solicitudes.service';
import { TrabajaNosotrosService } from '../../shared/services/trabaja-nosotros/trabaja-nosotros-service';
import { CmsService } from '../../shared/services/cms/cms.service';
import { UsuariosApiService } from '../../shared/services/usuarios/usuarios-api.service';
import { PermisosService } from '../../shared/services/permisos/permisos.service';
import { Modulo } from '../../shared/models/permisos/permisos';
import { ESTADOS_CONTRACTUAL, TIPOS_PQRSFD, nombreTipoPqrsfd } from '../../shared/models/solicitudes/solicitudes';
import { diasHabilesEntre, semaforoDe } from '../../shared/utils/dias-habiles';

type EstadoPQRSF = 'Recibida' | 'En proceso' | 'Respondida' | 'Cerrada';

/** Vista resumida de una PQRSFD para el tablero */
interface PQRSF {
  id: number;
  radicado: string;
  tipo: string;
  asunto: string;
  estado: EstadoPQRSF;
  fechaCreacion: string;
  fechaVencimiento: string;
  fechaRespuesta: string | null;
}

const ESTADO_TABLERO: Record<string, EstadoPQRSF> = {
  radicada: 'Recibida',
  en_tramite: 'En proceso',
  respondida: 'Respondida',
  cerrada: 'Cerrada',
  trasladada: 'Cerrada',
};

registerLocaleData(localeEsCO, 'es-CO');

type Semaforo = 'ok' | 'alerta' | 'vencida';

interface PqrsfPendiente {
  item: PQRSF;
  diasHabiles: number;
  diasRestantes: number;
  semaforo: Semaforo;
}

interface Actividad {
  fecha: Date;
  modulo: string;
  icono: string;
  titulo: string;
  detalle: string;
  ruta: string;
}

interface Alerta {
  nivel: 'danger' | 'warning' | 'info';
  texto: string;
  ruta: string;
  accion: string;
}

@Component({
  selector: 'app-dashboard-home',
  standalone: true,
  imports: [CommonModule, RouterLink, DatePipe],
  templateUrl: './dashboardhome.html',
  styleUrls: ['./dashboardhome.css'],
})
export class DashboardHomeComponent implements OnDestroy {
  private cotizacionesService = inject(CotizacionesService);
  private pqrsfdService = inject(PqrsfdService);
  private contratacionService = inject(ContratacionService);
  private permisos = inject(PermisosService);
  private vacantesService = inject(TrabajaNosotrosService);
  private cms = inject(CmsService);
  private usuariosService = inject(UsuariosApiService);

  /** Cada bloque del tablero se muestra solo si el usuario tiene ese módulo */
  readonly ver = (m: Modulo) => this.permisos.puede(m);

  /* =========================
     FUENTES DE DATOS (reactivas)
  ========================== */
  readonly cotizaciones = toSignal(this.cotizacionesService.cotizaciones$, { initialValue: [] });
  readonly pqrsf = computed<PQRSF[]>(() =>
    this.pqrsfdService.lista().map((p) => ({
      id: p.id,
      radicado: p.radicado,
      tipo: nombreTipoPqrsfd(p.tipo),
      asunto: p.asunto,
      estado: ESTADO_TABLERO[p.estado] ?? 'Recibida',
      fechaCreacion: p.fechaRadicacion,
      fechaVencimiento: p.fechaVencimiento,
      fechaRespuesta: p.fechaRespuesta,
    })),
  );

  /** Solicitudes contractuales pendientes y vencidas */
  readonly kpiContratacion = computed(() => {
    const abiertas = this.contratacionService
      .lista()
      .filter((s) => ESTADOS_CONTRACTUAL.find((e) => e.valor === s.estado)?.abierta);
    return {
      pendientes: abiertas.length,
      vencidas: abiertas.filter((s) => semaforoDe(s.fechaVencimiento, true, this.ahora()).estado === 'vencida').length,
      total: this.contratacionService.total(),
    };
  });
  readonly vacantes = toSignal(this.vacantesService.vacantesObservable(), { initialValue: [] });

  /** Noticias = entradas del CMS de tipo "noticia" */
  readonly noticias = computed(() => {
    const mm = this.cms.multimediaPorId();
    return this.cms
      .entradas()
      .filter((e) => e.tipo === 'noticia')
      .map((e) => {
        const img = e.imagenDestacadaId ? mm.get(e.imagenDestacadaId) : undefined;
        return {
          id: e.id,
          titulo: e.titulo,
          estado: e.estado,
          autor: e.autor,
          fechaPublicacion: e.fechaPublicacion || e.creadoEn,
          imagenUrl: img?.tipo === 'imagen' ? img.url : '',
        };
      });
  });

  /** Páginas de Transparencia (Res. 1519) que deberían tener contenido */
  private readonly seccionesTransparencia = computed(() => {
    const raiz = this.cms.paginas().find((p) => p.slug === 'transparencia' && p.parentId === null);
    if (!raiz) return [];
    const ids = this.cms.descendientes(raiz.id);
    ids.delete(raiz.id);
    const conHijas = new Set(this.cms.paginas().map((p) => p.parentId));
    // hojas del árbol que no son enlaces: ahí va la información
    return this.cms.paginas().filter((p) => ids.has(p.id) && p.plantilla !== 'enlace' && !conHijas.has(p.id));
  });
  readonly usuarios = this.usuariosService.usuarios;

  /* =========================
     ENCABEZADO
  ========================== */
  readonly ahora = signal(new Date());
  private reloj = setInterval(() => this.ahora.set(new Date()), 60_000);

  readonly nombreUsuario = this.permisos.usuario()?.nombre || 'Administrador';

  readonly saludo = computed(() => {
    const h = this.ahora().getHours();
    if (h < 12) return 'Buenos días';
    if (h < 19) return 'Buenas tardes';
    return 'Buenas noches';
  });

  /* =========================
     KPIs
  ========================== */
  readonly kpiNoticias = computed(() => {
    const n = this.noticias();
    return {
      total: n.length,
      publicadas: n.filter((x) => x.estado === 'publicada').length,
      borradores: n.filter((x) => x.estado === 'borrador').length,
      archivadas: n.filter((x) => x.estado === 'archivada').length,
    };
  });

  readonly kpiCotizaciones = computed(() => {
    const c = this.cotizaciones();
    return {
      total: c.length,
      publicadas: c.filter((x) => x.estado === 'publicada').length,
      borradores: c.filter((x) => x.estado === 'borrador').length,
    };
  });

  readonly kpiVacantes = computed(() => {
    const v = this.vacantes();
    const publicadas = v.filter((x) => x.estado === 'publicada');
    return {
      total: v.length,
      publicadas: publicadas.length,
      plazas: publicadas.reduce((acc, x) => acc + (Number(x.vacantes) || 0), 0),
    };
  });

  readonly kpiTransparencia = computed(() => {
    const secciones = this.seccionesTransparencia();
    const conContenido = secciones.filter((p) =>
      this.cms.entradas().some((e) => e.paginaId === p.id && this.cms.esEntradaPublica(e)),
    ).length;
    return {
      secciones: secciones.length,
      conContenido,
      cumplimiento: secciones.length ? Math.round((conContenido / secciones.length) * 100) : 0,
    };
  });

  readonly kpiContenido = computed(() => {
    const p = this.cms.paginas();
    const e = this.cms.entradas();
    return {
      paginas: p.filter((x) => x.estado === 'publicada').length,
      entradas: e.filter((x) => this.cms.esEntradaPublica(x)).length,
      borradores: e.filter((x) => x.estado === 'borrador').length,
      archivos: this.cms.multimedia().length,
    };
  });

  readonly kpiUsuarios = computed(() => {
    const u = this.usuarios();
    return {
      total: u.length,
      activos: u.filter((x) => x.activo).length,
      admins: u.filter((x) => x.rol === 'admin').length,
    };
  });

  /* =========================
     PQRSF
  ========================== */
  readonly tiposPqrsf: string[] = TIPOS_PQRSFD.map((t) => t.nombre);
  readonly estadosPqrsf: EstadoPQRSF[] = ['Recibida', 'En proceso', 'Respondida', 'Cerrada'];

  readonly pqrsfPendientes = computed<PqrsfPendiente[]>(() =>
    this.pqrsf()
      .filter((p) => p.estado === 'Recibida' || p.estado === 'En proceso')
      .map((item) => {
        const s = semaforoDe(item.fechaVencimiento, true, this.ahora());
        const diasHabiles = diasHabilesEntre(item.fechaCreacion, this.ahora());
        return { item, diasHabiles, diasRestantes: s.diasRestantes, semaforo: s.estado as Semaforo };
      })
      .sort((a, b) => new Date(a.item.fechaVencimiento).getTime() - new Date(b.item.fechaVencimiento).getTime()),
  );

  readonly kpiPqrsf = computed(() => {
    const todas = this.pqrsf();
    const pend = this.pqrsfPendientes();
    const respondidas = todas.filter((p) => p.estado === 'Respondida' || p.estado === 'Cerrada');

    // Tiempo promedio de respuesta (días hábiles) de las respondidas
    const conRespuesta = respondidas.filter((p) => p.fechaRespuesta);
    const promedio = conRespuesta.length
      ? conRespuesta.reduce(
          (acc, p) => acc + diasHabilesEntre(p.fechaCreacion, p.fechaRespuesta!),
          0,
        ) / conRespuesta.length
      : null;

    return {
      total: todas.length,
      pendientes: pend.length,
      vencidas: pend.filter((p) => p.semaforo === 'vencida').length,
      porVencer: pend.filter((p) => p.semaforo === 'alerta').length,
      respondidas: respondidas.length,
      cumplimiento: todas.length ? Math.round((respondidas.length / todas.length) * 100) : 0,
      promedioRespuesta: promedio !== null ? Math.round(promedio * 10) / 10 : null,
    };
  });

  readonly pqrsfPorTipo = computed(() => {
    const todas = this.pqrsf();
    const max = Math.max(1, ...this.tiposPqrsf.map((t) => todas.filter((p) => p.tipo === t).length));
    return this.tiposPqrsf.map((tipo) => {
      const cantidad = todas.filter((p) => p.tipo === tipo).length;
      return { tipo, cantidad, porcentaje: (cantidad / max) * 100 };
    });
  });

  readonly pqrsfPorEstado = computed(() => {
    const todas = this.pqrsf();
    const total = Math.max(1, todas.length);
    return this.estadosPqrsf.map((estado) => {
      const cantidad = todas.filter((p) => p.estado === estado).length;
      return { estado, cantidad, porcentaje: (cantidad / total) * 100 };
    });
  });

  /* =========================
     LISTADOS
  ========================== */
  readonly ultimasNoticias = computed(() =>
    [...this.noticias()]
      .sort((a, b) => this.time(b.fechaPublicacion) - this.time(a.fechaPublicacion))
      .slice(0, 5),
  );

  readonly actividadReciente = computed<Actividad[]>(() => {
    const items: Actividad[] = [
      ...this.noticias().map((n) => ({
        fecha: new Date(n.fechaPublicacion),
        modulo: 'Noticias',
        icono: '📰',
        titulo: n.titulo,
        detalle: n.estado,
        ruta: '/admin/contenido/entradas',
      })),
      ...this.cotizaciones().map((c) => ({
        fecha: new Date(c.fechaPublicacion),
        modulo: 'Cotizaciones',
        icono: '💼',
        titulo: c.titulo,
        detalle: c.estado,
        ruta: '/admin/cotizaciones',
      })),
      ...this.vacantes().map((v) => ({
        fecha: new Date(v.fechaPublicacion),
        modulo: 'Vacantes',
        icono: '🧑‍⚕️',
        titulo: v.titulo,
        detalle: v.estado,
        ruta: '/admin/vacantes',
      })),
      ...this.pqrsf().map((p) => ({
        fecha: new Date(p.fechaRespuesta ?? p.fechaCreacion),
        modulo: 'PQRSFD',
        icono: '📬',
        titulo: `${p.tipo}: ${p.asunto}`,
        detalle: p.estado,
        ruta: '/admin/pqrsf',
      })),
    ];
    return items
      .filter((a) => !isNaN(a.fecha.getTime()))
      .sort((a, b) => b.fecha.getTime() - a.fecha.getTime())
      .slice(0, 8);
  });

  /* =========================
     ALERTAS DE GESTIÓN
  ========================== */
  readonly alertas = computed<Alerta[]>(() => {
    const a: Alerta[] = [];
    const k = this.kpiPqrsf();

    if (this.ver('pqrsfd') && k.vencidas > 0) {
      a.push({
        nivel: 'danger',
        texto: `${k.vencidas} PQRSFD superan el plazo legal de respuesta.`,
        ruta: '/admin/pqrsf',
        accion: 'Responder',
      });
    }
    if (this.ver('pqrsfd') && k.porVencer > 0) {
      a.push({
        nivel: 'warning',
        texto: `${k.porVencer} PQRSFD vencen en 3 días hábiles o menos.`,
        ruta: '/admin/pqrsf',
        accion: 'Revisar',
      });
    }
    const kc = this.kpiContratacion();
    if (this.ver('contratacion') && kc.vencidas > 0) {
      a.push({
        nivel: 'danger',
        texto: `${kc.vencidas} solicitud(es) contractual(es) superan el plazo de 10 días hábiles.`,
        ruta: '/admin/solicitudes-contractuales',
        accion: 'Responder',
      });
    }
    // Las alertas de contenido solo para quien administra el contenido
    if (!this.ver('contenido')) return a;

    const borradores = this.kpiNoticias().borradores;
    if (borradores > 0) {
      a.push({
        nivel: 'info',
        texto: `${borradores} noticia(s) en borrador sin publicar.`,
        ruta: '/admin/contenido/entradas',
        accion: 'Ver',
      });
    }

    const sinImagen = this.noticias().filter((n) => n.estado === 'publicada' && !n.imagenUrl).length;
    if (sinImagen > 0) {
      a.push({
        nivel: 'info',
        texto: `${sinImagen} noticia(s) publicadas no tienen imagen.`,
        ruta: '/admin/contenido/entradas',
        accion: 'Completar',
      });
    }

    // Transparencia (ITA - Res. 1519 de 2020): secciones sin información publicada
    const t = this.kpiTransparencia();
    const vacias = t.secciones - t.conContenido;
    if (vacias > 0) {
      a.push({
        nivel: 'warning',
        texto: `${vacias} de ${t.secciones} secciones de Transparencia aún no tienen información publicada.`,
        ruta: '/admin/contenido/paginas',
        accion: 'Completar',
      });
    }

    const borradoresCms = this.kpiContenido().borradores - this.kpiNoticias().borradores;
    if (borradoresCms > 0) {
      a.push({
        nivel: 'info',
        texto: `${borradoresCms} entrada(s) del portal en borrador.`,
        ruta: '/admin/contenido/entradas',
        accion: 'Revisar',
      });
    }

    const cotBorrador = this.kpiCotizaciones().borradores;
    if (cotBorrador > 0) {
      a.push({
        nivel: 'info',
        texto: `${cotBorrador} cotización(es) en borrador.`,
        ruta: '/admin/cotizaciones',
        accion: 'Ver',
      });
    }

    return a;
  });

  /* =========================
     ACCESOS RÁPIDOS
  ========================== */
  readonly accesosRapidos = (
    [
      { icono: '📰', texto: 'Nueva entrada', ruta: '/admin/contenido/entradas/nueva', modulo: 'contenido' },
      { icono: '📬', texto: 'Gestionar PQRSFD', ruta: '/admin/pqrsf', modulo: 'pqrsfd' },
      { icono: '📄', texto: 'Solicitudes contractuales', ruta: '/admin/solicitudes-contractuales', modulo: 'contratacion' },
      { icono: '🧭', texto: 'Menús y páginas', ruta: '/admin/contenido/menus', modulo: 'contenido' },
      { icono: '🖼️', texto: 'Multimedia', ruta: '/admin/contenido/multimedia', modulo: 'contenido' },
      { icono: '💼', texto: 'Nueva cotización', ruta: '/admin/cotizaciones', modulo: 'cotizaciones' },
      { icono: '🧑‍⚕️', texto: 'Nueva vacante', ruta: '/admin/vacantes', modulo: 'vacantes' },
      { icono: '👥', texto: 'Usuarios', ruta: '/admin/usuarios', modulo: 'usuarios' },
    ] as { icono: string; texto: string; ruta: string; modulo: Modulo }[]
  ).filter((x) => this.ver(x.modulo));

  /* =========================
     HELPERS
  ========================== */
  private time(d: Date | string): number {
    const t = new Date(d).getTime();
    return isNaN(t) ? 0 : t;
  }

  constructor() {
    this.cms.cargar();
    if (this.ver('pqrsfd')) this.pqrsfdService.cargar(true);
    if (this.ver('contratacion')) this.contratacionService.cargar(true);
    if (this.ver('usuarios')) this.usuariosService.cargar().catch(() => {});
  }

  ngOnDestroy(): void {
    clearInterval(this.reloj);
  }
}
