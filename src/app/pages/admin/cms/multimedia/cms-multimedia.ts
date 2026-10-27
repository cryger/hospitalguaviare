import { Component, computed, inject, OnInit, signal } from '@angular/core';
import { DatePipe } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';
import { CmsService } from '../../../../shared/services/cms/cms.service';
import { CmsMultimedia, TipoMultimedia } from '../../../../shared/models/cms/cms.models';
import { MediaThumb } from '../shared/media-thumb';
import { Dropzone } from '../shared/dropzone';
import { BuscadorGovco } from '../../../../shared/components/buscador-govco/buscador-govco';
import { coincide, terminosDe } from '../../../../shared/utils/busqueda';

@Component({
  selector: 'app-cms-multimedia',
  imports: [FormsModule, RouterLink, DatePipe, MediaThumb, Dropzone, BuscadorGovco],
  templateUrl: './cms-multimedia.html',
  styleUrls: ['../cms-admin.css', './cms-multimedia.css'],
})
export class CmsMultimediaComponent implements OnInit {
  readonly cms = inject(CmsService);

  readonly busqueda = signal('');
  readonly filtroTipo = signal<TipoMultimedia | ''>('');
  readonly soloSinUso = signal(false);
  readonly mostrarSubida = signal(false);
  readonly subiendo = signal(false);
  readonly seleccionadoId = signal<number | null>(null);
  readonly copiado = signal(false);

  detalle: Partial<CmsMultimedia> = {};

  readonly lista = computed(() => {
    const q = terminosDe(this.busqueda());
    const t = this.filtroTipo();
    const usos = this.cms.usosMultimedia();
    return this.cms
      .multimedia()
      .filter((m) => !t || m.tipo === t)
      .filter((m) => !this.soloSinUso() || !usos.get(m.id))
      .filter((m) => coincide(`${m.titulo} ${m.nombre} ${m.alt ?? ''}`, q))
      .sort((a, b) => b.creadoEn.localeCompare(a.creadoEn));
  });

  readonly hayFiltros = computed(() => !!this.busqueda().trim() || !!this.filtroTipo() || this.soloSinUso());

  limpiarFiltros(): void {
    this.busqueda.set('');
    this.filtroTipo.set('');
    this.soloSinUso.set(false);
  }

  readonly seleccionado = computed(() =>
    this.seleccionadoId() ? this.cms.multimediaPorId().get(this.seleccionadoId()!) ?? null : null,
  );

  readonly usadoEn = computed(() => {
    const id = this.seleccionadoId();
    if (!id) return [];
    return this.cms.entradas().filter((e) => e.multimediaIds.includes(id) || e.imagenDestacadaId === id);
  });

  readonly totales = computed(() => {
    const m = this.cms.multimedia();
    const contar = (t: TipoMultimedia) => m.filter((x) => x.tipo === t).length;
    return {
      total: m.length,
      imagen: contar('imagen'),
      video: contar('video'),
      documento: contar('documento'),
      peso: m.reduce((a, x) => a + (x.tamano || 0), 0),
    };
  });

  ngOnInit(): void {
    this.cms.cargar();
  }

  abrir(m: CmsMultimedia): void {
    this.seleccionadoId.set(m.id);
    this.detalle = { ...m };
    this.copiado.set(false);
  }

  async subir(archivos: File[]): Promise<void> {
    this.subiendo.set(true);
    const nuevos = await this.cms.subirArchivos(archivos);
    this.subiendo.set(false);
    if (nuevos.length) {
      this.mostrarSubida.set(false);
      this.abrir(nuevos[0]);
    }
  }

  async guardarDetalle(): Promise<void> {
    if (!this.detalle.id) return;
    try {
      await this.cms.guardarMultimedia({
        id: this.detalle.id,
        titulo: this.detalle.titulo,
        alt: this.detalle.alt,
        descripcion: this.detalle.descripcion,
      });
    } catch {}
  }

  async eliminar(): Promise<void> {
    const m = this.seleccionado();
    if (!m) return;
    const n = this.usadoEn().length;
    const msg = n
      ? `"${m.titulo || m.nombre}" se usa en ${n} entrada(s). Si lo elimina, desaparecerá de ellas.\n\n¿Eliminar de todas formas?`
      : `¿Eliminar "${m.titulo || m.nombre}"?`;
    if (!confirm(msg)) return;
    try {
      await this.cms.eliminarMultimedia(m.id);
      this.seleccionadoId.set(null);
    } catch {}
  }

  async copiarUrl(): Promise<void> {
    const url = this.seleccionado()?.url;
    if (!url) return;
    try {
      await navigator.clipboard.writeText(url.startsWith('data:') ? '(archivo local — disponible al conectar la API)' : url);
      this.copiado.set(true);
    } catch {}
  }

  peso(bytes?: number): string {
    if (!bytes) return '—';
    if (bytes < 1024) return `${bytes} B`;
    if (bytes < 1024 ** 2) return `${(bytes / 1024).toFixed(0)} KB`;
    return `${(bytes / 1024 ** 2).toFixed(1)} MB`;
  }
}
