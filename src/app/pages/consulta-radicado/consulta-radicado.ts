import { Component, computed, inject, signal } from '@angular/core';
import { DatePipe } from '@angular/common';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { RouterLink } from '@angular/router';
import {
  ContratacionService,
  HistoriaClinicaService,
  PqrsfdService,
  mensajeError,
} from '../../shared/services/solicitudes/solicitudes.service';
import { ParticipacionService } from '../../shared/services/participacion/participacion.service';
import {
  ConsultaPublica,
  nombreEstadoContractual,
  nombreEstadoHistoria,
  nombreEstadoPqrsfd,
  tamanoLegible,
} from '../../shared/models/solicitudes/solicitudes';
import { AporteEstado, nombreEstadoAporte } from '../../shared/models/participacion/participacion';
import { CMS_CONFIG } from '../../shared/services/cms/cms-config';

type Sistema = 'pqrsfd' | 'historia' | 'participacion' | 'contratacion';

interface DefSistema {
  prefijo: string;
  nombre: string;
  ejemplo: string;
  pideDocumento: boolean;
  pideCodigo: boolean;
  ruta: string; // página del sistema (para «ver detalle»)
}

const SISTEMAS: Record<Sistema, DefSistema> = {
  pqrsfd: { prefijo: 'PQRSFD-', nombre: 'PQRSFD', ejemplo: 'PQRSFD-2026-000123', pideDocumento: false, pideCodigo: true, ruta: '/pqrsf' },
  historia: { prefijo: 'HC-', nombre: 'Copia de historia clínica', ejemplo: 'HC-2026-000123', pideDocumento: true, pideCodigo: true, ruta: '/solicitud-historia-clinica' },
  participacion: { prefijo: 'PC-', nombre: 'Aporte a consulta ciudadana', ejemplo: 'PC-2026-000123', pideDocumento: true, pideCodigo: false, ruta: '/participacion' },
  contratacion: { prefijo: 'SC-', nombre: 'Solicitud contractual', ejemplo: 'SC-2026-000123', pideDocumento: true, pideCodigo: false, ruta: '/solicitudes-contractuales' },
};

/** Pasos (3) comunes a PQRSFD, historia clínica y solicitudes contractuales */
const PASO_SOLICITUD = (e: string): number => ({ radicada: 1, en_tramite: 2, trasladada: 2, respondida: 3, cerrada: 3, rechazada: 3 } as Record<string, number>)[e] ?? 1;

interface Adjunto { id: number; nombre: string; tamano: number }

interface Resultado {
  sistema: Sistema;
  sistemaNombre: string;
  radicado: string;
  estado: string;
  estadoNombre: string;
  paso: number;
  pasos: string[];
  fechaRadicacion?: string;
  fechaVencimiento?: string;
  fechaRespuesta?: string | null;
  detalle?: string; // asunto / alcance / título de la consulta
  respuesta?: string;
  adjuntos: Adjunto[];
  enlaceRuta?: unknown[]; // participación: ir a la consulta
  enlaceTexto?: string;
}

/**
 * Consulta unificada por radicado (RT-06). Una sola ventanilla para conocer el
 * estado de una PQRSFD, una copia de historia clínica, un aporte a una consulta
 * ciudadana o una solicitud contractual. Detecta el sistema por el prefijo del
 * radicado y pide solo la credencial que corresponde. Usa la API (modo «api»).
 */
@Component({
  selector: 'app-consulta-radicado',
  imports: [ReactiveFormsModule, DatePipe, RouterLink],
  templateUrl: './consulta-radicado.html',
  styleUrls: ['../../shared/styles/formulario-govco.css', './consulta-radicado.css'],
})
export class ConsultaRadicado {
  private fb = inject(FormBuilder);
  private pqrsfd = inject(PqrsfdService);
  private contratacion = inject(ContratacionService);
  private historia = inject(HistoriaClinicaService);
  private participacion = inject(ParticipacionService);

  readonly disponible = inject(CMS_CONFIG).modo === 'api';
  readonly sistemas = Object.values(SISTEMAS);
  readonly nombreTamano = tamanoLegible;

  readonly form = this.fb.nonNullable.group({
    radicado: ['', Validators.required],
    numeroDocumento: [''],
    codigo: [''],
  });
  private readonly radicado = signal('');

  /** Sistema detectado por el prefijo del radicado */
  readonly sistema = computed<DefSistema | null>(() => {
    const r = this.radicado().trim().toUpperCase();
    return this.sistemas.find((s) => r.startsWith(s.prefijo)) ?? null;
  });

  readonly intentado = signal(false);
  readonly consultando = signal(false);
  readonly error = signal('');
  readonly resultado = signal<Resultado | null>(null);
  readonly errorDescarga = signal('');

  constructor() {
    this.form.controls.radicado.valueChanges.subscribe((v) => this.radicado.set(v ?? ''));
  }

