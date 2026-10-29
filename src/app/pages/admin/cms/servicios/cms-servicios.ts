import { Component, OnInit, computed, inject, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';
import { CmsService } from '../../../../shared/services/cms/cms.service';
import { CmsEntrada, CmsMultimedia, EstadoEntrada } from '../../../../shared/models/cms/cms.models';
import { normalizar } from '../../../../shared/utils/busqueda';
import { MediaPicker } from '../shared/media-picker';
import { RichEditor } from '../shared/rich-editor';
import { SelectorIcono } from '../../../../shared/components/selector-icono/selector-icono';
import { ServiciosTarjetas, aspectoServicio } from '../../../../componentes/servicios-tarjetas/servicios-tarjetas';

/** Servicios que caben en «Nuestros servicios» del inicio */
export const MAXIMO_INICIO = 8;
const MAX_RESUMEN = 220;

interface FormServicio {
  id?: number;
  titulo: string;
  slug: string;
  categoria: string;
  resumen: string;
  icono: string;
  estado: EstadoEntrada;
  destacada: boolean;
}

/**
 * Admin › Contenido › Portafolio de servicios
 * Administra las entradas de la página con plantilla "servicios":
 * crear, editar, ordenar, publicar, mostrar en el inicio y eliminar.
 */
@Component({
  selector: 'app-cms-servicios',
  imports: [FormsModule, RouterLink, MediaPicker, RichEditor, SelectorIcono, ServiciosTarjetas],
  templateUrl: './cms-servicios.html',
  styleUrls: ['../cms-admin.css', './cms-servicios.css'],
})
export class CmsServicios implements OnInit {
  readonly cms = inject(CmsService);
  readonly maximoInicio = MAXIMO_INICIO;
  readonly maxResumen = MAX_RESUMEN;

  /* ===== Página del portafolio ===== */
  readonly pagina = computed(() => {
    const lista = this.cms.paginas().filter((p) => p.plantilla === 'servicios');
    return lista.find((p) => p.slug === 'portafolio-de-servicios') ?? lista[0] ?? null;
  });
  readonly rutaPublica = computed(() => (this.pagina() ? this.cms.rutaPagina(this.pagina()!.id) : null));

  /** Todos los servicios (sin archivados), en el orden del portafolio */
  readonly servicios = computed(() => {
    const p = this.pagina();
    if (!p) return [];
    return this.cms
      .entradas()
      .filter((e) => e.paginaId === p.id && e.estado !== 'archivada')
      .sort((a, b) => a.orden - b.orden || a.id - b.id);
  });

  readonly grupos = computed(() =>
    [...new Set(this.servicios().map((e) => e.categoria?.trim()).filter((g): g is string => !!g))].sort((a, b) => a.localeCompare(b, 'es')),
  );
  readonly enInicio = computed(() => this.servicios().filter((e) => e.destacada && e.estado === 'publicada'));
  readonly publicados = computed(() => this.servicios().filter((e) => e.estado === 'publicada').length);

  /* ===== Filtros ===== */
  readonly busqueda = signal('');
  readonly grupo = signal('');
  readonly filtrando = computed(() => !!this.busqueda().trim() || !!this.grupo());
  readonly visibles = computed(() => {
    const q = normalizar(this.busqueda()).trim();
    return this.servicios().filter(
      (e) => (!this.grupo() || e.categoria === this.grupo()) && (!q || normalizar(`${e.titulo} ${e.resumen ?? ''} ${e.categoria ?? ''}`).includes(q)),
    );
  });

  readonly mensaje = signal<string | null>(null);
  readonly guardando = signal(false);

  ngOnInit(): void {
    this.cms.cargar();
  }

  /* ===== Ayudas de presentación ===== */
  imagenDe(e: { imagenDestacadaId: number | null }): CmsMultimedia | null {
    const m = e.imagenDestacadaId ? this.cms.multimediaPorId().get(e.imagenDestacadaId) : undefined;
    return m?.tipo === 'imagen' ? m : null;
  }
  aspecto = aspectoServicio;

  urlPublica(e: CmsEntrada): string {
    return this.cms.urlEntrada(e);
  }

  private avisar(texto: string): void {
    this.mensaje.set(texto);
    setTimeout(() => this.mensaje() === texto && this.mensaje.set(null), 4000);
  }

  /* ===== Crear la página si no existe ===== */
  async crearPagina(): Promise<void> {
    const padre = this.cms.paginas().find((p) => p.slug === 'nuestro-hospital');
    await this.cms.guardarPagina({
      titulo: 'Portafolio de servicios',
      slug: 'portafolio-de-servicios',
      plantilla: 'servicios',
      estado: 'publicada',
      menuId: padre?.menuId ?? this.cms.menus()[0]?.id ?? null,
      parentId: padre?.id ?? null,
      visibleEnMenu: true,
      descripcion: 'Conozca los servicios de salud que presta la E.S.E. Hospital San José del Guaviare.',
    });
  }

  /* ===== Acciones rápidas de la lista ===== */
  async alternarInicio(e: CmsEntrada): Promise<void> {
    if (!e.destacada && this.enInicio().length >= MAXIMO_INICIO) {
      this.avisar(`En el inicio caben ${MAXIMO_INICIO} servicios. Quite uno antes de agregar «${e.titulo}».`);
      return;
    }
    await this.cms.guardarEntrada({ ...e, destacada: !e.destacada });
    this.avisar(e.destacada ? `«${e.titulo}» ya no se muestra en el inicio.` : `«${e.titulo}» se muestra en el inicio.`);
  }

  async alternarEstado(e: CmsEntrada): Promise<void> {
    const estado: EstadoEntrada = e.estado === 'publicada' ? 'borrador' : 'publicada';
    await this.cms.guardarEntrada({ ...e, estado });
    this.avisar(estado === 'publicada' ? `«${e.titulo}» publicado.` : `«${e.titulo}» pasó a borrador (no se ve en el sitio).`);
  }

  /** Sube o baja un servicio intercambiando su orden con el vecino */
  async mover(e: CmsEntrada, delta: -1 | 1): Promise<void> {
    const lista = this.servicios();
    const i = lista.indexOf(e);
    const vecino = lista[i + delta];
    if (!vecino) return;
    // Orden consecutivo (10, 20, 30…) para que el intercambio siempre funcione
    const nuevos = lista.map((x, k) => ({ x, orden: (k + 1) * 10 }));
    const a = nuevos[i], b = nuevos[i + delta];
    [a.orden, b.orden] = [b.orden, a.orden];
    for (const { x, orden } of nuevos) {
      if (x.orden !== orden) await this.cms.guardarEntrada({ ...x, orden });
    }
    setTimeout(() => document.getElementById(`mover-${delta < 0 ? 'arriba' : 'abajo'}-${e.id}`)?.focus());
  }

  /* ===== Eliminar ===== */
  readonly porEliminar = signal<CmsEntrada | null>(null);
  async confirmarEliminar(): Promise<void> {
    const e = this.porEliminar();
    this.porEliminar.set(null);
    if (!e) return;
    await this.cms.eliminarEntrada(e.id);
    this.avisar(`«${e.titulo}» eliminado.`);
  }

  /* ===== Editor (modal) ===== */
  readonly editando = signal(false);
  form: FormServicio = this.vacio();
  readonly contenido = signal('');
  readonly imagenId = signal<number | null>(null);
  readonly picker = signal(false);
  private slugManual = false;
  /** Cambia con cada tecla para refrescar la vista previa */
  readonly version = signal(0);

  private vacio(): FormServicio {
    return { titulo: '', slug: '', categoria: '', resumen: '', icono: '', estado: 'publicada', destacada: false };
  }

  nuevo(): void {
    this.form = this.vacio();
    this.contenido.set('');
    this.imagenId.set(null);
    this.slugManual = false;
    this.editando.set(true);
  }

  editar(e: CmsEntrada): void {
    this.form = {
      id: e.id,
      titulo: e.titulo,
      slug: e.slug,
      categoria: e.categoria ?? '',
      resumen: e.resumen ?? '',
      icono: e.icono ?? '',
      estado: e.estado,
      destacada: e.destacada,
    };
    this.contenido.set(e.contenido ?? '');
    this.imagenId.set(e.imagenDestacadaId);
    this.slugManual = true;
    this.editando.set(true);
  }

  alCambiarTitulo(): void {
    if (!this.slugManual) this.form.slug = CmsService.slugify(this.form.titulo);
    this.version.update((v) => v + 1);
  }
  marcarSlugManual(): void {
    this.slugManual = true;
  }
  refrescar(): void {
    this.version.update((v) => v + 1);
  }

  /** Entrada "de mentira" para la vista previa de la tarjeta */
  readonly vistaPrevia = computed<CmsEntrada[]>(() => {
    this.version();
    const p = this.pagina();
    return [
      {
        id: this.form.id ?? 0,
        paginaId: p?.id ?? 0,
        titulo: this.form.titulo || 'Nombre del servicio',
        slug: this.form.slug || 'servicio',
        resumen: this.form.resumen || 'Resumen corto del servicio.',
        categoria: this.form.categoria,
        icono: this.form.icono,
        tipo: 'articulo',
        estado: this.form.estado,
        destacada: this.form.destacada,
        imagenDestacadaId: this.imagenId(),
        multimediaIds: [],
        fechaPublicacion: null,
        orden: 0,
        creadoEn: '',
        actualizadoEn: '',
      },
    ];
  });

  readonly cuposInicio = computed(() => {
    this.version();
    const otros = this.enInicio().filter((e) => e.id !== this.form.id).length;
    return MAXIMO_INICIO - otros;
  });

  valido(): boolean {
    return !!this.form.titulo.trim() && this.form.resumen.length <= MAX_RESUMEN;
  }

  alElegirImagen(items: CmsMultimedia[]): void {
    this.imagenId.set(items[0]?.id ?? null);
    this.picker.set(false);
  }

  cerrarEditor(): void {
    this.editando.set(false);
  }

  async guardar(): Promise<void> {
    const p = this.pagina();
    if (!p || !this.valido()) return;
    if (this.form.destacada && this.form.estado === 'publicada' && this.cuposInicio() <= 0) {
      this.avisar(`En el inicio caben ${MAXIMO_INICIO} servicios: desmarque «Mostrar en el inicio» o quite otro.`);
      return;
    }
    this.guardando.set(true);
    try {
      const previa = this.form.id ? this.cms.entradas().find((e) => e.id === this.form.id) : undefined;
      const g = await this.cms.guardarEntrada({
        ...(previa ?? {}),
        id: this.form.id,
        paginaId: p.id,
        titulo: this.form.titulo.trim(),
        slug: this.form.slug || this.form.titulo,
        categoria: this.form.categoria.trim() || null,
        resumen: this.form.resumen.trim(),
        icono: this.form.icono || null,
        contenido: this.contenido(),
        imagenDestacadaId: this.imagenId(),
        multimediaIds: previa?.multimediaIds ?? [],
        estado: this.form.estado,
        destacada: this.form.destacada,
        tipo: previa?.tipo ?? 'articulo',
        autor: previa?.autor ?? 'E.S.E. Hospital San José del Guaviare',
        orden: previa?.orden ?? ((this.servicios().at(-1)?.orden ?? 0) + 10),
      });
      this.editando.set(false);
      this.avisar(this.form.id ? `«${g.titulo}» actualizado.` : `«${g.titulo}» creado.`);
    } catch {
      /* cms.error() muestra el problema */
    } finally {
      this.guardando.set(false);
    }
  }
}
