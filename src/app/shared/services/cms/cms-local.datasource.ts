import { inject, Injectable } from '@angular/core';
import { Observable, defer, of, throwError } from 'rxjs';
import { CMS_CONFIG } from './cms-config';
import {
  CambioOrdenPagina,
  CmsColeccion,
  CmsDataSource,
  MetaArchivo,
  tipoDesdeMime,
} from './cms-datasource';
import { CmsEntrada, CmsMenu, CmsMultimedia, CmsPagina } from '../../models/cms/cms.models';
import { COTIZACIONES_SEMILLA, VACANTES_SEMILLA } from './cms-semilla-modulos';

/**
 * Implementación en localStorage para trabajar el admin sin backend.
 * Emula las reglas de la BD (cascadas y SET NULL) para que el
 * comportamiento sea el mismo cuando se cambie a la API.
 *
 * ⚠️ localStorage tiene ~5 MB: los archivos se guardan como base64
 * y solo sirven para pruebas. Para producción usar modo 'api'.
 */
@Injectable()
export class CmsLocalDataSource extends CmsDataSource {
  private config = inject(CMS_CONFIG);
  private prefijo = 'cms-';
  private limiteLocalMb = 2;

  constructor() {
    super();
    this.sembrarSiVacio();
    this.sembrarModulos();
    this.actualizarSemilla();
  }

  /* ===== Helpers de almacenamiento ===== */
  private leer<T>(c: CmsColeccion): T[] {
    try {
      return JSON.parse(localStorage.getItem(this.prefijo + c) || '[]');
    } catch {
      return [];
    }
  }

  private escribir<T>(c: CmsColeccion, data: T[]): void {
    try {
      localStorage.setItem(this.prefijo + c, JSON.stringify(data));
    } catch (e) {
      throw new Error(
        'Se llenó el almacenamiento local del navegador. Elimine archivos de la biblioteca o conecte la API.',
      );
    }
  }

  private nuevoId(lista: { id: number }[]): number {
    return lista.reduce((max, x) => Math.max(max, x.id), 0) + 1;
  }

  private ahora(): string {
    return new Date().toISOString();
  }

  /* ===== CRUD ===== */
  listar<T>(c: CmsColeccion): Observable<T[]> {
    return of(this.leer<T>(c));
  }

  crear<T>(c: CmsColeccion, data: Partial<T>): Observable<T> {
    return defer(() => {
      const lista = this.leer<any>(c);
      const item = { ...data, id: this.nuevoId(lista), creadoEn: this.ahora(), actualizadoEn: this.ahora() };
      lista.push(item);
      this.escribir(c, lista);
      return of(item as T);
    });
  }

  actualizar<T>(c: CmsColeccion, id: number, data: Partial<T>): Observable<T> {
    return defer(() => {
      const lista = this.leer<any>(c);
      const i = lista.findIndex((x) => x.id === id);
      if (i === -1) return throwError(() => new Error('Registro no encontrado'));
      lista[i] = { ...lista[i], ...data, id, actualizadoEn: this.ahora() };
      this.escribir(c, lista);
      return of(lista[i] as T);
    });
  }

  eliminar(c: CmsColeccion, id: number): Observable<void> {
    return defer(() => {
      this.escribir(c, this.leer<any>(c).filter((x) => x.id !== id));

      // Reglas equivalentes a las FOREIGN KEY de MySQL
      if (c === 'menus') {
        this.escribir('paginas', this.leer<CmsPagina>('paginas').map((p) => (p.menuId === id ? { ...p, menuId: null } : p)));
      }
      if (c === 'paginas') {
        this.escribir('paginas', this.leer<CmsPagina>('paginas').map((p) => (p.parentId === id ? { ...p, parentId: null } : p)));
        this.escribir('entradas', this.leer<CmsEntrada>('entradas').filter((e) => e.paginaId !== id));
      }
      if (c === 'multimedia') {
        this.escribir(
          'entradas',
          this.leer<CmsEntrada>('entradas').map((e) => ({
            ...e,
            imagenDestacadaId: e.imagenDestacadaId === id ? null : e.imagenDestacadaId,
            multimediaIds: (e.multimediaIds || []).filter((m) => m !== id),
          })),
        );
      }
      return of(void 0);
    });
  }

