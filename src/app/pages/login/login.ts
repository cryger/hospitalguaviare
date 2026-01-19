import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthGuard } from '../../shared/guards/auth/auth-guard';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';

@Component({
  selector: 'app-login',
  templateUrl: './login.html',
  imports:[ReactiveFormsModule,CommonModule],
  styleUrls: ['./login.css']
})
export class Login {

  loginForm!: FormGroup;
  error = '';

  constructor(
    private fb: FormBuilder,
    private authGuard: AuthGuard,
    private router: Router
  ) {
    this.loginForm = this.fb.group({
      username: ['', Validators.required],
      password: ['', Validators.required]
    });
  }

  login(): void {
    if (this.loginForm.invalid) return;

    const { username, password } = this.loginForm.value;

    if (this.authGuard.login(username, password)) {
      this.router.navigate(['/admin']); // 👈 TU DASHBOARD
    } else if(!this.authGuard.login(username,password)){
      localStorage.setItem('usuario', username);

      this.error = 'Usuario o contraseña incorrectos';
    }


  }
}
