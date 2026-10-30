import { Component, computed, inject, input, signal } from '@angular/core';
import { CmsService } from '../../shared/services/cms/cms.service';
import { CmsEntrada, CmsMultimedia } from '../../shared/models/cms/cms.models';
import { normalizar } from '../../shared/utils/busqueda';
import { IconoCms } from '../../shared/components/icono-cms/icono-cms';
import { VisorDocumentos, extensionDe, sePuedeVer } from '../../shared/components/visor-documentos/visor-documentos.service';

/** Grupos del mapa de procesos en el orden en que se muestran (campo «Grupo» de la entrada) */
export const GRUPOS_PROCESOS = [
  { clave: 'Mapa de procesos', ayuda: 'Mapa de procesos vigente y el acto que lo adopta (se muestra arriba, destacado).', color: 'mapa' },
  { clave: 'Procesos estratégicos', ayuda: 'Planeación, calidad, gobierno digital, talento humano…', color: 'estrategico' },
  { clave: 'Procesos misionales', ayuda: 'Los servicios de salud: urgencias, cirugía, consulta externa…', color: 'misional' },
  { clave: 'Procesos de apoyo', ayuda: 'Financieros, administrativos, jurídicos, SIAU…', color: 'apoyo' },
  { clave: 'Otros procesos asistenciales', ayuda: 'Procesos documentados que aún no se ubican en un grupo del mapa.', color: 'otros' },
  { clave: 'Sistema de gestión de calidad', ayuda: 'Objetivos de calidad, PAMEC e infografías (se muestra al final).', color: 'calidad' },
] as const;

export interface DocProceso {
  archivo: CmsMultimedia;
  /** «Caracterización del proceso», «Procedimientos», «Formatos»… */
  etiqueta: string;
  ext: string;
  verEnPortal: boolean;
}

interface Proceso {
  entrada: CmsEntrada;
  grupo: string;
  icono: string;
  docs: DocProceso[];
  clave: string;
}

const ICONOS: [RegExp, string][] = [
  [/planeacion/, 'govco:chart-line'], [/estadistic/, 'govco:chart-bar'], [/gobierno digital/, 'govco:laptop'],
  [/calidad|pamec/, 'govco:award'], [/ambiental/, 'govco:leaf'], [/seguridad y salud/, 'govco:hard-hat'],
  [/talento/, 'govco:users'], [/urgencia/, 'govco:ambulance'], [/materno|infantil/, 'govco:baby'],
  [/hospitaliza/, 'govco:procedures'], [/cirugia/, 'govco:user-md'], [/esteriliza/, 'govco:pump-medical'],
  [/consulta externa/, 'govco:stethoscope'], [/laboratorio|muestras/, 'govco:flask'], [/transfusional/, 'govco:tint'],
  [/terapia/, 'govco:wheelchair'], [/contabilidad|costos|presupuesto/, 'govco:calculator'], [/tesoreria|cartera|factura/, 'govco:money-bill-wave'],
  [/activos|almacen|suministros|recursos fisicos/, 'govco:boxes'], [/documental/, 'govco:folder-open'], [/juridica|contratacion/, 'govco:balance-scale'],
  [/disciplinario/, 'govco:shield-alt'], [/atencion al usuario/, 'govco:headset'], [/epidemiolog/, 'govco:virus'],
  [/mantenimiento/, 'govco:tools'], [/trabajo social/, 'govco:hands-helping'], [/imagenes/, 'govco:x-ray'],
  [/medicamentos/, 'govco:pills'], [/referencia/, 'govco:route'], [/cultura/, 'govco:lightbulb'], [/objetivos/, 'govco:bullseye'],
];

/**
 * Plantilla "procesos" (Res. 1519 · 1.3 Mapas y cartas descriptivas de los procesos).
 * Cada proceso es una entrada: título = proceso; grupo = estratégico/misional/apoyo…; resumen = objetivo;
 * archivos adjuntos = caracterización, procedimientos, formatos… (el texto después de «–» en el
 * título del archivo es la etiqueta del botón).
 */
@Component({
  selector: 'app-mapa-procesos',
  imports: [IconoCms],
  templateUrl: './mapa-procesos.html',
  styleUrl: './mapa-procesos.css',
})
export class MapaProcesos {
  private cms = inject(CmsService);
  private visor = inject(VisorDocumentos);