  reordenarPaginas(cambios: CambioOrdenPagina[]): Observable<void> {
    return defer(() => {
      const mapa = new Map(cambios.map((c) => [c.id, c]));
      const paginas = this.leer<CmsPagina>('paginas').map((p) => {
        const c = mapa.get(p.id);
        return c ? { ...p, menuId: c.menuId, parentId: c.parentId, orden: c.orden } : p;
      });
      this.escribir('paginas', paginas);
      return of(void 0);
    });
  }

  subirArchivo(archivo: File, meta: MetaArchivo = {}): Observable<CmsMultimedia> {
    const limite = Math.min(this.limiteLocalMb, this.config.maxArchivoMb);
    if (archivo.size > limite * 1024 * 1024) {
      return throwError(
        () => new Error(`En modo local el límite es ${limite} MB por archivo. "${archivo.name}" es más grande.`),
      );
    }
    return new Observable<CmsMultimedia>((sub) => {
      const lector = new FileReader();
      lector.onload = () => {
        this.crear<CmsMultimedia>('multimedia', {
          nombre: archivo.name,
          url: String(lector.result),
          tipo: tipoDesdeMime(archivo.type, archivo.name),
          mime: archivo.type,
          tamano: archivo.size,
          titulo: meta.titulo || archivo.name.replace(/\.[^.]+$/, ''),
          alt: meta.alt || '',
          descripcion: meta.descripcion || '',
        }).subscribe({ next: (m) => (sub.next(m), sub.complete()), error: (e) => sub.error(e) });
      };
      lector.onerror = () => sub.error(new Error('No se pudo leer el archivo'));
      lector.readAsDataURL(archivo);
    });
  }

  registrarUrl(data: Partial<CmsMultimedia>): Observable<CmsMultimedia> {
    return this.crear<CmsMultimedia>('multimedia', data);
  }

  /* ===== Estructura inicial (Resolución 1519 de 2020) ===== */
  private readonly versionSemilla = 7;

  private sembrarSiVacio(): void {
    if (localStorage.getItem(this.prefijo + 'menus')) return;
    this.cargarSemilla();
  }

  private cargarSemilla(): void {
    const t = this.ahora();
    const menus: CmsMenu[] = [
      { id: 1, nombre: 'Menú principal', ubicacion: 'principal', activo: true },
      { id: 2, nombre: 'Pie de página', ubicacion: 'pie', activo: true },
    ];
    const paginas: CmsPagina[] = ESTRUCTURA_1519.map((p) => ({
      visibleEnMenu: true,
      estado: 'publicada',
      creadoEn: t,
      actualizadoEn: t,
      ...p,
    }));
    localStorage.setItem(this.prefijo + 'menus', JSON.stringify(menus));
    localStorage.setItem(this.prefijo + 'paginas', JSON.stringify(paginas));
    localStorage.setItem(this.prefijo + 'entradas', '[]');
    if (!localStorage.getItem(this.prefijo + 'multimedia')) localStorage.setItem(this.prefijo + 'multimedia', '[]');
    localStorage.setItem(this.prefijo + 'version', String(this.versionSemilla));
  }

  /** Vacantes e invitaciones a cotizar migradas del portal anterior (solo si están vacías) */
  private sembrarModulos(): void {
    const clave = this.prefijo + 'modulos-semilla';
    if (localStorage.getItem(clave) === '1') return;
    const t = this.ahora();
    const sembrar = (c: CmsColeccion, datos: object[]) => {
      if (this.leer(c).length) return;
      this.escribir(c, datos.map((d, i) => ({ ...d, id: i + 1, creadoEn: t, actualizadoEn: t })));
    };
    sembrar('vacantes', VACANTES_SEMILLA);
    sembrar('cotizaciones', COTIZACIONES_SEMILLA);
    localStorage.setItem(clave, '1');
  }

