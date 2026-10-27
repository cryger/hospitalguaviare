import { Component, computed, inject, OnInit, signal } from '@angular/core';
import { AbstractControl, FormBuilder, ReactiveFormsModule, ValidationErrors, Validators } from '@angular/forms';
import { FormsModule } from '@angular/forms';
import { EventosService } from '../../../shared/services/eventos/eventos.service';
import {
  CATEGORIAS_EVENTO,
  CategoriaEvento,
  EstadoEvento,
  Evento,
  MODALIDADES_EVENTO,
  aIsoBogota,
  categoriaDe,
  diaDe,
  diasDe,
  horarioDe,
  hoyBogota,
  partesBogota,
} from '../../../shared/models/eventos/evento';
import { BuscadorGovco } from '../../../shared/components/buscador-govco/buscador-govco';
import { coincide, terminosDe } from '../../../shared/utils/busqueda';

const RUTA_PUBLICA = '/transparencia/informacion-de-la-entidad/calendario-de-actividades-y-eventos';
const MESES = ['ene', 'feb', 'mar', 'abr', 'may', 'jun', 'jul', 'ago', 'sep', 'oct', 'nov', 'dic'];

/** Valida que el fin no sea anterior al inicio */
function rangoValido(g: AbstractControl): ValidationErrors | null {
  const v = g.value;
  if (!v.fecha) return null;
  const fin = v.fechaFin || v.fecha;
  if (fin < v.fecha) return { rango: 'La fecha final no puede ser anterior a la inicial.' };
  if (!v.todoElDia && fin === v.fecha && v.horaFin && v.horaInicio && v.horaFin <= v.horaInicio) {
    return { rango: 'La hora final debe ser posterior a la hora de inicio.' };
  }
  if (v.repetir !== 'no' && (!v.repetirHasta || v.repetirHasta <= v.fecha)) {
    return { rango: 'Indique hasta qué fecha se repite el evento (posterior a la fecha inicial).' };
  }
  return null;
}

@Component({
  selector: 'app-eventos-admin',
  imports: [ReactiveFormsModule, FormsModule, BuscadorGovco],
  templateUrl: './eventos-admin.html',
  styleUrls: ['../cms/cms-admin.css', './eventos-admin.css'],
})
export class EventosAdmin implements OnInit {
  readonly svc = inject(EventosService);
  private fb = inject(FormBuilder);

  readonly categorias = CATEGORIAS_EVENTO;
  readonly modalidades = MODALIDADES_EVENTO;
  readonly rutaPublica = RUTA_PUBLICA;
  readonly hoy = hoyBogota();

  /* ===== Filtros ===== */
  readonly busqueda = signal('');
  readonly periodo = signal<'proximos' | 'anteriores' | 'todos'>('proximos');
  readonly filtroCategoria = signal<CategoriaEvento | ''>('');
  readonly filtroEstado = signal<EstadoEvento | ''>('');

  readonly lista = computed(() => {
    const t = terminosDe(this.busqueda());
    const p = this.periodo();
    const c = this.filtroCategoria();
    const est = this.filtroEstado();
    const l = this.svc
      .eventos()
      .filter((e) => p === 'todos' || (p === 'proximos' ? diasDe(e).some((d) => d >= this.hoy) : diasDe(e).every((d) => d < this.hoy)))
      .filter((e) => !c || e.categoria === c)
      .filter((e) => !est || e.estado === est)
      .filter((e) => coincide(`${e.titulo} ${e.descripcion ?? ''} ${e.lugar ?? ''} ${e.responsable ?? ''}`, t));
    return p === 'anteriores' ? [...l].reverse() : l;
  });

  readonly hayFiltros = computed(
    () => !!this.busqueda().trim() || this.periodo() !== 'proximos' || !!this.filtroCategoria() || !!this.filtroEstado(),
  );

  readonly kpis = computed(() => {
    const l = this.svc.eventos();
    const mes = this.hoy.slice(0, 7);
    return {
      proximos: l.filter((e) => e.estado === 'publicado' && diasDe(e).some((d) => d >= this.hoy)).length,
      mes: l.filter((e) => e.estado !== 'borrador' && diasDe(e).some((d) => d.startsWith(mes))).length,
      borradores: l.filter((e) => e.estado === 'borrador').length,
      cancelados: l.filter((e) => e.estado === 'cancelado').length,
    };
  });

