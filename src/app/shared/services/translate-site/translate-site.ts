import { Injectable } from '@angular/core';

export type IdiomaLibre = 'es' | 'en' | 'fr' | 'pt' | 'de' | 'it';

@Injectable({
  providedIn: 'root'
})
export class TranslationService {

  private apiUrl = 'https://libretranslate.de/translate'; // API LibreTranslate
  private idiomaActual: IdiomaLibre = 'es';

  constructor() {
    const saved = localStorage.getItem('idioma-traduccion');
    if (saved) {
      this.idiomaActual = saved as IdiomaLibre;
    }
  }

  getIdiomaActual(): IdiomaLibre {
    return this.idiomaActual;
  }

  async traducir(
    texto: string,
    from: IdiomaLibre = 'es',
    to: IdiomaLibre = 'en'
  ): Promise<string> {
    if (!texto || texto.trim().length === 0) {
      return texto;
    }

    try {
      const response = await fetch(this.apiUrl, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          q: texto,
          source: from,
          target: to,
          format: 'text'
        })
      });

      const data = await response.json();
      return data?.translatedText ?? texto;
    } catch (err) {
      console.error('Translation error:', err);
      return texto;
    }
  }

  async setIdioma(nuevo: IdiomaLibre): Promise<void> {
    if (nuevo === this.idiomaActual) return;
    this.idiomaActual = nuevo;
    localStorage.setItem('idioma-traduccion', nuevo);
  }
}
