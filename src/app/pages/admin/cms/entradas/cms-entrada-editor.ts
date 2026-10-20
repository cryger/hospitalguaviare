import { Component, computed, effect, inject, input, signal, untracked } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { CmsService } from '../../../../shared/services/cms/cms.service';
import { CmsEntrada, CmsMultimedia, TIPOS_ENTRADA } from '../../../../shared/models/cms/cms.models';
import { MediaPicker } from '../shared/media-picker';
import { MediaThumb } from '../shared/media-thumb';
import { RichEditor } from '../shared/rich-editor';

@Component({
  selector: 'app-cms-entrada-editor',
  imports: [FormsModule, RouterLink, MediaPicker, MediaThumb, RichEditor],
  templateUrl: './cms-entrada-editor.html',
  styleUrls: ['../cms-admin.css', './cms-entrada-editor.css'],
})
export class CmsEntradaEditor {
  readonly cms = inject(CmsService);
  private router = inject(Router);

  readonly id = input<string>();
  readonly pagina = input<string>();

  readonly tipos = TIPOS_ENTRADA;
  form = this.vacia();
  /** Contenido como signal para el editor enriquecido */
  readonly contenido = signal('');
  readonly galeria = signal<number[]>([]);
  readonly destacadaId = signal<number | null>(null);

  slugManual = false;
  fechaLocal = '';
  readonly entradaId = signal<number | null>(null);
  readonly noEncontrada = signal(false);
  readonly guardando = signal(false);
  readonly mensajeOk = signal<string | null>(null);
  readonly picker = signal<'galeria' | 'destacada' | null>(null);

  readonly archivosGaleria = computed(() => {
    const mapa = this.cms.multimediaPorId();
    return this.galeria().map((id) => mapa.get(id)).filter((m): m is CmsMultimedia => !!m);
  });

  readonly imagenDestacada = computed(() =>
    this.destacadaId() ? this.cms.multimediaPorId().get(this.destacadaId()!) ?? null : null,
  );

  readonly paginasOrdenadas = computed(() => {
    this.cms.paginas();
    return [...this.cms.menus().flatMap((m) => this.cms.plano(m.id)), ...this.cms.plano(null)];
  });

  constructor() {
    effect(() => {
      const id = this.id();
      untracked(() => this.inicializar(id));
    });
  }

  private vacia(): Partial<CmsEntrada> {
    return {
      titulo: '',
      slug: '',
      resumen: '',
      tipo: 'articulo',
      estado: 'borrador',
      destacada: false,
      autor: localStorage.getItem('username') || 'Administrador',
      fechaPublicacion: null,
      paginaId: undefined,
    };
  }

  private async inicializar(idParam?: string): Promise<void> {
    await this.cms.cargar();
    this.noEncontrada.set(false);
    const id = Number(idParam);
    if (id) {
      const e = this.cms.entradas().find((x) => x.id === id);
      if (!e) {
        this.noEncontrada.set(true);
        return;
      }
      this.cargarEnFormulario(e);
      this.entradaId.set(id);
    } else {
      this.form = this.vacia();
      const pedida = this.cms.paginaPorId().get(Number(this.pagina()));
      this.form.paginaId =
        pedida && pedida.plantilla !== 'enlace'
          ? pedida.id
          : this.cms.paginas().find((p) => p.plantilla !== 'enlace')?.id;
      this.contenido.set('');
      this.galeria.set([]);
      this.destacadaId.set(null);
      this.fechaLocal = '';
      this.slugManual = false;
      this.entradaId.set(null);
    }
  }

  private cargarEnFormulario(e: CmsEntrada): void {
    this.form = { ...e };
    this.contenido.set(e.contenido || '');
    this.galeria.set([...(e.multimediaIds || [])]);
    this.destacadaId.set(e.imagenDestacadaId);
    this.fechaLocal = e.fechaPublicacion ? this.aLocal(e.fechaPublicacion) : '';
    this.slugManual = true;
  }

  /** ISO → valor para <input type="datetime-local"> en hora local */
  private aLocal(iso: string): string {
    const d = new Date(iso);
    if (isNaN(d.getTime())) return '';
    const off = d.getTimezoneOffset() * 60000;
    return new Date(d.getTime() - off).toISOString().slice(0, 16);
  }

  /** Las páginas tipo "enlace" solo redirigen: sus entradas no se publican */
  esPaginaEnlace(): boolean {
    return this.cms.paginaPorId().get(Number(this.form.paginaId))?.plantilla === 'enlace';
  }

  sangria(nivel: number): string {
    return '— '.repeat(nivel);
  }

  alCambiarTitulo(): void {
    if (!this.slugManual) this.form.slug = CmsService.slugify(this.form.titulo || '');
  }

  /* ===== Multimedia ===== */
  alSeleccionar(items: CmsMultimedia[]): void {
    if (this.picker() === 'destacada') {
      this.destacadaId.set(items[0]?.id ?? null);
    } else {
      this.galeria.update((l) => [...l, ...items.map((m) => m.id).filter((id) => !l.includes(id))]);
      // Si no hay imagen destacada, se usa la primera imagen agregada
      if (!this.destacadaId()) {
        const img = items.find((m) => m.tipo === 'imagen');
        if (img) this.destacadaId.set(img.id);
      }
    }
    this.picker.set(null);
  }

  quitarDeGaleria(id: number): void {
    this.galeria.update((l) => l.filter((x) => x !== id));
  }

  moverEnGaleria(id: number, delta: -1 | 1): void {
    this.galeria.update((l) => {
      const i = l.indexOf(id);
      const j = i + delta;
      if (i < 0 || j < 0 || j >= l.length) return l;
      const c = [...l];
      [c[i], c[j]] = [c[j], c[i]];
      return c;
    });
  }

  /* ===== Guardar ===== */
  valido(): boolean {
    return !!this.form.titulo?.trim() && !!this.form.paginaId;
  }

  async guardar(estado?: CmsEntrada['estado']): Promise<void> {
    if (!this.valido()) return;
    this.guardando.set(true);
    this.mensajeOk.set(null);
    try {
      const datos: Partial<CmsEntrada> = {
        ...this.form,
        titulo: this.form.titulo!.trim(),
        paginaId: Number(this.form.paginaId),
        contenido: this.contenido(),
        multimediaIds: this.galeria(),
        imagenDestacadaId: this.destacadaId(),
        fechaPublicacion: this.fechaLocal ? new Date(this.fechaLocal).toISOString() : null,
        estado: estado ?? this.form.estado,
      };
      const previa = this.entradaId() ? this.cms.entradas().find((e) => e.id === this.entradaId()) : null;
      if (previa && previa.paginaId !== datos.paginaId) {
        datos.orden = this.cms.entradas().filter((e) => e.paginaId === datos.paginaId).length;
      }
      const g = await this.cms.guardarEntrada(datos);
      this.cargarEnFormulario(g);
      this.mensajeOk.set(g.estado === 'publicada' ? 'Entrada publicada.' : 'Cambios guardados.');
      if (!this.entradaId()) {
        this.router.navigate(['/admin/contenido/entradas', g.id], { replaceUrl: true });
      }
    } catch {
      /* cms.error() */
    } finally {
      this.guardando.set(false);
    }
  }

  async eliminar(): Promise<void> {
    const id = this.entradaId();
    if (!id || !confirm(`¿Eliminar "${this.form.titulo}"?`)) return;
    const paginaId = this.form.paginaId;
    await this.cms.eliminarEntrada(id);
    this.router.navigate(['/admin/contenido/paginas', paginaId]);
  }
}