  readonly entradas = input.required<CmsEntrada[]>();
  readonly busqueda = signal('');
  readonly grupo = signal('');
  /** Procesos con el objetivo desplegado */
  readonly abiertos = signal<Set<number>>(new Set());

  alternar(id: number): void {
    const s = new Set(this.abiertos());
    if (s.has(id)) s.delete(id); else s.add(id);
    this.abiertos.set(s);
  }

  private grupoDe(e: CmsEntrada): string {
    const c = normalizar(e.categoria ?? '');
    return GRUPOS_PROCESOS.find((g) => normalizar(g.clave) === c)?.clave ?? (e.categoria?.trim() || 'Otros procesos asistenciales');
  }

  private readonly todos = computed<Proceso[]>(() => {
    const mapa = this.cms.multimediaPorId();
    return this.entradas().map((e) => {
      const docs = e.multimediaIds
        .map((id) => mapa.get(id))
        .filter((m): m is CmsMultimedia => !!m)
        .map((m) => {
          const t = m.titulo || m.nombre;
          const i = t.lastIndexOf(' – ');
          return { archivo: m, etiqueta: i > 0 && t.slice(0, i).trim() === e.titulo ? t.slice(i + 3) : t, ext: extensionDe(m).toUpperCase(), verEnPortal: sePuedeVer(m) };
        });
      const n = normalizar(e.titulo);
      return {
        entrada: e,
        grupo: this.grupoDe(e),
        icono: e.icono || ICONOS.find(([r]) => r.test(n))?.[1] || 'govco:cogs',
        docs,
        clave: normalizar(`${e.titulo} ${e.resumen ?? ''} ${docs.map((d) => d.etiqueta).join(' ')}`),
      };
    });
  });

  readonly mapa = computed(() => this.todos().filter((p) => p.grupo === 'Mapa de procesos'));
  readonly calidad = computed(() => this.todos().filter((p) => p.grupo === 'Sistema de gestión de calidad'));

  /** Imágenes del sistema de calidad (infografías) */
  readonly infografias = computed(() => this.calidad().flatMap((p) => p.docs.filter((d) => d.archivo.tipo === 'imagen')));

  /** Grupos de procesos (sin el mapa ni el sistema de calidad), en el orden definido */
  readonly grupos = computed(() => {
    const procesos = this.todos().filter((p) => p.grupo !== 'Mapa de procesos' && p.grupo !== 'Sistema de gestión de calidad');
    const orden = GRUPOS_PROCESOS.map((g) => g.clave as string);
    const nombres = [...new Set(procesos.map((p) => p.grupo))].sort((a, b) => (orden.indexOf(a) + 99) % 99 - (orden.indexOf(b) + 99) % 99);
    return nombres.map((nombre) => ({
      nombre,
      color: GRUPOS_PROCESOS.find((g) => g.clave === nombre)?.color ?? 'otros',
      procesos: procesos.filter((p) => p.grupo === nombre),
    }));
  });

  readonly totalProcesos = computed(() => this.grupos().reduce((s, g) => s + g.procesos.length, 0));
  readonly totalDocs = computed(() => this.grupos().reduce((s, g) => s + g.procesos.reduce((t, p) => t + p.docs.length, 0), 0));

  readonly visibles = computed(() => {
    const palabras = normalizar(this.busqueda()).split(/\s+/).filter(Boolean);
    return this.grupos()
      .filter((g) => !this.grupo() || g.nombre === this.grupo())
      .map((g) => ({ ...g, procesos: g.procesos.filter((p) => palabras.every((w) => p.clave.includes(w))) }))
      .filter((g) => g.procesos.length);
  });

  readonly conteoVisible = computed(() => this.visibles().reduce((s, g) => s + g.procesos.length, 0));

  elegir(g: string): void {
    this.grupo.set(this.grupo() === g ? '' : g);
  }

  limpiar(): void {
    this.busqueda.set('');
    this.grupo.set('');
  }

  ver(d: DocProceso, lista: DocProceso[]): void {
    this.visor.abrir(d.archivo, lista.filter((x) => x.verEnPortal).map((x) => x.archivo));
  }

  /** Texto (sin HTML) del contenido, para los objetivos de calidad */
  lineas(e: CmsEntrada): string[] {
    const div = document.createElement('div');
    div.innerHTML = e.contenido ?? '';
    return Array.from(div.querySelectorAll('li')).map((li) => li.textContent?.trim() ?? '').filter(Boolean);
  }
}
