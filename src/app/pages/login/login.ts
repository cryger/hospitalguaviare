import { Component } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { Auth } from '../../shared/services/auth/auth';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';

@Component({
  selector: 'app-login',
  templateUrl: './login.html',
  imports: [CommonModule, ReactiveFormsModule],
  styleUrls: ['./login.css']
})
export class Login {

  error = '';

  loginForm;

  constructor(
    private fb: FormBuilder,
    private auth: Auth,
    private router: Router
  ) {
    this.loginForm = this.fb.group({
      username: ['', Validators.required],
      password: ['', Validators.required]
    });
  }

  login() {
    const { username, password } = this.loginForm.value;

    if (this.auth.login(username!, password!)) {
      this.router.navigate(['/dashboard']);
    } else {
      this.error = 'Credenciales inválidas';
    }
  }
}
