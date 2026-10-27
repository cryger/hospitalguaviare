import { NgTemplateOutlet } from '@angular/common';
import { Component, ElementRef, computed, effect, inject, signal, viewChildren } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { EventosService } from '../../shared/services/eventos/eventos.service';
import {
  CATEGORIAS_EVENTO,
  CategoriaEvento,
  Evento,
  MODALIDADES_EVENTO,
  categoriaDe,
  descargarIcs,
  diaDe,
  diasDe,
  enlaceGoogle,
  horarioDe,
  hoyBogota,
} from '../../shared/models/eventos/evento';
import { coincide, resaltar, terminosDe } from '../../shared/utils/busqueda';
import { BuscadorGovco } from '../../shared/components/buscador-govco/buscador-govco';

const MESES = ['enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio', 'julio', 'agosto', 'septiembre', 'octubre', 'noviembre', 'diciembre'];
const DIAS = ['lunes', 'martes', 'miércoles', 'jueves', 'viernes', 'sábado', 'domingo'];

interface Celda {
  fecha: string; // AAAA-MM-DD
  dia: number;
  delMes: boolean;
  hoy: boolean;
  eventos: Evento[];
}

/**
 * Calendario de eventos del portal (plantilla de página "calendario").
 * Vista de mes y de lista, filtros, detalle del día y exportación a
 * calendarios personales (.ics / Google Calendar). Componentes BDC GOV.CO v5.
 */
@Component({
  selector: 'app-calendario-eventos',
  imports: [BuscadorGovco, NgTemplateOutlet],
  templateUrl: './calendario-eventos.html',
  styleUrl: './calendario-eventos.css',
})
export class CalendarioEventos {
  readonly svc = inject(EventosService);
  private route = inject(ActivatedRoute);
  private router = inject(Router);

  readonly categorias = CATEGORIAS_EVENTO;
  readonly diasSemana = DIAS;
  readonly hoy = hoyBogota();

  readonly vista = signal<'mes' | 'lista'>('mes');
  readonly anio = signal(Number(this.hoy.slice(0, 4)));
  readonly mes = signal(Number(this.hoy.slice(5, 7)) - 1); // 0-11
  readonly seleccionado = signal<string>(this.hoy);
  readonly categoria = signal<CategoriaEvento | ''>('');
  readonly busqueda = signal('');
  readonly periodo = signal<'proximos' | 'anteriores'>('proximos');
  readonly abierto = signal<number | null>(null);

  private readonly botonesDia = viewChildren<ElementRef<HTMLButtonElement>>('botonDia');

  readonly titulo = computed(() => `${MESES[this.mes()]} de ${this.anio()}`);
  readonly terminos = computed(() => terminosDe(this.busqueda()));

  /** Eventos públicos que pasan los filtros de categoría y búsqueda */
  readonly filtrados = computed(() => {
    const cat = this.categoria();
    const t = this.terminos();
    return this.svc
      .publicos()
      .filter((e) => !cat || e.categoria === cat)
      .filter((e) => coincide(`${e.titulo} ${e.descripcion ?? ''} ${e.lugar ?? ''} ${e.responsable ?? ''} ${e.dirigidoA ?? ''}`, t));
  });

  private readonly porDia = computed(() => {
    const mapa = new Map<string, Evento[]>();
    for (const e of this.filtrados()) for (const d of diasDe(e)) {
      if (!mapa.has(d)) mapa.set(d, []);
      mapa.get(d)!.push(e);
    }
    return mapa;
  });

  /** 6 semanas (lunes a domingo) del mes visible */
  readonly celdas = computed<Celda[]>(() => {
    const y = this.anio();
    const m = this.mes();
    const primero = new Date(Date.UTC(y, m, 1));
    const desfase = (primero.getUTCDay() + 6) % 7; // lunes = 0
    const inicio = new Date(Date.UTC(y, m, 1 - desfase));
    const mapa = this.porDia();
    const celdas: Celda[] = [];
    for (let i = 0; i < 42; i++) {
      const d = new Date(inicio);
      d.setUTCDate(inicio.getUTCDate() + i);
      const fecha = d.toISOString().slice(0, 10);
      celdas.push({ fecha, dia: d.getUTCDate(), delMes: d.getUTCMonth() === m, hoy: fecha === this.hoy, eventos: mapa.get(fecha) ?? [] });
    }
    // Quita la última semana si es toda del mes siguiente
    return celdas.slice(35).every((c) => !c.delMes) ? celdas.slice(0, 35) : celdas;
  });