  /**
   * Modo local: actualiza los datos guardados en el navegador.
   * - Versión 1-2 (estructura anterior a la Res. 1519): se reemplaza la estructura.
   * - Versión 3 en adelante: solo se AGREGAN las páginas nuevas que falten (por slug),
   *   sin borrar ni modificar lo que ya existe.
   */
  private actualizarSemilla(): void {
    const version = Number(localStorage.getItem(this.prefijo + 'version') || 1);
    if (version >= this.versionSemilla) return;
    if (version < 3) {
      this.cargarSemilla();
      return;
    }

    const paginas = this.leer<CmsPagina>('paginas');
    const menus = this.leer<CmsMenu>('menus');
    const porSlug = new Map(paginas.map((p) => [p.slug, p]));
    const semillaPorId = new Map(ESTRUCTURA_1519.map((p) => [p.id, p]));
    const t = this.ahora();
    let id = this.nuevoId(paginas);

    for (const s of ESTRUCTURA_1519) {
      if (porSlug.has(s.slug)) continue;
      const padreSemilla = s.parentId !== null ? semillaPorId.get(s.parentId) : undefined;
      const padre = padreSemilla ? porSlug.get(padreSemilla.slug) : undefined;
      if (padreSemilla && !padre) continue; // el padre fue eliminado por el usuario
      const ubicacion = s.menuId === 2 ? 'pie' : 'principal';
      const nueva: CmsPagina = {
        visibleEnMenu: true,
        estado: 'publicada',
        creadoEn: t,
        actualizadoEn: t,
        ...s,
        id: id++,
        parentId: padre?.id ?? null,
        menuId: padre?.menuId ?? menus.find((m) => m.ubicacion === ubicacion)?.id ?? null,
      };
      paginas.push(nueva);
      porSlug.set(nueva.slug, nueva);
    }

    // Versión 5: "Información de interés" agrupa Invitaciones a cotizar y Trabaja con nosotros
    const info = porSlug.get('informacion-de-interes');
    if (version < 5 && info) {
      for (const p of paginas) {
        const s = ESTRUCTURA_1519.find((x) => x.slug === p.slug && x.parentId === 83);
        if (s) Object.assign(p, { parentId: info.id, menuId: info.menuId, titulo: s.titulo, plantilla: 'enlace', urlExterna: s.urlExterna, orden: s.orden, visibleEnMenu: true, actualizadoEn: t });
        if (p.slug === 'noticias' && p.parentId === null) p.orden = 5;
      }
    }

    // Versión 7: orden del menú principal
    // Transparencia · Nuestro Hospital · Atención y servicios a la ciudadanía · Participa · Información de interés
    if (version < 7) {
      const orden: Record<string, number> = {
        transparencia: 0,
        'nuestro-hospital': 1,
        'atencion-y-servicios-a-la-ciudadania': 2,
        participa: 3,
        'informacion-de-interes': 4,
      };
      for (const p of paginas) {
        if (p.parentId === null && p.slug in orden) Object.assign(p, { orden: orden[p.slug], actualizadoEn: t });
      }
    }
    this.escribir('paginas', paginas);
    localStorage.setItem(this.prefijo + 'version', String(this.versionSemilla));
  }
}

type PaginaSemilla = Omit<CmsPagina, 'creadoEn' | 'actualizadoEn' | 'visibleEnMenu' | 'estado'> &
  Partial<Pick<CmsPagina, 'visibleEnMenu' | 'estado'>>;

