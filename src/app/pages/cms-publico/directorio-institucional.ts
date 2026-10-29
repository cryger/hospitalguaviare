import { Component, computed, inject, input, signal } from '@angular/core';
import { RouterLink } from '@angular/router';
import { CmsService } from '../../shared/services/cms/cms.service';
import { CmsEntrada } from '../../shared/models/cms/cms.models';
import { normalizar } from '../../shared/utils/busqueda';
import { Contacto, leerContactos } from '../../shared/utils/contactos';
import { IconoCms } from '../../shared/components/icono-cms/icono-cms';

/** Grupo especial: se muestra arriba, en tarjetas destacadas */
export const GRUPO_LINEAS_PRINCIPALES = 'Líneas principales';

interface Dependencia {
  entrada: CmsEntrada;
  area: string;
  icono: string;
  contactos: Contacto[];
  notas: string[];
  /** Texto normalizado para el buscador */
  clave: string;
}

/** Ícono por área (si la entrada no tiene uno propio) */
const ICONOS_AREA: [RegExp, string][] = [
  [/asistencial/, 'govco:user-md'],
  [/atencion al ciudadano|usuario/, 'govco:comments'],
  [/administrativ/, 'govco:briefcase'],
  [/financier/, 'govco:calculator'],
  [/juridic/, 'govco:balance-scale'],
  [/talento/, 'govco:users'],
  [/tecnolog|sistemas/, 'govco:laptop'],
  [/planeacion/, 'govco:chart-line'],
  [/documental|archivo/, 'govco:folder-open'],
  [/comunicacion|prensa/, 'govco:bullhorn'],
  [/contratacion/, 'govco:file-signature'],
  [/control/, 'govco:shield-alt'],
  [/auditoria/, 'govco:clipboard-check'],
  [/calidad/, 'govco:award'],
  [/directiv|gerencia/, 'govco:user-tie'],
  [/gobierno digital/, 'govco:globe'],
];

/**
 * Plantilla "directorio" (Res. 1519 · 1.4 Directorio institucional).
 * - Grupo «Líneas principales»: tarjetas destacadas (conmutador, urgencias, PQRSFD, notificaciones judiciales…).
 * - Demás grupos: dependencias con buscador y filtro por área.
 * Cada entrada: título = dependencia; grupo = área; contenido = líneas «Etiqueta: valor»
 * (Correo, Teléfono, Celular, WhatsApp). Las líneas sin «:» se muestran como nota.
 */
@Component({
  selector: 'app-directorio-institucional',
  imports: [IconoCms, RouterLink],
  templateUrl: './directorio-institucional.html',
  styleUrl: './directorio-institucional.css',
})
export class DirectorioInstitucional {
  readonly cms = inject(CmsService);
  readonly entradas = input.required<CmsEntrada[]>();

  readonly busqueda = signal('');
  readonly area = signal('');
  /** Correo recién copiado (para el aviso «Copiado») */
  readonly copiado = signal<string | null>(null);

  private leer(e: CmsEntrada): Dependencia {
    const area = e.categoria?.trim() || 'Otras dependencias';
    const { contactos, notas } = leerContactos(e.contenido);
    const a = normalizar(area);
    return {
      entrada: e,
      area,
      icono: e.icono || ICONOS_AREA.find(([r]) => r.test(a))?.[1] || 'govco:building',
      contactos,
      notas,
      clave: normalizar([e.titulo, area, e.resumen ?? '', ...contactos.map((c) => `${c.valor} ${c.valor.replace(/\D/g, '')}`)].join(' ')),
    };
  }

  private esPrincipal(e: CmsEntrada): boolean {
    return normalizar(e.categoria ?? '') === normalizar(GRUPO_LINEAS_PRINCIPALES);
  }

  readonly principales = computed(() => this.entradas().filter((e) => this.esPrincipal(e)).map((e) => this.leer(e)));

  private readonly todas = computed(() =>
    this.entradas()
      .filter((e) => !this.esPrincipal(e) && (e.categoria?.trim() || e.contenido?.includes(':')))
      .map((e) => this.leer(e))
      .sort((a, b) => a.entrada.titulo.localeCompare(b.entrada.titulo, 'es')),
  );

  /** Textos sin área ni datos de contacto (introducción opcional) */
  readonly textos = computed(() => this.entradas().filter((e) => !this.esPrincipal(e) && !e.categoria?.trim() && e.contenido && !e.contenido.includes(':')));

  /** Áreas con su conteo; «Atención al ciudadano» primero */
  readonly areas = computed(() => {
    const conteo = new Map<string, { nombre: string; icono: string; total: number }>();
    for (const d of this.todas()) {
      const a = conteo.get(d.area) ?? { nombre: d.area, icono: ICONOS_AREA.find(([r]) => r.test(normalizar(d.area)))?.[1] || 'govco:building', total: 0 };
      a.total++;
      conteo.set(d.area, a);
    }
    const primero = (n: string) => (/atencion al ciudadano/.test(normalizar(n)) ? 0 : 1);
    return [...conteo.values()].sort((a, b) => primero(a.nombre) - primero(b.nombre) || a.nombre.localeCompare(b.nombre, 'es'));
  });

  readonly total = computed(() => this.todas().length);

  readonly filtradas = computed(() => {
    const palabras = normalizar(this.busqueda()).split(/\s+/).filter(Boolean);
    const area = this.area();
    return this.todas().filter((d) => (!area || d.area === area) && palabras.every((p) => d.clave.includes(p)));
  });

  /** Sin filtro ni búsqueda: agrupado por área; si no, una sola lista */
  readonly grupos = computed(() => {
    const lista = this.filtradas();
    if (this.area() || this.busqueda().trim()) return [{ nombre: '', items: lista }];
    return this.areas().map((a) => ({ nombre: a.nombre, items: lista.filter((d) => d.area === a.nombre) }));
  });

  /** Enlace a Sedes y horarios (dirección y mapa), si la página existe */
  readonly sedes = computed(() => this.cms.paginas().find((p) => p.slug === 'sedes-y-horarios' && p.estado === 'publicada') ?? null);

  elegirArea(a: string): void {
    this.area.set(this.area() === a ? '' : a);
  }

  limpiar(): void {
    this.busqueda.set('');
    this.area.set('');
  }

  esJudicial(d: Dependencia): boolean {
    return /judicial/.test(normalizar(d.entrada.titulo));
  }

  iconoContacto(c: Contacto): string {
    if (c.tipo === 'correo') return 'govco:envelope';
    if (c.tipo === 'whatsapp') return 'govco:whatsapp';
    if (c.tipo === 'tel') return /cel|movil/.test(normalizar(c.etiqueta)) ? 'govco:mobile-alt' : 'govco:phone-alt';
    return 'govco:info-circle';
  }

  async copiar(valor: string): Promise<void> {
    try {
      await navigator.clipboard.writeText(valor);
      this.copiado.set(valor);
      setTimeout(() => this.copiado() === valor && this.copiado.set(null), 2500);
    } catch {
      /* el navegador no permite copiar: el enlace sigue disponible */
    }
  }
}
