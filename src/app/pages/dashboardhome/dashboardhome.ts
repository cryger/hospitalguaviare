import { Component, computed, inject, signal, OnDestroy } from '@angular/core';
import { CommonModule, DatePipe, registerLocaleData } from '@angular/common';
import localeEsCO from '@angular/common/locales/es-CO';
import { RouterLink } from '@angular/router';
import { toSignal } from '@angular/core/rxjs-interop';

import { NoticiasService } from '../../shared/services/noticias/noticias';
import { CotizacionesService } from '../../shared/services/cotizaciones/cotizaciones';
import { PqrsfService } from '../../shared/services/pqrsf/pqrsf';
import { TrabajaNosotrosService } from '../../shared/services/trabaja-nosotros/trabaja-nosotros-service';
import { TransparenciaService } from '../../shared/services/transparencia/transparencia';
import { ServiciosAtencionService } from '../../shared/services/servicios-atencion/servicios-atencion';
import { UsuariosService } from '../../shared/services/usuarios/usuarios';

import { PQRSF, TipoPQRSF, EstadoPQRSF } from '../../shared/models/pqrsf/pqrsf/pqrsf-module';

registerLocaleData(localeEsCO, 'es-CO');

/** Plazo legal de respuesta (Ley 1755 de 2015): 15 días hábiles */
const PLAZO_PQRSF_DIAS_HABILES = 15;
/** A partir de cuántos días hábiles se marca "por vencer" */
const ALERTA_PQRSF_DIAS_HABILES = 10;

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
  private noticiasService = inject(NoticiasService);
  private cotizacionesService = inject(CotizacionesService);
  private pqrsfService = inject(PqrsfService);
  private vacantesService = inject(TrabajaNosotrosService);
  private transparenciaService = inject(TransparenciaService);
  private serviciosService = inject(ServiciosAtencionService);
  private usuariosService = inject(UsuariosService);

  /* =========================
     FUENTES DE DATOS (reactivas)
  ========================== */
  readonly noticias = toSignal(this.noticiasService.noticias$, { initialValue: [] });
  readonly cotizaciones = toSignal(this.cotizacionesService.cotizaciones$, { initialValue: [] });
  readonly pqrsf = toSignal(this.pqrsfService.pqrsf$, { initialValue: [] });
  readonly vacantes = toSignal(this.vacantesService.vacantesObservable(), { initialValue: [] });

  // Estos servicios no exponen observable: se leen al cargar
  readonly categoriasTransparencia = signal(this.transparenciaService.getCategorias());
  readonly publicacionesTransparencia = signal(this.transparenciaService.getPublicaciones());
  readonly servicios = signal(this.serviciosService.getServicios());
  readonly usuarios = signal(this.usuariosService.getAll());

  /* =========================
     ENCABEZADO
  ========================== */
  readonly ahora = signal(new Date());
  private reloj = setInterval(() => this.ahora.set(new Date()), 60_000);

  readonly nombreUsuario =
    localStorage.getItem('username') || localStorage.getItem('usuario') || 'Administrador';

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
    const pubs = this.publicacionesTransparencia();
    return {
      categorias: this.categoriasTransparencia().filter((c) => c.activo).length,
      publicaciones: pubs.filter((p) => p.activo).length,
      inactivas: pubs.filter((p) => !p.activo).length,
    };
  });

  readonly kpiServicios = computed(() => {
    const s = this.servicios();
    return { total: s.length, activos: s.filter((x) => x.activo).length };
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
  readonly tiposPqrsf: TipoPQRSF[] = ['Petición', 'Queja', 'Reclamo', 'Sugerencia', 'Felicitación'];
  readonly estadosPqrsf: EstadoPQRSF[] = ['Recibida', 'En proceso', 'Respondida', 'Cerrada'];

  readonly pqrsfPendientes = computed<PqrsfPendiente[]>(() =>
    this.pqrsf()
      .filter((p) => p.estado === 'Recibida' || p.estado === 'En proceso')
      .map((item) => {
        const diasHabiles = this.diasHabilesDesde(item.fechaCreacion);
        const diasRestantes = PLAZO_PQRSF_DIAS_HABILES - diasHabiles;
        const semaforo: Semaforo =
          diasHabiles > PLAZO_PQRSF_DIAS_HABILES
            ? 'vencida'
            : diasHabiles >= ALERTA_PQRSF_DIAS_HABILES
              ? 'alerta'
              : 'ok';
        return { item, diasHabiles, diasRestantes, semaforo };
      })
      .sort((a, b) => b.diasHabiles - a.diasHabiles),
  );

  readonly kpiPqrsf = computed(() => {
    const todas = this.pqrsf();
    const pend = this.pqrsfPendientes();
    const respondidas = todas.filter((p) => p.estado === 'Respondida' || p.estado === 'Cerrada');

    // Tiempo promedio de respuesta (días hábiles) de las respondidas
    const conRespuesta = respondidas.filter((p) => p.fechaRespuesta);
    const promedio = conRespuesta.length
      ? conRespuesta.reduce(
          (acc, p) => acc + this.diasHabilesEntre(p.fechaCreacion, p.fechaRespuesta!),
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
        ruta: '/admin/noticias',
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
        modulo: 'PQRSF',
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

    if (k.vencidas > 0) {
      a.push({
        nivel: 'danger',
        texto: `${k.vencidas} PQRSF superan el plazo legal de ${PLAZO_PQRSF_DIAS_HABILES} días hábiles.`,
        ruta: '/admin/pqrsf',
        accion: 'Responder',
      });
    }
    if (k.porVencer > 0) {
      a.push({
        nivel: 'warning',
        texto: `${k.porVencer} PQRSF están próximas a vencer.`,
        ruta: '/admin/pqrsf',
        accion: 'Revisar',
      });
    }

    const borradores = this.kpiNoticias().borradores;
    if (borradores > 0) {
      a.push({
        nivel: 'info',
        texto: `${borradores} noticia(s) en borrador sin publicar.`,
        ruta: '/admin/noticias',
        accion: 'Ver',
      });
    }

    const sinImagen = this.noticias().filter((n) => n.estado === 'publicada' && !n.imagenUrl).length;
    if (sinImagen > 0) {
      a.push({
        nivel: 'info',
        texto: `${sinImagen} noticia(s) publicadas no tienen imagen.`,
        ruta: '/admin/noticias',
        accion: 'Completar',
      });
    }

    // Transparencia (ITA): categorías activas sin publicaciones y publicaciones sin documento
    const pubs = this.publicacionesTransparencia().filter((p) => p.activo);
    const categoriasVacias = this.categoriasTransparencia().filter(
      (c) => c.activo && !pubs.some((p) => p.categoriaId === c.id),
    ).length;
    if (categoriasVacias > 0) {
      a.push({
        nivel: 'warning',
        texto: `${categoriasVacias} categoría(s) de Transparencia sin publicaciones activas.`,
        ruta: '/admin/transparencia',
        accion: 'Publicar',
      });
    }
    const sinDocumento = pubs.filter((p) => !p.ruta).length;
    if (sinDocumento > 0) {
      a.push({
        nivel: 'warning',
        texto: `${sinDocumento} publicación(es) de Transparencia sin documento o enlace.`,
        ruta: '/admin/transparencia',
        accion: 'Corregir',
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
  readonly accesosRapidos = [
    { icono: '📰', texto: 'Nueva noticia', ruta: '/admin/noticias' },
    { icono: '📬', texto: 'Gestionar PQRSF', ruta: '/admin/pqrsf' },
    { icono: '📄', texto: 'Publicar en Transparencia', ruta: '/admin/transparencia' },
    { icono: '💼', texto: 'Nueva cotización', ruta: '/admin/cotizaciones' },
    { icono: '🧑‍⚕️', texto: 'Nueva vacante', ruta: '/admin/vacantes' },
    { icono: '👥', texto: 'Usuarios', ruta: '/admin/usuarios' },
  ];

  /* =========================
     HELPERS
  ========================== */
  private time(d: Date | string): number {
    const t = new Date(d).getTime();
    return isNaN(t) ? 0 : t;
  }

  /** Días hábiles (lunes a viernes) transcurridos desde la fecha hasta hoy */
  private diasHabilesDesde(fecha: Date | string): number {
    return this.diasHabilesEntre(fecha, new Date());
  }

  /** Cuenta días hábiles entre dos fechas (no descuenta festivos) */
  private diasHabilesEntre(desde: Date | string, hasta: Date | string): number {
    const inicio = new Date(desde);
    const fin = new Date(hasta);
    if (isNaN(inicio.getTime()) || isNaN(fin.getTime())) return 0;

    inicio.setHours(0, 0, 0, 0);
    fin.setHours(0, 0, 0, 0);

    let dias = 0;
    const cursor = new Date(inicio);
    while (cursor < fin) {
      cursor.setDate(cursor.getDate() + 1);
      const d = cursor.getDay();
      if (d !== 0 && d !== 6) dias++;
    }
    return dias;
  }

  ngOnDestroy(): void {
    clearInterval(this.reloj);
  }
}