/** Generada a partir de database/cms-schema.sql (misma estructura e ids) */
const ESTRUCTURA_1519: PaginaSemilla[] = [
  { id: 1, menuId: 1, parentId: null, titulo: "Transparencia y acceso a la información pública", slug: 'transparencia', plantilla: 'contenido', descripcion: "Información pública de la E.S.E. Hospital San José del Guaviare, organizada según la Ley 1712 de 2014 y la Resolución 1519 de 2020 de MinTIC.", orden: 0 },
  { id: 2, menuId: 1, parentId: 1, titulo: "1. Información de la entidad", slug: 'informacion-de-la-entidad', plantilla: 'contenido', orden: 0 },
  { id: 3, menuId: 1, parentId: 2, titulo: "1.1 Misión, visión, funciones y deberes", slug: 'mision-vision-funciones-y-deberes', plantilla: 'contenido', orden: 0 },
  { id: 4, menuId: 1, parentId: 2, titulo: "1.2 Estructura orgánica - Organigrama", slug: 'estructura-organica-organigrama', plantilla: 'contenido', orden: 1 },
  { id: 5, menuId: 1, parentId: 2, titulo: "1.3 Mapas y cartas descriptivas de los procesos", slug: 'mapas-y-cartas-descriptivas-de-los-procesos', plantilla: 'documentos', orden: 2 },
  { id: 6, menuId: 1, parentId: 2, titulo: "1.4 Directorio institucional", slug: 'directorio-institucional', plantilla: 'contenido', orden: 3 },
  { id: 7, menuId: 1, parentId: 2, titulo: "1.5 Directorio de servidores públicos, empleados o contratistas", slug: 'directorio-de-servidores-publicos-empleados-o-contratistas', plantilla: 'documentos', orden: 4 },
  { id: 8, menuId: 1, parentId: 2, titulo: "1.6 Directorio de entidades", slug: 'directorio-de-entidades', plantilla: 'contenido', orden: 5 },
  { id: 9, menuId: 1, parentId: 2, titulo: "1.7 Directorio de agremiaciones, asociaciones y otros grupos de interés", slug: 'directorio-de-agremiaciones-asociaciones-y-otros-grupos-de-interes', plantilla: 'contenido', orden: 6 },
  { id: 10, menuId: 1, parentId: 2, titulo: "1.8 Servicio al público, normas, formularios y protocolos de atención", slug: 'servicio-al-publico-normas-formularios-y-protocolos-de-atencion', plantilla: 'documentos', orden: 7 },
  { id: 11, menuId: 1, parentId: 2, titulo: "1.9 Procedimientos que se siguen para tomar decisiones en las diferentes áreas", slug: 'procedimientos-que-se-siguen-para-tomar-decisiones-en-las-diferentes-areas', plantilla: 'documentos', orden: 8 },
  { id: 12, menuId: 1, parentId: 2, titulo: "1.10 Mecanismo de presentación directa de solicitudes, quejas y reclamos", slug: 'mecanismo-pqrsd', plantilla: 'enlace', urlExterna: '/pqrsf', orden: 9 },
  { id: 13, menuId: 1, parentId: 2, titulo: "1.11 Calendario de actividades y eventos", slug: 'calendario-de-actividades-y-eventos', plantilla: 'contenido', orden: 10 },
  { id: 14, menuId: 1, parentId: 2, titulo: "1.12 Información sobre decisiones que pueden afectar al público", slug: 'informacion-sobre-decisiones-que-pueden-afectar-al-publico', plantilla: 'documentos', orden: 11 },
  { id: 15, menuId: 1, parentId: 2, titulo: "1.13 Entes y autoridades que lo vigilan", slug: 'entes-y-autoridades-que-lo-vigilan', plantilla: 'contenido', orden: 12 },
  { id: 16, menuId: 1, parentId: 2, titulo: "1.14 Publicación de hojas de vida", slug: 'publicacion-de-hojas-de-vida', plantilla: 'documentos', orden: 13 },
  { id: 17, menuId: 1, parentId: 1, titulo: "2. Normativa", slug: 'normativa', plantilla: 'contenido', orden: 1 },
  { id: 18, menuId: 1, parentId: 17, titulo: "2.1 Normativa de la entidad", slug: 'normativa-de-la-entidad', plantilla: 'contenido', orden: 0 },
  { id: 19, menuId: 1, parentId: 18, titulo: "2.1.1 Leyes", slug: 'leyes', plantilla: 'documentos', orden: 0 },
  { id: 20, menuId: 1, parentId: 18, titulo: "2.1.2 Decreto único reglamentario", slug: 'decreto-unico-reglamentario', plantilla: 'documentos', orden: 1 },
  { id: 21, menuId: 1, parentId: 18, titulo: "2.1.3 Normativa aplicable", slug: 'normativa-aplicable', plantilla: 'documentos', orden: 2 },
  { id: 22, menuId: 1, parentId: 18, titulo: "2.1.4 Vínculo al Diario o Gaceta Oficial", slug: 'vinculo-al-diario-o-gaceta-oficial', plantilla: 'enlace', urlExterna: 'http://www.imprenta.gov.co/diario-oficial', orden: 3 },
  { id: 23, menuId: 1, parentId: 18, titulo: "2.1.5 Políticas, lineamientos y manuales", slug: 'politicas-lineamientos-y-manuales', plantilla: 'documentos', orden: 4 },
  { id: 24, menuId: 1, parentId: 18, titulo: "2.1.6 Agenda regulatoria", slug: 'agenda-regulatoria', plantilla: 'documentos', orden: 5 },
  { id: 25, menuId: 1, parentId: 17, titulo: "2.2 Búsqueda de normas", slug: 'busqueda-de-normas', plantilla: 'contenido', orden: 1 },
  { id: 26, menuId: 1, parentId: 25, titulo: "2.2.1 Sistema Único de Información Normativa - SUIN", slug: 'sistema-unico-de-informacion-normativa-suin', plantilla: 'enlace', urlExterna: 'https://www.suin-juriscol.gov.co', orden: 0 },
  { id: 27, menuId: 1, parentId: 25, titulo: "2.2.2 Sistema de búsqueda de normas propio de la entidad", slug: 'sistema-de-busqueda-de-normas-propio-de-la-entidad', plantilla: 'documentos', orden: 1 },
  { id: 28, menuId: 1, parentId: 17, titulo: "2.3 Proyectos de normas para comentarios", slug: 'proyectos-de-normas-para-comentarios', plantilla: 'documentos', orden: 2 },
  { id: 29, menuId: 1, parentId: 1, titulo: "3. Contratación", slug: 'contratacion', plantilla: 'contenido', orden: 2 },
  { id: 30, menuId: 1, parentId: 29, titulo: "3.1 Plan Anual de Adquisiciones", slug: 'plan-anual-de-adquisiciones', plantilla: 'documentos', orden: 0 },
  { id: 31, menuId: 1, parentId: 29, titulo: "3.2 Publicación de la información contractual", slug: 'publicacion-de-la-informacion-contractual', plantilla: 'documentos', orden: 1 },
  { id: 32, menuId: 1, parentId: 29, titulo: "3.3 Publicación de la ejecución de los contratos", slug: 'publicacion-de-la-ejecucion-de-los-contratos', plantilla: 'documentos', orden: 2 },
  { id: 33, menuId: 1, parentId: 29, titulo: "3.4 Manual de contratación, adquisición y/o compras", slug: 'manual-de-contratacion-adquisicion-yo-compras', plantilla: 'documentos', orden: 3 },
  { id: 34, menuId: 1, parentId: 29, titulo: "3.5 Formatos o modelos de contratos o pliegos tipo", slug: 'formatos-o-modelos-de-contratos-o-pliegos-tipo', plantilla: 'documentos', orden: 4 },
  { id: 35, menuId: 1, parentId: 1, titulo: "4. Planeación, presupuesto e informes", slug: 'planeacion-presupuesto-e-informes', plantilla: 'contenido', orden: 3 },
  { id: 36, menuId: 1, parentId: 35, titulo: "4.1 Presupuesto general de ingresos, gastos e inversión", slug: 'presupuesto-general-de-ingresos-gastos-e-inversion', plantilla: 'documentos', orden: 0 },
  { id: 37, menuId: 1, parentId: 35, titulo: "4.2 Ejecución presupuestal", slug: 'ejecucion-presupuestal', plantilla: 'documentos', orden: 1 },
  { id: 38, menuId: 1, parentId: 35, titulo: "4.3 Plan de acción", slug: 'plan-de-accion', plantilla: 'documentos', orden: 2 },
  { id: 39, menuId: 1, parentId: 35, titulo: "4.4 Proyectos de inversión", slug: 'proyectos-de-inversion', plantilla: 'documentos', orden: 3 },
  { id: 40, menuId: 1, parentId: 35, titulo: "4.5 Informes de empalme", slug: 'informes-de-empalme', plantilla: 'documentos', orden: 4 },
  { id: 41, menuId: 1, parentId: 35, titulo: "4.6 Información pública y/o relevante", slug: 'informacion-publica-yo-relevante', plantilla: 'documentos', orden: 5 },
  { id: 42, menuId: 1, parentId: 35, titulo: "4.7 Informes de gestión, evaluación y auditoría", slug: 'informes-de-gestion-evaluacion-y-auditoria', plantilla: 'documentos', orden: 6 },
  { id: 43, menuId: 1, parentId: 35, titulo: "4.8 Informes de la Oficina de Control Interno", slug: 'informes-de-la-oficina-de-control-interno', plantilla: 'documentos', orden: 7 },
  { id: 44, menuId: 1, parentId: 35, titulo: "4.9 Informe sobre defensa pública y prevención del daño antijurídico", slug: 'informe-sobre-defensa-publica-y-prevencion-del-dano-antijuridico', plantilla: 'documentos', orden: 8 },
  { id: 45, menuId: 1, parentId: 35, titulo: "4.10 Informes trimestrales sobre acceso a información, quejas y reclamos", slug: 'informes-trimestrales-sobre-acceso-a-informacion-quejas-y-reclamos', plantilla: 'documentos', orden: 9 },
  { id: 46, menuId: 1, parentId: 1, titulo: "5. Trámites", slug: 'tramites-transparencia', plantilla: 'enlace', urlExterna: '/atencion-y-servicios-a-la-ciudadania/tramites-y-otros-procedimientos', orden: 4 },
  { id: 47, menuId: 1, parentId: 1, titulo: "6. Participa", slug: 'participa-transparencia', plantilla: 'enlace', urlExterna: '/participa', orden: 5 },
  { id: 48, menuId: 1, parentId: 1, titulo: "7. Datos abiertos", slug: 'datos-abiertos', plantilla: 'contenido', orden: 6 },
  { id: 49, menuId: 1, parentId: 48, titulo: "7.1 Instrumentos de gestión de la información", slug: 'instrumentos-de-gestion-de-la-informacion', plantilla: 'contenido', orden: 0 },
  { id: 50, menuId: 1, parentId: 49, titulo: "7.1.1 Registro de activos de información", slug: 'registro-de-activos-de-informacion', plantilla: 'documentos', orden: 0 },
  { id: 51, menuId: 1, parentId: 49, titulo: "7.1.2 Índice de información clasificada y reservada", slug: 'indice-de-informacion-clasificada-y-reservada', plantilla: 'documentos', orden: 1 },
  { id: 52, menuId: 1, parentId: 49, titulo: "7.1.3 Esquema de publicación de la información", slug: 'esquema-de-publicacion-de-la-informacion', plantilla: 'documentos', orden: 2 },
  { id: 53, menuId: 1, parentId: 49, titulo: "7.1.4 Programa de Gestión Documental", slug: 'programa-de-gestion-documental', plantilla: 'documentos', orden: 3 },
  { id: 54, menuId: 1, parentId: 49, titulo: "7.1.5 Tablas de Retención Documental", slug: 'tablas-de-retencion-documental', plantilla: 'documentos', orden: 4 },
  { id: 55, menuId: 1, parentId: 49, titulo: "7.1.6 Costos de reproducción de la información pública", slug: 'costos-de-reproduccion-de-la-informacion-publica', plantilla: 'documentos', orden: 5 },
  { id: 56, menuId: 1, parentId: 48, titulo: "7.2 Sección de datos abiertos", slug: 'seccion-de-datos-abiertos', plantilla: 'enlace', urlExterna: 'https://www.datos.gov.co', orden: 1 },
  { id: 57, menuId: 1, parentId: 1, titulo: "8. Información específica para grupos de interés", slug: 'informacion-especifica-para-grupos-de-interes', plantilla: 'contenido', orden: 7 },
  { id: 58, menuId: 1, parentId: 57, titulo: "8.1 Información para niñas, niños y adolescentes", slug: 'informacion-para-ninas-ninos-y-adolescentes', plantilla: 'contenido', orden: 0 },
  { id: 59, menuId: 1, parentId: 57, titulo: "8.2 Información para mujeres", slug: 'informacion-para-mujeres', plantilla: 'contenido', orden: 1 },
  { id: 60, menuId: 1, parentId: 57, titulo: "8.3 Otros grupos de interés", slug: 'otros-grupos-de-interes', plantilla: 'contenido', orden: 2 },
  { id: 61, menuId: 1, parentId: 1, titulo: "9. Obligación de reporte de información específica por parte de la entidad", slug: 'reporte-de-informacion-especifica', plantilla: 'documentos', orden: 8 },
  { id: 62, menuId: 1, parentId: null, titulo: "Atención y servicios a la ciudadanía", slug: 'atencion-y-servicios-a-la-ciudadania', plantilla: 'contenido', descripcion: "Trámites, canales de atención y mecanismos para presentar peticiones, quejas, reclamos, sugerencias y denuncias.", orden: 2 },
  { id: 63, menuId: 1, parentId: 62, titulo: "Trámites y otros procedimientos", slug: 'tramites-y-otros-procedimientos', plantilla: 'contenido', orden: 0 },
  { id: 64, menuId: 1, parentId: 62, titulo: "Canales de atención y pida una cita", slug: 'canales-de-atencion', plantilla: 'contenido', orden: 1 },
  { id: 65, menuId: 1, parentId: 62, titulo: "PQRSD - Peticiones, quejas, reclamos, sugerencias y denuncias", slug: 'pqrsd', plantilla: 'enlace', urlExterna: '/pqrsf', orden: 2 },
  { id: 66, menuId: 1, parentId: 62, titulo: "Carpeta Ciudadana Digital", slug: 'carpeta-ciudadana-digital', plantilla: 'enlace', urlExterna: 'https://carpetaciudadana.and.gov.co/', descripcion: "Consulte en un solo lugar sus documentos e información en poder del Estado colombiano.", orden: 3 },
  { id: 67, menuId: 1, parentId: null, titulo: "Participa", slug: 'participa', plantilla: 'contenido', descripcion: "Espacios de participación ciudadana en la gestión de la E.S.E. Hospital San José del Guaviare (lineamientos del DAFP).", orden: 3 },
  { id: 68, menuId: 1, parentId: 67, titulo: "Participación para el diagnóstico de necesidades e identificación de problemas", slug: 'participacion-para-el-diagnostico-de-necesidades-e-identificacion-de-problemas', plantilla: 'contenido', orden: 0 },
  { id: 69, menuId: 1, parentId: 67, titulo: "Planeación y presupuesto participativo", slug: 'planeacion-y-presupuesto-participativo', plantilla: 'contenido', orden: 1 },
  { id: 70, menuId: 1, parentId: 67, titulo: "Consulta ciudadana", slug: 'consulta-ciudadana', plantilla: 'contenido', orden: 2 },
  { id: 71, menuId: 1, parentId: 67, titulo: "Colaboración e innovación abierta", slug: 'colaboracion-e-innovacion-abierta', plantilla: 'contenido', orden: 3 },
  { id: 72, menuId: 1, parentId: 67, titulo: "Rendición de cuentas", slug: 'rendicion-de-cuentas', plantilla: 'documentos', orden: 4 },
  { id: 73, menuId: 1, parentId: 67, titulo: "Control social", slug: 'control-social', plantilla: 'contenido', orden: 5 },
  { id: 74, menuId: 1, parentId: null, titulo: "Nuestro Hospital", slug: 'nuestro-hospital', plantilla: 'contenido', orden: 1 },
  { id: 75, menuId: 1, parentId: 74, titulo: "Reseña histórica", slug: 'resena-historica', plantilla: 'contenido', orden: 0 },
  { id: 76, menuId: 1, parentId: 74, titulo: "Portafolio de servicios", slug: 'portafolio-de-servicios', plantilla: 'listado', orden: 1 },
  { id: 77, menuId: 1, parentId: 74, titulo: "Sedes y horarios de atención", slug: 'sedes-y-horarios', plantilla: 'contenido', orden: 2 },
  { id: 83, menuId: 1, parentId: null, titulo: "Información de interés", slug: 'informacion-de-interes', plantilla: 'contenido', descripcion: "Invitaciones a cotizar y convocatorias laborales de la E.S.E. Hospital San José del Guaviare.", orden: 4 },
  { id: 78, menuId: 1, parentId: 83, titulo: "Invitaciones a cotizar", slug: 'cotizaciones-propuestas', plantilla: 'enlace', urlExterna: '/informacion-de-interes/invitaciones-a-cotizar', orden: 0 },
  { id: 79, menuId: 1, parentId: 83, titulo: "Trabaja con nosotros", slug: 'trabaja-nosotros', plantilla: 'enlace', urlExterna: '/informacion-de-interes/trabaja-con-nosotros', orden: 1 },
  { id: 80, menuId: 1, parentId: null, titulo: "Noticias", slug: 'noticias', plantilla: 'listado', orden: 5, visibleEnMenu: false },
  { id: 81, menuId: 2, parentId: null, titulo: "Políticas de privacidad y tratamiento de datos", slug: 'politicas-de-privacidad', plantilla: 'contenido', orden: 0, estado: 'borrador' },
  { id: 82, menuId: 2, parentId: null, titulo: "Términos y condiciones", slug: 'terminos-y-condiciones', plantilla: 'contenido', orden: 1, estado: 'borrador' },
];
