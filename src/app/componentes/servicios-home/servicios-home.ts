import { Component, OnInit, computed, inject } from '@angular/core';
import { RouterLink } from '@angular/router';
import { CmsService } from '../../shared/services/cms/cms.service';
import { ServiciosTarjetas } from '../servicios-tarjetas/servicios-tarjetas';

const MAXIMO = 8;

/**
 * "Nuestros servicios" del inicio.
 * Muestra las entradas de la página de plantilla "Portafolio de servicios"
 * marcadas como «Destacar en portada» (Admin › Contenido › Entradas).
 * Si ninguna está destacada, muestra las primeras según su orden.
 */
@Component({
  selector: 'app-servicios-home',
  imports: [RouterLink, ServiciosTarjetas],
  templateUrl: './servicios-home.html',
  styleUrl: './servicios-home.css',
})
export class ServiciosHome implements OnInit {
  private cms = inject(CmsService);

  /** Página del portafolio: la de slug conocido o la primera con plantilla "servicios" */
  readonly pagina = computed(() => {
    const publicas = this.cms.paginas().filter((p) => p.plantilla === 'servicios' && this.cms.esPublica(p));
    return publicas.find((p) => p.slug === 'portafolio-de-servicios') ?? publicas[0] ?? null;
  });

  readonly todos = computed(() => {
    const p = this.pagina();
    return p ? this.cms.entradasPublicas(p) : [];
  });

  readonly servicios = computed(() => {
    const destacados = this.todos().filter((e) => e.destacada);
    return (destacados.length ? destacados : this.todos()).slice(0, MAXIMO);
  });

  readonly ruta = computed(() => {
    const p = this.pagina();
    return p ? this.cms.rutaPagina(p.id) : null;
  });

  /** Página de Urgencias, para el enlace de la franja de emergencias */
  readonly urlUrgencias = computed(() => {
    const e = this.todos().find((x) => /urgencia/i.test(x.slug));
    return e ? this.cms.urlEntrada(e) : null;
  });

  ngOnInit(): void {
    this.cms.cargar();
  }
}
