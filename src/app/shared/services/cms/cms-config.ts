import { InjectionToken } from '@angular/core';

export interface CmsConfig {
  /**
   * 'local' → guarda en localStorage (desarrollo / demo, sin backend).
   * 'api'   → consume la API Node.js + MySQL.
   */
  modo: 'local' | 'api';
  /** URL base de la API, ej. 'http://localhost:3000/api' o '/api' con proxy */
  apiUrl: string;
  /** Tamaño máximo por archivo en MB */
  maxArchivoMb: number;
}

export const CMS_CONFIG = new InjectionToken<CmsConfig>('CMS_CONFIG', {
  providedIn: 'root',
  factory: () => ({ modo: 'local', apiUrl: '/api', maxArchivoMb: 20 }),
});
