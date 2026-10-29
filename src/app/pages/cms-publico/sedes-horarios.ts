import { Component, OnDestroy, computed, inject, input, signal } from '@angular/core';
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';
import { CmsService } from '../../shared/services/cms/cms.service';
import { CmsEntrada, CmsMultimedia } from '../../shared/models/cms/cms.models';
import { normalizar } from '../../shared/utils/busqueda';
import { EstadoHorario, TramoHorario, ahoraColombia, estadoHorario, horaLegible, leerHorario } from '../../shared/utils/horarios';
import { IconoCms } from '../../shared/components/icono-cms/icono-cms';
import { Contacto, leerContactos } from '../../shared/utils/contactos';

interface Sede {
  entrada: CmsEntrada;
  direccion: string;
  contactos: Contacto[];
  notas: string;
  mapa: SafeResourceUrl;
  comoLlegar: string;
  foto: CmsMultimedia | null;
}

interface Horario {
  entrada: CmsEntrada;
  icono: string;
  tramos: TramoHorario[];
  estado: EstadoHorario | null;
}

const ICONOS: [RegExp, string][] = [
  [/urgencia/, 'govco:hospital-symbol'],
  [/ambulancia|traslado/, 'govco:ambulance'],
  [/laborator/, 'govco:flask'],
  [/farmacia|medicamento/, 'govco:pills'],
  [/imagen|radiolog|rayos/, 'govco:x-ray'],
  [/consulta|atencion al publico|administrativ/, 'govco:user-md'],
  [/pqr|usuario|siau/, 'govco:headset'],
];

/**
 * Plantilla "sedes": sedes con mapa y datos de contacto, y horarios de atención con
 * el estado en vivo (abierto/cerrado, hora de Colombia). Se administra desde Entradas:
 * - Grupo «Sede»: título = nombre; resumen = dirección; contenido = lista «Etiqueta: valor»
 *   (teléfonos y correos se vuelven enlaces) y, opcional, «Coordenadas: lat, lng» para el mapa.
 * - Grupo «Horario»: título = servicio; resumen = horario, ej. «Lunes a viernes 7:00-12:00, 14:00-18:00; Sábados 8:00-13:00».
 */
@Component({
  selector: 'app-sedes-horarios',
  imports: [IconoCms],
  templateUrl: './sedes-horarios.html',
  styleUrl: './sedes-horarios.css',
})
export class SedesHorarios implements OnDestroy {
  private cms = inject(CmsService);
  private sanitizer = inject(DomSanitizer);

  readonly entradas = input.required<CmsEntrada[]>();
  readonly horaLegible = horaLegible;

  /** Se actualiza cada minuto para el estado «abierto ahora» */
  private readonly reloj = signal(new Date());
  private readonly intervalo = setInterval(() => this.reloj.set(new Date()), 60_000);
  readonly hoy = computed(() => ahoraColombia(this.reloj()).dia);

  private grupo(e: CmsEntrada): string {
    return normalizar(e.categoria ?? '').trim();
  }

  readonly sedes = computed<Sede[]>(() =>
    this.entradas()
      .filter((e) => this.grupo(e) === 'sede')
      .map((e) => this.leerSede(e)),
  );

  readonly horarios = computed<Horario[]>(() => {
    const ahora = this.reloj();
    return this.entradas()
      .filter((e) => this.grupo(e) === 'horario')
      .map((e) => {
        const tramos = leerHorario(e.resumen);
        const clave = normalizar(e.titulo);
        return {
          entrada: e,
          icono: e.icono || ICONOS.find(([r]) => r.test(clave))?.[1] || 'govco:clock',
          tramos,
          estado: estadoHorario(tramos, ahora),
        };
      });
  });

  /** Servicios abiertos todos los días las 24 horas: se agrupan en una franja */
  readonly continuos = computed(() => this.horarios().filter((h) => h.tramos.some((t) => t.veinticuatro && t.dias.length === 7)));
  readonly conHorario = computed(() => this.horarios().filter((h) => !this.continuos().includes(h)));

  readonly otras = computed(() => this.entradas().filter((e) => !['sede', 'horario'].includes(this.grupo(e))));

  /** Contenido de la sede: «Etiqueta: valor» por línea; teléfonos y correos se vuelven enlaces */
  private leerSede(e: CmsEntrada): Sede {
    const { contactos, notas, coordenadas } = leerContactos(e.contenido);
    const direccion = e.resumen ?? '';
    const destino = coordenadas ?? `${direccion}, San José del Guaviare, Guaviare, Colombia`;
    const m = e.imagenDestacadaId ? this.cms.multimediaPorId().get(e.imagenDestacadaId) : undefined;
    return {
      entrada: e,
      direccion,
      contactos,
      notas: notas.join(' '),
      mapa: this.sanitizer.bypassSecurityTrustResourceUrl(`https://maps.google.com/maps?q=${encodeURIComponent(destino)}&z=17&hl=es&output=embed`),
      comoLlegar: `https://www.google.com/maps/dir/?api=1&destination=${encodeURIComponent(destino)}`,
      foto: m?.tipo === 'imagen' ? m : null,
    };
  }

  esHoy(t: TramoHorario): boolean {
    return t.dias.includes(this.hoy());
  }

  rangoTexto(r: [number, number]): string {
    return r[0] === 0 && r[1] === 1440 ? '24 horas' : `${horaLegible(r[0])} – ${horaLegible(r[1])}`;
  }

  ngOnDestroy(): void {
    clearInterval(this.intervalo);
  }
}
