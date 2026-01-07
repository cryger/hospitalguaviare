import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class ScreenReaderService {
  private enabled = false;
  private utterance: SpeechSynthesisUtterance | null = null;

  constructor() {}

  enable(): void {
    this.enabled = true;
    localStorage.setItem('screen-reader', 'true');
  }

  disable(): void {
    this.enabled = false;
    speechSynthesis.cancel();
    localStorage.setItem('screen-reader', 'false');
  }

  isEnabled(): boolean {
    if (this.enabled) return true;
    return localStorage.getItem('screen-reader') === 'true';
  }

  speak(text: string): void {
    if (!this.isEnabled()) return;
    if (!text) return;

    // Cancelar lectura anterior
    speechSynthesis.cancel();

    this.utterance = new SpeechSynthesisUtterance(text);
    this.utterance.lang = 'es-ES';
    this.utterance.rate = 1;
    this.utterance.pitch = 1;
    this.utterance.volume = 1;

    speechSynthesis.speak(this.utterance);
  }

}