  readonly semanas = computed(() => {
    const c = this.celdas();
    return Array.from({ length: c.length / 7 }, (_, i) => c.slice(i * 7, i * 7 + 7));
  });

  readonly eventosMes = computed(() => {
    const pref = `${this.anio()}-${String(this.mes() + 1).padStart(2, '0')}`;
    return this.filtrados().filter((e) => diasDe(e).some((d) => d.startsWith(pref)));
  });

  readonly eventosDia = computed(() => this.porDia().get(this.seleccionado()) ?? []);

  /** Vista de lista: próximos o anteriores, agrupados por mes */
  readonly grupos = computed(() => {
    const hoy = this.hoy;
    const proximos = this.periodo() === 'proximos';
    const lista = this.filtrados().filter((e) => (proximos ? diasDe(e).some((d) => d >= hoy) : diasDe(e).every((d) => d < hoy)));
    if (!proximos) lista.reverse();
    const grupos: { clave: string; titulo: string; eventos: Evento[] }[] = [];
    for (const e of lista) {
      const d = diaDe(e);
      const clave = d.slice(0, 7);
      let g = grupos.find((x) => x.clave === clave);
      if (!g) grupos.push((g = { clave, titulo: `${MESES[Number(d.slice(5, 7)) - 1]} de ${d.slice(0, 4)}`, eventos: [] }));
      g.eventos.push(e);
    }
    return grupos;
  });

  readonly totalLista = computed(() => this.grupos().reduce((n, g) => n + g.eventos.length, 0));
  readonly hayFiltros = computed(() => !!this.categoria() || !!this.busqueda().trim());

  constructor() {
    this.svc.cargar();

    // ?evento=ID (desde el buscador del portal) o ?fecha=AAAA-MM-DD abre ese día
    const q = this.route.snapshot.queryParamMap;
    const fecha = q.get('fecha');
    if (fecha && /^\d{4}-\d{2}-\d{2}$/.test(fecha)) this.irAFecha(fecha);
    const id = Number(q.get('evento'));
    if (id) {
      effect(() => {
        const e = this.svc.eventos().find((x) => x.id === id);
        if (e) { this.irAFecha(diaDe(e)); this.abierto.set(e.id); }
      });
    }
  }

  /* ===== Navegación ===== */
  irAFecha(fecha: string): void {
    this.anio.set(Number(fecha.slice(0, 4)));
    this.mes.set(Number(fecha.slice(5, 7)) - 1);
    this.seleccionado.set(fecha);
  }

  cambiarMes(delta: number): void {
    const d = new Date(Date.UTC(this.anio(), this.mes() + delta, 1));
    this.anio.set(d.getUTCFullYear());
    this.mes.set(d.getUTCMonth());
    const pref = d.toISOString().slice(0, 7);
    const primeroConEventos = this.eventosMes().map(diaDe).filter((x) => x.startsWith(pref)).sort()[0];
    this.seleccionado.set(this.hoy.startsWith(pref) ? this.hoy : primeroConEventos ?? `${pref}-01`);
  }

  irHoy(): void {
    this.irAFecha(this.hoy);
    this.vista.set('mes');
  }

  elegir(fecha: string, delMes: boolean): void {
    if (!delMes) this.irAFecha(fecha);
    else this.seleccionado.set(fecha);
    this.abierto.set(null);
  }

