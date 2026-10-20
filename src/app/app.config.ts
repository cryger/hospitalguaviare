import { ApplicationConfig, provideBrowserGlobalErrorListeners } from '@angular/core';
import { registerLocaleData } from '@angular/common';
import localeEsCO from '@angular/common/locales/es-CO';
import { provideRouter, withComponentInputBinding } from '@angular/router';
import { provideHttpClient, withFetch, withInterceptors } from '@angular/common/http';

import { routes } from './app.routes';
import { provideCms } from './shared/services/cms/cms.providers';
import { cmsAuthInterceptor } from './shared/services/cms/cms-auth.interceptor';
import { environment } from '../environments/environment';

registerLocaleData(localeEsCO, 'es-CO');

export const appConfig: ApplicationConfig = {
  providers: [
    provideBrowserGlobalErrorListeners(),
    provideRouter(routes, withComponentInputBinding()),
    provideHttpClient(withFetch(), withInterceptors([cmsAuthInterceptor])),
    // CMS: se configura en src/environments (local en desarrollo, api en producción)
    provideCms(environment.cms),
  ],
};
