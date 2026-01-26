import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { firstValueFrom } from 'rxjs';

export type IdiomaLibre = 'es' | 'en' | 'fr' | 'pt' | 'de' | 'it';

interface MyMemoryResponse {
  responseData: {
    translatedText: string;
    match: number;
  };
  quotaFinished: boolean;
  responseStatus: number;
}

@Injectable({
  providedIn: 'root'
})
export class TranslationService {
  private apiUrl = 'https://api.mymemory.translated.net/get';
  private idiomaActual: IdiomaLibre = 'es';
  private cache = new Map<string, string>();
  private originalContent = new Map<Element, string>();

  constructor(private http: HttpClient) {
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

    if (from === to) {
      return texto;
    }

    const cacheKey = `${from}-${to}-${texto}`;
    if (this.cache.has(cacheKey)) {
      return this.cache.get(cacheKey)!;
    }

    const maxLength = 500;
    let textoParaTraducir = texto;

    if (texto.length > maxLength) {
      textoParaTraducir = texto.substring(0, maxLength);
    }

    try {
      const params = {
        q: textoParaTraducir,
        langpair: `${from}|${to}`
      };

      const response = await firstValueFrom(
        this.http.get<MyMemoryResponse>(this.apiUrl, { params })
      );

      if (response?.responseData?.translatedText) {
        const traduccion = response.responseData.translatedText;
        this.cache.set(cacheKey, traduccion);
        return traduccion;
      }

      return texto;
    } catch (err) {
      console.error('Translation error:', err);
      return texto;
    }
  }

  /**
   * Traduce toda la página web
   */
  async traducirPagina(idiomaDestino: IdiomaLibre): Promise<void> {
    console.log(`🌐 Iniciando traducción de página a: ${idiomaDestino}`);

    if (idiomaDestino === 'es') {
      this.restaurarPagina();
      return;
    }

    // Mostrar indicador de carga
    this.mostrarCargando(true);

    try {
      // Seleccionar todos los elementos con texto
      const elementos = this.obtenerElementosTraducibles();

      console.log(`📝 Elementos a traducir: ${elementos.length}`);

      let traducidos = 0;

      // Traducir cada elemento
      for (const elemento of elementos) {
        try {
          // Guardar contenido original
          if (!this.originalContent.has(elemento)) {
            this.originalContent.set(elemento, elemento.textContent || '');
          }

          const textoOriginal = this.originalContent.get(elemento) || '';

          if (textoOriginal.trim().length > 0) {
            const textoTraducido = await this.traducir(textoOriginal, 'es', idiomaDestino);
            elemento.textContent = textoTraducido;
            traducidos++;

            // Pequeña pausa para no saturar la API
            if (traducidos % 5 === 0) {
              await this.delay(200);
            }
          }
        } catch (error) {
          console.error('Error traduciendo elemento:', error);
        }
      }

      console.log(`✅ Traducción completada: ${traducidos} elementos`);

      // Actualizar idioma actual
      this.idiomaActual = idiomaDestino;
      localStorage.setItem('idioma-traduccion', idiomaDestino);

    } catch (error) {
      console.error('❌ Error general en traducción de página:', error);
      alert('Error al traducir la página. Por favor, intenta de nuevo.');
    } finally {
      this.mostrarCargando(false);
    }
  }

  /**
   * Restaura la página al idioma original (español)
   */
  restaurarPagina(): void {
    console.log('🔄 Restaurando página al español...');

    this.originalContent.forEach((textoOriginal, elemento) => {
      elemento.textContent = textoOriginal;
    });

    this.idiomaActual = 'es';
    localStorage.setItem('idioma-traduccion', 'es');

    console.log('✅ Página restaurada');
  }

  /**
   * Obtiene todos los elementos que deben ser traducidos
   */
  private obtenerElementosTraducibles(): Element[] {
    const selectores = [
      'p',           // Párrafos
      'h1', 'h2', 'h3', 'h4', 'h5', 'h6',  // Títulos
      'span',        // Textos inline
      'a',           // Enlaces
      'li',          // Items de lista
      'td', 'th',    // Celdas de tabla
      'button',      // Botones
      'label',       // Etiquetas
      '.card-title', // Títulos de tarjetas
      '.card-text',  // Textos de tarjetas
    ];

    // Elementos a excluir
    const excluidos = [
      'script',
      'style',
      'code',
      'pre',
      '[translate="no"]',  // Elementos marcados explícitamente
      '.no-translate',     // Clase para excluir
    ];

    const elementos: Element[] = [];

    for (const selector of selectores) {
      const encontrados = document.querySelectorAll(selector);

      encontrados.forEach(elemento => {
        // Verificar que no esté excluido
        let debeExcluir = false;

        for (const excluido of excluidos) {
          if (elemento.matches(excluido) || elemento.closest(excluido)) {
            debeExcluir = true;
            break;
          }
        }

        // Verificar que tenga texto directo (no solo hijos)
        if (!debeExcluir && elemento.childNodes.length > 0) {
          const tieneTextoDirecto = Array.from(elemento.childNodes).some(
            node => node.nodeType === Node.TEXT_NODE && node.textContent?.trim()
          );

          if (tieneTextoDirecto) {
            elementos.push(elemento);
          }
        }
      });
    }

    // Eliminar duplicados
    return Array.from(new Set(elementos));
  }

  /**
   * Muestra/oculta indicador de carga
   */
  private mostrarCargando(mostrar: boolean): void {
    const loaderId = 'translation-loader';
    let loader = document.getElementById(loaderId);

    if (mostrar) {
      if (!loader) {
        loader = document.createElement('div');
        loader.id = loaderId;
        loader.innerHTML = `
          <div style="
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.7);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 9999;
            color: white;
            font-family: Arial, sans-serif;
          ">
            <div style="text-align: center;">
              <div style="
                width: 50px;
                height: 50px;
                border: 5px solid #f3f3f3;
                border-top: 5px solid #667eea;
                border-radius: 50%;
                animation: spin 1s linear infinite;
                margin: 0 auto 20px;
              "></div>
              <p style="font-size: 18px; margin: 0;">Traduciendo página...</p>
              <p style="font-size: 14px; opacity: 0.8; margin-top: 10px;">Por favor espera</p>
            </div>
          </div>
          <style>
            @keyframes spin {
              0% { transform: rotate(0deg); }
              100% { transform: rotate(360deg); }
            }
          </style>
        `;
        document.body.appendChild(loader);
      }
    } else {
      if (loader) {
        loader.remove();
      }
    }
  }

  private delay(ms: number): Promise<void> {
    return new Promise(resolve => setTimeout(resolve, ms));
  }

  async setIdioma(nuevo: IdiomaLibre): Promise<void> {
    if (nuevo === this.idiomaActual) {
      return;
    }

    await this.traducirPagina(nuevo);
  }

  limpiarCache(): void {
    this.cache.clear();
    this.originalContent.clear();
    console.log('✓ Cache de traducciones limpiado');
  }
}