  limpiarFiltros(): void {
    this.busqueda.set('');
    this.periodo.set('proximos');
    this.filtroCategoria.set('');
    this.filtroEstado.set('');
  }

  /* ===== Formulario ===== */
  readonly modal = signal(false);
  readonly editando = signal<Evento | null>(null);
  readonly guardando = signal(false);
  readonly aviso = signal<{ tipo: 'ok' | 'error'; texto: string } | null>(null);

  readonly form = this.fb.nonNullable.group(
    {
      titulo: ['', [Validators.required, Validators.maxLength(250)]],
      categoria: ['capacitacion' as CategoriaEvento, Validators.required],
      fecha: ['', Validators.required],
      todoElDia: [false],
      horaInicio: ['08:00'],
      horaFin: ['09:00'],
      fechaFin: [''],
      lugar: ['', Validators.maxLength(250)],
      modalidad: ['presencial' as Evento['modalidad']],
      enlace: ['', Validators.pattern(/^(https?:\/\/\S+)?$/i)],
      dirigidoA: ['', Validators.maxLength(250)],
      responsable: ['', Validators.maxLength(250)],
      descripcion: [''],
      estado: ['publicado' as EstadoEvento],
      destacado: [false],
      repetir: ['no' as 'no' | 'semanal' | 'quincenal' | 'mensual'],
      repetirHasta: [''],
    },
    { validators: rangoValido },
  );

  ngOnInit(): void {
    this.svc.cargar(true);
  }

  nuevo(fecha = this.hoy): void {
    this.editando.set(null);
    this.form.reset({
      titulo: '', categoria: 'capacitacion', fecha, todoElDia: false, horaInicio: '08:00', horaFin: '09:00', fechaFin: '',
      lugar: 'Auditorio de la E.S.E. Hospital San José del Guaviare', modalidad: 'presencial', enlace: '', dirigidoA: 'Funcionarios y colaboradores',
      responsable: '', descripcion: '', estado: 'publicado', destacado: false, repetir: 'no', repetirHasta: '',
    });
    this.modal.set(true);
  }

  editar(e: Evento, copia = false): void {
    const ini = partesBogota(e.fechaInicio);
    const fin = partesBogota(e.fechaFin);
    this.editando.set(copia ? null : e);
    this.form.reset({
      titulo: copia ? `${e.titulo} (copia)` : e.titulo,
      categoria: e.categoria,
      fecha: ini.fecha,
      todoElDia: e.todoElDia,
      horaInicio: e.todoElDia ? '08:00' : ini.hora,
      horaFin: e.todoElDia || !fin.hora ? '09:00' : fin.hora,
      fechaFin: fin.fecha && fin.fecha !== ini.fecha ? fin.fecha : '',
      lugar: e.lugar ?? '',
      modalidad: e.modalidad,
      enlace: e.enlace ?? '',
      dirigidoA: e.dirigidoA ?? '',
      responsable: e.responsable ?? '',
      descripcion: e.descripcion ?? '',
      estado: copia ? 'borrador' : e.estado,
      destacado: e.destacado,
      repetir: 'no',
      repetirHasta: '',
    });
    this.modal.set(true);
  }

  cerrar(): void {
    if (!this.guardando()) this.modal.set(false);
  }

  /** Fechas en que se crea el evento (una, o varias si se repite) */
  private fechasRepeticion(): string[] {
    const v = this.form.getRawValue();
    if (this.editando() || v.repetir === 'no') return [v.fecha];
    const fechas: string[] = [];
    const d = new Date(v.fecha + 'T00:00:00Z');
    let guardia = 0;
    while (d.toISOString().slice(0, 10) <= v.repetirHasta && guardia++ < 60) {
      fechas.push(d.toISOString().slice(0, 10));
      if (v.repetir === 'semanal') d.setUTCDate(d.getUTCDate() + 7);
      else if (v.repetir === 'quincenal') d.setUTCDate(d.getUTCDate() + 14);
      else d.setUTCMonth(d.getUTCMonth() + 1);
    }
    return fechas;
  }