  async consultar(): Promise<void> {
    this.intentado.set(true);
    this.error.set('');
    this.errorDescarga.set('');
    this.resultado.set(null);
    const def = this.sistema();
    const v = this.form.getRawValue();
    const radicado = v.radicado.trim().toUpperCase().replace(/\s/g, '');
    const documento = v.numeroDocumento.trim();
    const codigo = v.codigo.trim();

    if (!radicado) return this.error.set('Escriba el número de radicado.');
    if (!def) return this.error.set('No reconocemos ese radicado. Debe empezar por PQRSFD-, HC-, PC- o SC-.');
    if (def.pideDocumento && !documento) return this.error.set('Escriba el número de documento con el que hizo la solicitud.');
    if (def.pideCodigo && !codigo) return this.error.set('Escriba el código de consulta que recibió.');

    if (!this.disponible) {
      return this.error.set('La consulta en línea estará disponible cuando el portal esté conectado a su servidor de datos.');
    }

    this.consultando.set(true);
    try {
      const sistema = this.sistemaDe(def);
      if (sistema === 'pqrsfd') {
        this.resultado.set(this.deSolicitud('pqrsfd', 'PQRSFD', await this.pqrsfd.consultar({ radicado, codigo }), nombreEstadoPqrsfd, ['Radicada', 'En trámite', 'Respondida']));
      } else if (sistema === 'contratacion') {
        this.resultado.set(this.deSolicitud('contratacion', 'Solicitud contractual', await this.contratacion.consultar({ cedula: documento, radicado }), nombreEstadoContractual, ['Radicada', 'En trámite', 'Respondida']));
      } else if (sistema === 'historia') {
        this.resultado.set(this.deSolicitud('historia', 'Copia de historia clínica', await this.historia.consultar({ numeroDocumento: documento, radicado, codigo }), nombreEstadoHistoria, ['Radicada', 'En trámite', 'Entregada']));
      } else {
        this.resultado.set(this.deAporte(await this.participacion.estadoAporte({ numeroDocumento: documento, radicado })));
      }
    } catch (e) {
      this.error.set(mensajeError(e, 'No encontramos una solicitud con esos datos. Revise el radicado y las credenciales.'));
    } finally {
      this.consultando.set(false);
    }
  }

  private sistemaDe(def: DefSistema): Sistema {
    return (Object.keys(SISTEMAS) as Sistema[]).find((k) => SISTEMAS[k] === def)!;
  }

  private deSolicitud(sistema: Sistema, nombre: string, c: ConsultaPublica, nombreEstado: (e: string) => string, pasos: string[]): Resultado {
    return {
      sistema,
      sistemaNombre: nombre,
      radicado: c.radicado,
      estado: c.estado,
      estadoNombre: nombreEstado(c.estado),
      paso: PASO_SOLICITUD(c.estado),
      pasos,
      fechaRadicacion: c.fechaRadicacion,
      fechaVencimiento: c.fechaVencimiento,
      fechaRespuesta: c.fechaRespuesta,
      detalle: c.asunto || (c.vigencias?.length ? `Vigencias: ${c.vigencias.join(', ')}` : ''),
      respuesta: c.respuesta,
      adjuntos: c.adjuntos ?? [],
    };
  }

  private deAporte(a: AporteEstado): Resultado {
    const paso = ({ recibido: 1, en_analisis: 2, incorporado: 3, no_incorporado: 3 } as Record<string, number>)[a.estado] ?? 1;
    return {
      sistema: 'participacion',
      sistemaNombre: 'Aporte a consulta ciudadana',
      radicado: a.radicado,
      estado: a.estado,
      estadoNombre: nombreEstadoAporte(a.estado),
      paso,
      pasos: ['Recibido', 'En análisis', a.estado === 'no_incorporado' ? 'No incorporado' : 'Incorporado'],
      fechaRadicacion: a.fechaRadicacion,
      detalle: a.consulta,
      respuesta: a.respuesta,
      adjuntos: [],
      enlaceRuta: ['/participacion', a.consultaSlug],
      enlaceTexto: 'Ver la consulta ciudadana',
    };
  }

  async descargar(adj: Adjunto): Promise<void> {
    const r = this.resultado();
    if (!r) return;
    const v = this.form.getRawValue();
    const radicado = r.radicado;
    const documento = v.numeroDocumento.trim();
    const codigo = v.codigo.trim();
    this.errorDescarga.set('');
    try {
      if (r.sistema === 'pqrsfd') await this.pqrsfd.descargarPublico({ radicado, codigo, id: adj.id }, adj.nombre);
      else if (r.sistema === 'contratacion') await this.contratacion.descargarPublico({ cedula: documento, radicado, id: adj.id }, adj.nombre);
      else if (r.sistema === 'historia') await this.historia.descargarPublico({ numeroDocumento: documento, radicado, codigo, id: adj.id }, adj.nombre);
    } catch (e) {
      this.errorDescarga.set(mensajeError(e, 'No se pudo descargar el archivo. Intente de nuevo.'));
    }
  }
}
