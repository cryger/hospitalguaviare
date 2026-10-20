import { Component, computed, inject, input, OnInit, output, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CmsService } from '../../../../shared/services/cms/cms.service';
import { CmsMultimedia, TipoMultimedia } from '../../../../shared/models/cms/cms.models';
import { MediaThumb } from './media-thumb';
import { Dropzone } from './dropzone';

/**
 * Selector de multimedia (modal): elegir de la biblioteca, subir archivos
 * o registrar una URL externa (YouTube, documento alojado en otro sitio).
 */
@Component({
  selector: 'app-media-picker',
  imports: [FormsModule, MediaThumb, Dropzone],
  templateUrl: './media-picker.html',
  styleUrls: ['../cms-admin.css', './media-picker.css'],
})
export class MediaPicker implements OnInit {
  readonly cms = inject(CmsService);

  readonly titulo = input('Agregar multimedia');
  readonly multiple = input(true);
  readonly soloTipo = input<TipoMultimedia | null>(null);
  readonly yaSeleccionados = input<number[]>([]);

  readonly seleccionar = output<CmsMultimedia[]>();
  readonly cerrar = output<void>();

  readonly pestana = signal<'biblioteca' | 'subir' | 'url'>('biblioteca');
  readonly busqueda = signal('');
  readonly filtroTipo = signal<TipoMultimedia | ''>('');
  readonly elegidos = signal<number[]>([]);
  readonly subiendo = signal(false);

  url = { url: '', titulo: '', tipo: 'video' as TipoMultimedia };

  readonly lista = computed(() => {
    const q = this.busqueda().toLowerCase().trim();
    const tipo = this.soloTipo() || this.filtroTipo();
    return this.cms
      .multimedia()
      .filter((m) => !tipo || m.tipo === tipo)
      .filter((m) => !q || `${m.titulo} ${m.nombre}`.toLowerCase().includes(q))
      .sort((a, b) => b.creadoEn.localeCompare(a.creadoEn));
  });

  ngOnInit(): void {
    this.cms.cargar();
    if (this.soloTipo()) this.url.tipo = this.soloTipo()!;
  }

  esElegido(id: number): boolean {
    return this.elegidos().includes(id);
  }

  esPrevio(id: number): boolean {
    return this.yaSeleccionados().includes(id);
  }

  alternar(m: CmsMultimedia): void {
    if (!this.multiple()) {
      this.elegidos.set([m.id]);
      return;
    }
    this.elegidos.update((l) => (l.includes(m.id) ? l.filter((x) => x !== m.id) : [...l, m.id]));
  }

  async subir(archivos: File[]): Promise<void> {
    this.subiendo.set(true);
    const nuevos = await this.cms.subirArchivos(archivos);
    this.subiendo.set(false);
    if (nuevos.length) {
      const ids = nuevos.map((n) => n.id);
      this.elegidos.update((l) => (this.multiple() ? [...l, ...ids] : [ids[0]]));
      this.pestana.set('biblioteca');
    }
  }

  async agregarUrl(): Promise<void> {
    if (!this.url.url.trim()) return;
    const m = await this.cms.registrarUrl({
      nombre: this.url.url.trim(),
      url: this.url.url.trim(),
      titulo: this.url.titulo.trim() || this.url.url.trim(),
      tipo: this.url.tipo,
    });
    this.elegidos.update((l) => (this.multiple() ? [...l, m.id] : [m.id]));
    this.url = { url: '', titulo: '', tipo: this.soloTipo() || 'video' };
    this.pestana.set('biblioteca');
  }

  confirmar(): void {
    const mapa = this.cms.multimediaPorId();
    this.seleccionar.emit(this.elegidos().map((id) => mapa.get(id)!).filter(Boolean));
  }
}
