import { EnvironmentProviders, makeEnvironmentProviders } from '@angular/core';
import { CMS_CONFIG, CmsConfig } from './cms-config';
import { CmsDataSource } from './cms-datasource';
import { CmsHttpDataSource } from './cms-http.datasource';
import { CmsLocalDataSource } from './cms-local.datasource';

/** Registra el CMS. Cambiar `modo: 'api'` cuando el backend esté listo. */
export function provideCms(config: Partial<CmsConfig> = {}): EnvironmentProviders {
  const final: CmsConfig = { modo: 'local', apiUrl: '/api', maxArchivoMb: 20, ...config };
  return makeEnvironmentProviders([
    { provide: CMS_CONFIG, useValue: final },
    { provide: CmsDataSource, useClass: final.modo === 'api' ? CmsHttpDataSource : CmsLocalDataSource },
  ]);
}
