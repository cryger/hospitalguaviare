import { Component, inject, signal } from '@angular/core';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { HttpErrorResponse } from '@angular/common/http';
import { CommonModule } from '@angular/common';
import { AuthGuard } from '../../shared/guards/auth/auth-guard';
import { CmsAuthService } from '../../shared/services/cms/cms-auth.service';
import { CmsService } from '../../shared/services/cms/cms.service';
import { PermisosService } from '../../shared/services/permisos/permisos.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.html',
  imports: [ReactiveFormsModule, CommonModule],
  styleUrls: ['./login.css']
})
export class Login {
  private fb = inject(FormBuilder);
  private authGuard = inject(AuthGuard);
  private cmsAuth = inject(CmsAuthService);
  private cms = inject(CmsService);
  private router = inject(Router);
  private permisos = inject(PermisosService);

  loginForm: FormGroup = this.fb.group({
    username: ['', Validators.required],
    password: ['', Validators.required]
  });

  // signals: la app es zoneless y estos valores cambian después de un await
  private readonly params = inject(ActivatedRoute).snapshot.queryParamMap;
  readonly error = signal(
    this.params.has('expirada')
      ? 'Su sesión expiró. Inicie sesión de nuevo.'
      : this.params.has('inactividad')
        ? 'Su sesión se cerró por inactividad. Inicie sesión de nuevo.'
        : '',
  );
  readonly enviando = signal(false);

  async login(): Promise<void> {
    if (this.loginForm.invalid || this.enviando()) return;
    const { username, password } = this.loginForm.value;
    this.error.set('');

    // Modo API: valida contra la base de datos
    if (this.cmsAuth.usaApi) {
      this.enviando.set(true);
      try {
        await this.cmsAuth.login(username, password);
        this.permisos.recargar();
        // Cada usuario entra a su primera página permitida (ej. PQRSFD → /admin/pqrsf)
        const destino = this.permisos.rutaInicio();
        if (this.permisos.puede('contenido')) await this.cms.cargar(true); // borradores incluidos
        this.router.navigateByUrl(destino);
      } catch (e) {
        const err = e as HttpErrorResponse;
        this.error.set(
          err.status === 0
            ? 'No se pudo conectar con el servidor. Intente más tarde.'
            : err.error?.mensaje || 'Usuario o contraseña incorrectos.',
        );
      } finally {
        this.enviando.set(false);
      }
      return;
    }

    // Modo local (desarrollo)
    if (this.authGuard.login(username, password)) {
      this.permisos.recargar();
      this.router.navigate(['/admin']);
    } else {
      this.error.set('Usuario o contraseña incorrectos.');
    }
  }
}
