/**
 * Configuración de PRODUCCIÓN (ng build / Vercel).
 * Cuando la API esté publicada, reemplace API_URL por su dirección real,
 * ej. 'https://api.esehospitalguaviare.gov.co/api'.
 * Mientras siga con el valor de ejemplo, el CMS funciona en modo local.
 */
const API_URL = 'https://CAMBIAR-DOMINIO-API/api';

export const environment = {
  production: true,
  cms: {
    modo: (API_URL.includes('CAMBIAR') ? 'local' : 'api') as 'local' | 'api',
    apiUrl: API_URL,
    maxArchivoMb: 20,
  },
};
