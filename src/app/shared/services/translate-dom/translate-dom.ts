import { Injectable } from '@angular/core';
import { TranslationService, IdiomaLibre } from '../../services/translate-site/translate-site';

@Injectable({ providedIn: 'root' })
export class TranslateDomService {

  private idiomaOrigen: IdiomaLibre = 'en';
  private textosOriginales = new Map<Text, string>();

  constructor(private translator: TranslationService) {}

  async traducirPagina(idiomaDestino: IdiomaLibre): Promise<void> {

    const textNodes = this.obtenerTextos(document.body);

    for (const node of textNodes) {

      // Guardar texto original una sola vez
      if (!this.textosOriginales.has(node)) {
        this.textosOriginales.set(node, node.textContent ?? '');
      }

      const original = this.textosOriginales.get(node)!;

      if (idiomaDestino === 'es') {
        node.textContent = original;
        continue;
      }

      const traducido = await this.translator.traducir(
        original,
        this.idiomaOrigen,
        idiomaDestino
      );

      node.textContent = traducido;
    }

    await this.translator.setIdioma(idiomaDestino);
  }

  private obtenerTextos(root: HTMLElement): Text[] {
    const walker = document.createTreeWalker(
      root,
      NodeFilter.SHOW_TEXT,
      {
        acceptNode: node => {
          if (!node.textContent?.trim()) return NodeFilter.FILTER_REJECT;

          const tag = node.parentElement?.tagName;
          if (['SCRIPT', 'STYLE', 'NOSCRIPT', 'INPUT', 'TEXTAREA'].includes(tag!)) {
            return NodeFilter.FILTER_REJECT;
          }

          return NodeFilter.FILTER_ACCEPT;
        }
      }
    );

    const textos: Text[] = [];
    let actual: Node | null;

    while ((actual = walker.nextNode())) {
      textos.push(actual as Text);
    }

    return textos;
  }
}
