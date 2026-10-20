import { inject, Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { CMS_CONFIG } from './cms-config';
import { CambioOrdenPagina, CmsColeccion, CmsDataSource, MetaArchivo } from './cms-datasource';
import { CmsMultimedia } from '../../models/cms/cms.models';

/**
 * Implementación contra la API REST (Node.js + MySQL).
 *
 *  GET    /cms/:coleccion
 *  POST   /cms/:coleccion
 *  PUT    /cms/:coleccion/:id
 *  DELETE /cms/:coleccion/:id
 *  PUT    /cms/paginas/orden            body: CambioOrdenPagina[]
 *  POST   /cms/multimedia/upload        multipart: archivo + titulo/alt/descripcion
 */
@Injectable()
export class CmsHttpDataSource extends CmsDataSource {
  private http = inject(HttpClient);
  private base = `${inject(CMS_CONFIG).apiUrl}/cms`;

  listar<T>(c: CmsColeccion): Observable<T[]> {
    return this.http.get<T[]>(`${this.base}/${c}`);
  }

  crear<T>(c: CmsColeccion, data: Partial<T>): Observable<T> {
    return this.http.post<T>(`${this.base}/${c}`, data);
  }

  actualizar<T>(c: CmsColeccion, id: number, data: Partial<T>): Observable<T> {
    return this.http.put<T>(`${this.base}/${c}/${id}`, data);
  }

  eliminar(c: CmsColeccion, id: number): Observable<void> {
    return this.http.delete<void>(`${this.base}/${c}/${id}`);
  }

  reordenarPaginas(cambios: CambioOrdenPagina[]): Observable<void> {
    return this.http.put<void>(`${this.base}/paginas/orden`, cambios);
  }

  subirArchivo(archivo: File, meta: MetaArchivo = {}): Observable<CmsMultimedia> {
    const fd = new FormData();
    fd.append('archivo', archivo, archivo.name);
    Object.entries(meta).forEach(([k, v]) => v && fd.append(k, v));
    return this.http.post<CmsMultimedia>(`${this.base}/multimedia/upload`, fd);
  }

  registrarUrl(data: Partial<CmsMultimedia>): Observable<CmsMultimedia> {
    return this.http.post<CmsMultimedia>(`${this.base}/multimedia`, data);
  }
}