  /** Flechas del teclado dentro de la cuadrícula (patrón grid de WAI-ARIA) */
  teclado(ev: KeyboardEvent, fecha: string): void {
    const pasos: Record<string, number> = { ArrowLeft: -1, ArrowRight: 1, ArrowUp: -7, ArrowDown: 7 };
    let delta = pasos[ev.key];
    if (ev.key === 'Home') delta = -((new Date(fecha + 'T00:00:00Z').getUTCDay() + 6) % 7);
    if (ev.key === 'End') delta = 6 - ((new Date(fecha + 'T00:00:00Z').getUTCDay() + 6) % 7);
    if (ev.key === 'PageUp' || ev.key === 'PageDown') {
      ev.preventDefault();
      this.cambiarMes(ev.key === 'PageUp' ? -1 : 1);
      this.enfocarSeleccionado();
      return;
    }
    if (delta === undefined) return;
    ev.preventDefault();
    const d = new Date(fecha + 'T00:00:00Z');
    d.setUTCDate(d.getUTCDate() + delta);
    this.irAFecha(d.toISOString().slice(0, 10));
    this.enfocarSeleccionado();
  }

  private enfocarSeleccionado(): void {
    setTimeout(() => this.botonesDia().find((b) => b.nativeElement.dataset['fecha'] === this.seleccionado())?.nativeElement.focus());
  }

  limpiarFiltros(): void {
    this.categoria.set('');
    this.busqueda.set('');
  }

  /* ===== Textos ===== */
  etiquetaDia(c: Celda): string {
    const d = new Date(c.fecha + 'T00:00:00Z');
    const n = c.eventos.length;
    return `${DIAS[(d.getUTCDay() + 6) % 7]} ${c.dia} de ${MESES[d.getUTCMonth()]}${c.hoy ? ', hoy' : ''}: ${n ? n + (n === 1 ? ' evento' : ' eventos') : 'sin eventos'}`;
  }

  fechaLarga(fecha: string): string {
    const d = new Date(fecha + 'T00:00:00Z');
    return `${DIAS[(d.getUTCDay() + 6) % 7]} ${d.getUTCDate()} de ${MESES[d.getUTCMonth()]} de ${d.getUTCFullYear()}`;
  }

  /** "martes 6 de octubre de 2026" o rango "2 al 4 de diciembre de 2026" */
  fechaEvento(e: Evento): string {
    const dias = diasDe(e);
    if (dias.length === 1) return this.fechaLarga(dias[0]);
    const [a, b] = [dias[0], dias[dias.length - 1]];
    const mesA = MESES[Number(a.slice(5, 7)) - 1];
    const mesB = MESES[Number(b.slice(5, 7)) - 1];
    return mesA === mesB
      ? `${Number(a.slice(8))} al ${Number(b.slice(8))} de ${mesB} de ${b.slice(0, 4)}`
      : `${Number(a.slice(8))} de ${mesA} al ${Number(b.slice(8))} de ${mesB} de ${b.slice(0, 4)}`;
  }

  diaNumero = (e: Evento) => Number(diaDe(e).slice(8, 10));
  mesCorto = (e: Evento) => MESES[Number(diaDe(e).slice(5, 7)) - 1].slice(0, 3);
  diaSemana = (e: Evento) => DIAS[(new Date(diaDe(e) + 'T00:00:00Z').getUTCDay() + 6) % 7];
  horario = horarioDe;
  cat = categoriaDe;
  modalidad = (e: Evento) => MODALIDADES_EVENTO.find((m) => m.valor === e.modalidad)?.etiqueta ?? '';
  google = enlaceGoogle;
  marcar = (t: string | null | undefined) => resaltar(t, this.terminos());

  /* ===== Exportar ===== */
  descargarEvento(e: Evento): void {
    descargarIcs([e], `evento-${diaDe(e)}-${e.id}`);
  }

  descargarMes(): void {
    descargarIcs(this.eventosMes(), `calendario-hsjg-${this.anio()}-${String(this.mes() + 1).padStart(2, '0')}`);
  }

  compartir(e: Evento): string {
    return this.router.serializeUrl(this.router.createUrlTree([], { relativeTo: this.route, queryParams: { evento: e.id } }));
  }
}