  contarRepeticiones(): number {
    return this.form.valid ? this.fechasRepeticion().length : 0;
  }

  private datos(fecha: string): Partial<Evento> {
    const v = this.form.getRawValue();
    const desplazamiento = v.fechaFin ? Math.round((Date.parse(v.fechaFin) - Date.parse(v.fecha)) / 86400000) : 0;
    const finDia = (() => {
      const d = new Date(fecha + 'T00:00:00Z');
      d.setUTCDate(d.getUTCDate() + desplazamiento);
      return d.toISOString().slice(0, 10);
    })();
    const limpiar = (t: string) => t.trim() || null;
    return {
      titulo: v.titulo.trim(),
      categoria: v.categoria,
      todoElDia: v.todoElDia,
      fechaInicio: aIsoBogota(fecha, v.todoElDia ? '12:00' : v.horaInicio),
      fechaFin: v.todoElDia
        ? desplazamiento ? aIsoBogota(finDia, '12:00') : null
        : v.horaFin || desplazamiento ? aIsoBogota(finDia, v.horaFin || v.horaInicio) : null,
      lugar: limpiar(v.lugar),
      modalidad: v.modalidad,
      enlace: limpiar(v.enlace),
      dirigidoA: limpiar(v.dirigidoA),
      responsable: limpiar(v.responsable),
      descripcion: limpiar(v.descripcion),
      estado: v.estado,
      destacado: v.destacado,
    };
  }

  async guardar(): Promise<void> {
    if (this.form.invalid) {
      this.form.markAllAsTouched();
      return;
    }
    this.guardando.set(true);
    try {
      const actual = this.editando();
      if (actual) {
        await this.svc.actualizar(actual.id, this.datos(this.form.getRawValue().fecha));
        this.aviso.set({ tipo: 'ok', texto: `Evento «${this.form.getRawValue().titulo}» actualizado.` });
      } else {
        const fechas = this.fechasRepeticion();
        for (const f of fechas) await this.svc.crear(this.datos(f));
        this.aviso.set({
          tipo: 'ok',
          texto: fechas.length > 1 ? `Se crearon ${fechas.length} eventos «${this.form.getRawValue().titulo}».` : `Evento «${this.form.getRawValue().titulo}» creado.`,
        });
      }
      this.modal.set(false);
    } catch {
      this.aviso.set({ tipo: 'error', texto: 'No se pudo guardar el evento. Intente de nuevo.' });
    } finally {
      this.guardando.set(false);
    }
  }

  async cambiarEstado(e: Evento, estado: EstadoEvento): Promise<void> {
    try {
      await this.svc.actualizar(e.id, { estado });
      const textos: Record<EstadoEvento, string> = { publicado: 'publicado', borrador: 'ocultado (borrador)', cancelado: 'marcado como cancelado' };
      this.aviso.set({ tipo: 'ok', texto: `Evento «${e.titulo}» ${textos[estado]}.` });
    } catch {
      this.aviso.set({ tipo: 'error', texto: 'No se pudo cambiar el estado.' });
    }
  }

  async eliminar(e: Evento): Promise<void> {
    if (!confirm(`¿Eliminar definitivamente el evento «${e.titulo}»?\nSi solo no se realizará, puede marcarlo como cancelado.`)) return;
    try {
      await this.svc.eliminar(e.id);
      this.aviso.set({ tipo: 'ok', texto: `Evento «${e.titulo}» eliminado.` });
    } catch {
      this.aviso.set({ tipo: 'error', texto: 'No se pudo eliminar el evento.' });
    }
  }

  /* ===== Helpers de plantilla ===== */
  cat = categoriaDe;
  horario = horarioDe;
  dia = (e: Evento) => {
    const d = diaDe(e);
    const dias = diasDe(e);
    const base = `${Number(d.slice(8))} ${MESES[Number(d.slice(5, 7)) - 1]} ${d.slice(0, 4)}`;
    return dias.length > 1 ? `${base} (${dias.length} días)` : base;
  };
  pasado = (e: Evento) => diasDe(e).every((d) => d < this.hoy);
  error(campo: string): boolean {
    const c = this.form.get(campo);
    return !!c && c.invalid && (c.touched || c.dirty);
  }
}
