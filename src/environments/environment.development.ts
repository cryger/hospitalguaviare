/**
 * Configuración de DESARROLLO (ng serve).
 * - modo 'local': guarda en el navegador, no necesita la API.
 * - modo 'api'  : use la API local (cd api && npm run dev) → apiUrl 'http://localhost:3000/api'
 */
export const environment = {
  production: false,
  cms: {
    modo: 'local' as 'local' | 'api',
    apiUrl: 'http://localhost:3000/api',
    maxArchivoMb: 20,
  },
};
