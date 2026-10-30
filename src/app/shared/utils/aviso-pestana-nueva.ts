/**
 * WCAG 3.2.5 (cambio a petición): todo enlace que abre una pestaña nueva lo anuncia.
 *
 * Vigila el documento (también el contenido HTML que viene del CMS) y, a cada
 * <a target="_blank"> que todavía no lo diga, le agrega el aviso:
 *  - si tiene aria-label, se le añade « (se abre en una pestaña nueva)»;
 *  - si no, se le agrega un texto oculto para lectores de pantalla.
 * No cambia nada visible.
 */
const AVISO = ' (se abre en una pestaña nueva)';
const YA_AVISA = /pesta(ñ|n)a nueva|nueva pesta(ñ|n)a|otra pesta(ñ|n)a|nueva ventana|new tab|new window/i;

function avisar(a: HTMLAnchorElement): void {
  if (a.target !== '_blank') return;
  const etiqueta = a.getAttribute('aria-label');
  if (etiqueta !== null) {
    if (!YA_AVISA.test(etiqueta)) a.setAttribute('aria-label', etiqueta.trim() + AVISO);
    return;
  }
  if (YA_AVISA.test(a.textContent ?? '') || YA_AVISA.test(a.title)) return;
  const span = document.createElement('span');
  span.className = 'aviso-pestana-nueva';
  span.textContent = AVISO;
  a.appendChild(span);
}

function revisar(raiz: ParentNode): void {
  if (raiz instanceof HTMLAnchorElement) avisar(raiz);
  raiz.querySelectorAll?.<HTMLAnchorElement>('a[target="_blank"]').forEach(avisar);
}

let iniciado = false;

export function iniciarAvisoPestanaNueva(): void {
  if (iniciado || typeof document === 'undefined' || typeof MutationObserver === 'undefined') return;
  iniciado = true;
  revisar(document);
  let pendiente = false;
  new MutationObserver(() => {
    // Agrupa los cambios de un mismo ciclo (Angular renderiza en ráfagas)
    if (pendiente) return;
    pendiente = true;
    queueMicrotask(() => {
      pendiente = false;
      revisar(document);
    });
  }).observe(document.body, { subtree: true, childList: true, attributes: true, attributeFilter: ['target', 'aria-label'] });
}
