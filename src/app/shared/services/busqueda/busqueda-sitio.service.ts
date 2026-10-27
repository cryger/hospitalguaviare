import { Injectable, computed, inject } from '@angular/core';
import { CmsService } from '../cms/cms.service';
import { CmsEntrada, CmsPagina } from '../../models/cms/cms.models';
import { extracto, normalizar, terminosDe } from '../../utils/busqueda';

export type TipoResultado = 'seccion' | 'noticia' | 'documento' | 'servicio' | 'contenido';

export interface ResultadoBusqueda {
  clave: string;
  tipo: TipoResultado;
  titulo: string;
  /** Texto plano para el extracto */
  texto: string;
  /** Página superior (para ubicar el resultado) */
  seccion: string;
  url: string;
  externa: boolean;
  fecha: string | null;
  /** Índice normalizado: título y cuerpo por separado para ponderar */
  idxTitulo: string;
  idxCuerpo: string;
}

export interface ResultadoPuntuado extends ResultadoBusqueda {
  puntaje: number;
  extracto: string;
}

export const ETIQUETAS_TIPO: Record<TipoResultado, string> = {
  seccion: 'Sección',
  noticia: 'Noticia',
  documento: 'Documento',
  servicio: 'Trámite o servicio',
  contenido: 'Contenido',
};

/** Páginas del sistema (fuera del CMS) que también se pueden encontrar */
const PAGINAS_FIJAS: { titulo: string; url: string; texto: string }[] = [
  { titulo: 'PQRSF – Peticiones, quejas, reclamos, sugerencias y felicitaciones', url: '/pqrsf', texto: 'Radique su petición, queja, reclamo, sugerencia, felicitación o denuncia en línea.' },
  { titulo: 'Invitaciones a cotizar', url: '/informacion-de-interes/invitaciones-a-cotizar', texto: 'Procesos de cotización y propuestas abiertos por la E.S.E.' },
  { titulo: 'Trabaja con nosotros', url: '/informacion-de-interes/trabaja-con-nosotros', texto: 'Convocatorias laborales y vacantes vigentes.' },
  { titulo: 'Mapa del sitio', url: '/mapa-del-sitio', texto: 'Estructura completa del portal.' },
];

/**
 * Búsqueda en todo el portal: páginas, entradas y archivos publicados del CMS.
 * La usan el buscador de la cabecera (sugerencias) y la página /buscar.
 */
@Injectable({ providedIn: 'root' })
export class BusquedaSitioService {
  private cms = inject(CmsService);

  cargar(): Promise<void> {
    return this.cms.cargar();
  }

  /** ¿La página y todas sus superiores están publicadas? */
  private visible(p: CmsPagina | undefined): boolean {
    let actual = p;
    let guardia = 0;
    while (actual && guardia++ < 20) {
      if (!this.cms.esPublica(actual)) return false;
      actual = actual.parentId ? this.cms.paginaPorId().get(actual.parentId) : undefined;
    }
    return !!p;
  }

  private tipoEntrada(e: CmsEntrada): TipoResultado {
    if (e.tipo === 'noticia') return 'noticia';
    if (e.tipo === 'documento') return 'documento';
    if (e.tipo === 'servicio') return 'servicio';
    return 'contenido';
  }

  readonly indice = computed<ResultadoBusqueda[]>(() => {
    const paginas = this.cms.paginaPorId();
    const media = this.cms.multimediaPorId();
    const lista: ResultadoBusqueda[] = [];

    for (const p of this.cms.paginas()) {
      if (!this.visible(p)) continue;
      const url = this.cms.urlPagina(p);
      const padre = p.parentId ? paginas.get(p.parentId) : undefined;
      lista.push({
        clave: 'p' + p.id,
        tipo: 'seccion',
        titulo: p.titulo,
        texto: p.descripcion ?? '',
        seccion: padre?.titulo ?? 'Inicio',
        url,
        externa: this.cms.esExterna(url),
        fecha: null,
        idxTitulo: normalizar(p.titulo),
        idxCuerpo: normalizar(p.descripcion),
      });
    }

    for (const e of this.cms.entradas()) {
      const p = paginas.get(e.paginaId);
      if (!this.cms.esEntradaPublica(e) || !this.visible(p)) continue;
      const archivos = e.multimediaIds.map((id) => media.get(id)?.titulo ?? '').join(' ');
      lista.push({
        clave: 'e' + e.id,
        tipo: this.tipoEntrada(e),
        titulo: e.titulo,
        texto: e.resumen || e.contenido || '',
        seccion: p!.titulo,
        url: this.cms.urlEntrada(e),
        externa: false,
        fecha: e.fechaPublicacion || null,
        idxTitulo: normalizar(e.titulo),
        idxCuerpo: normalizar([e.resumen, e.contenido, archivos].join(' ')),
      });
    }

    for (const f of PAGINAS_FIJAS) {
      if (lista.some((r) => r.url === f.url)) continue;
      lista.push({
        clave: 'f' + f.url, tipo: 'seccion', titulo: f.titulo, texto: f.texto, seccion: 'Portal', url: f.url,
        externa: false, fecha: null, idxTitulo: normalizar(f.titulo), idxCuerpo: normalizar(f.texto),
      });
    }
    return lista;
  });

  /** Resultados ordenados por relevancia (título primero) y luego por fecha */
  buscar(consulta: string): ResultadoPuntuado[] {
    const terminos = terminosDe(consulta);
    if (!terminos.length) return [];
    const frase = normalizar(consulta);
    const salida: ResultadoPuntuado[] = [];
    for (const r of this.indice()) {
      let puntaje = 0;
      let todas = true;
      for (const t of terminos) {
        const enTitulo = r.idxTitulo.includes(t);
        const enCuerpo = r.idxCuerpo.includes(t);
        if (!enTitulo && !enCuerpo) { todas = false; break; }
        puntaje += enTitulo ? 5 : 1;
        if (enTitulo && new RegExp(`(^|\\s)${t.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')}`).test(r.idxTitulo)) puntaje += 2;
      }
      if (!todas) continue;
      if (r.idxTitulo.includes(frase)) puntaje += 10;
      if (r.idxTitulo === frase) puntaje += 10;
      if (r.tipo === 'seccion') puntaje += 1;
      salida.push({ ...r, puntaje, extracto: extracto(r.texto, terminos) });
    }
    return salida.sort((a, b) => b.puntaje - a.puntaje || (b.fecha ?? '').localeCompare(a.fecha ?? ''));
  }
}
