// ==========================================
// CLASE PARA LECTOR DE PANTALLA
// ==========================================

class ScreenReaderService {
  constructor() {
    this.synth = window.speechSynthesis;
    this.utterance = null;
    this.isReading = false;
    this.isEnabled = false;
    this.voices = [];
    this.hoverListeners = new Map();

    this.loadVoices();
    this.loadPreferences();
  }

  loadVoices() {
    this.voices = this.synth.getVoices();

    if (this.voices.length === 0) {
      this.synth.addEventListener('voiceschanged', () => {
        this.voices = this.synth.getVoices();
      });
    }
  }

  loadPreferences() {
    const saved = localStorage.getItem('lector-pantalla');
    this.isEnabled = saved === 'true';
  }

  speak(text, options = {}) {
    if (!this.isEnabled) return;

    if (this.isReading) {
      this.stop();
    }

    this.utterance = new SpeechSynthesisUtterance(text);
    this.utterance.lang = options.lang || 'es-ES';
    this.utterance.rate = options.rate || 1;
    this.utterance.pitch = options.pitch || 1;
    this.utterance.volume = options.volume || 1;

    this.utterance.onstart = () => {
      this.isReading = true;
    };

    this.utterance.onend = () => {
      this.isReading = false;
    };

    this.utterance.onerror = () => {
      this.isReading = false;
    };

    this.synth.speak(this.utterance);
  }

  stop() {
    this.synth.cancel();
    this.isReading = false;
  }

  toggle() {
    this.isEnabled = !this.isEnabled;
    if (!this.isEnabled) {
      this.stop();
    }
    localStorage.setItem('lector-pantalla', this.isEnabled.toString());
    return this.isEnabled;
  }

  getIsEnabled() {
    return this.isEnabled;
  }

  enableHoverReading() {
    const selectores = [
      'h1', 'h2', 'h3', 'h4', 'h5', 'h6',
      'p', 'a', 'button', 'label',
      '[data-speak]',
      '.barra-accesibilidad-govco button'
    ];

    selectores.forEach(selector => {
      const elementos = document.querySelectorAll(selector);

      elementos.forEach(elemento => {
        const listener = (e) => {
          const target = e.currentTarget;
          let texto = target.getAttribute('aria-label') ||
                     target.getAttribute('title') ||
                     target.innerText ||
                     target.textContent ||
                     '';

          texto = texto.trim();

          if (texto) {
            this.speak(texto);
          }
        };

        this.hoverListeners.set(elemento, listener);
        elemento.addEventListener('mouseenter', listener);
      });
    });
  }

  disableHoverReading() {
    this.hoverListeners.forEach((listener, elemento) => {
      elemento.removeEventListener('mouseenter', listener);
    });
    this.hoverListeners.clear();
  }
}

// Instancia global del lector
const screenReader = new ScreenReaderService();

// ==========================================
// DETECCIÓN DE TECLA TAB
// ==========================================

document.addEventListener("keyup", detectTabKey);

function detectTabKey(e) {
  if (e.keyCode == 9) {
    if (document.getElementById("botoncontraste").classList.contains("active-barra-accesibilidad-govco")) {
      document.getElementById("botoncontraste").classList.toggle("active-barra-accesibilidad-govco");
    }
    if (document.getElementById("botonaumentar").classList.contains("active-barra-accesibilidad-govco")) {
      document.getElementById("botonaumentar").classList.toggle("active-barra-accesibilidad-govco");
    }
    if (document.getElementById("botondisminuir").classList.contains("active-barra-accesibilidad-govco")) {
      document.getElementById("botondisminuir").classList.toggle("active-barra-accesibilidad-govco");
    }
    if (document.getElementById("botonlector")?.classList.contains("active-barra-accesibilidad-govco")) {
      document.getElementById("botonlector").classList.toggle("active-barra-accesibilidad-govco");
    }
  }
}

// ==========================================
// CAMBIAR CONTRASTE
// ==========================================

function cambiarContexto() {
  var botoncontraste = document.getElementById("botoncontraste");
  var botonaumentar = document.getElementById("botonaumentar");
  var botondisminuir = document.getElementById("botondisminuir");
  var botonlector = document.getElementById("botonlector");

  if (!botoncontraste.classList.contains("active-barra-accesibilidad-govco")) {
    botoncontraste.classList.toggle("active-barra-accesibilidad-govco");
    document.getElementById("titleaumentar").style.display = "";
    document.getElementById("titledisminuir").style.display = "";
    document.getElementById("titlecontraste").style.display = "none";
    if (botonlector) {
      document.getElementById("titlelector").style.display = "";
    }
  }

  if (botondisminuir.classList.contains("active-barra-accesibilidad-govco")) {
    botondisminuir.classList.remove("active-barra-accesibilidad-govco");
  }
  if (botonaumentar.classList.contains("active-barra-accesibilidad-govco")) {
    botonaumentar.classList.remove("active-barra-accesibilidad-govco");
  }
  if (botonlector?.classList.contains("active-barra-accesibilidad-govco")) {
    botonlector.classList.remove("active-barra-accesibilidad-govco");
  }

  var element = document.getElementById('para-mirar');
  if (element.className == 'modo_oscuro-govco') {
    element.className = "modo_claro-govco";
    screenReader.speak('Modo claro activado');
  } else {
    element.className = "modo_oscuro-govco";
    screenReader.speak('Modo oscuro activado');
  }
}

// ==========================================
// DISMINUIR TAMAÑO
// ==========================================

function disminuirTamanio(operador) {
  var botoncontraste = document.getElementById("botoncontraste");
  var botonaumentar = document.getElementById("botonaumentar");
  var botondisminuir = document.getElementById("botondisminuir");
  var botonlector = document.getElementById("botonlector");

  if (!botondisminuir.classList.contains("active-barra-accesibilidad-govco")) {
    botondisminuir.classList.toggle("active-barra-accesibilidad-govco");
    document.getElementById("titleaumentar").style.display = "";
    document.getElementById("titledisminuir").style.display = "none";
    document.getElementById("titlecontraste").style.display = "";
    if (botonlector) {
      document.getElementById("titlelector").style.display = "";
    }
  }

  if (botonaumentar.classList.contains("active-barra-accesibilidad-govco")) {
    botonaumentar.classList.remove("active-barra-accesibilidad-govco");
  }
  if (botoncontraste.classList.contains("active-barra-accesibilidad-govco")) {
    botoncontraste.classList.remove("active-barra-accesibilidad-govco");
  }
  if (botonlector?.classList.contains("active-barra-accesibilidad-govco")) {
    botonlector.classList.remove("active-barra-accesibilidad-govco");
  }

  var div1 = document.getElementById("para-mirar");
  var texto = div1.getElementsByTagName("p");
  var elementosModificados = 0;

  for (let element of texto) {
    const total = tamanioElemento(element);
    if (total > 12) { // Tamaño mínimo
      const nuevoTamanio = (operador === 'aumentar' ? (total + 1) : (total - 1)) + 'px';
      element.style.fontSize = nuevoTamanio;
      elementosModificados++;
    }
  }

  if (elementosModificados > 0) {
    screenReader.speak('Tamaño de letra reducido');
  } else {
    screenReader.speak('Tamaño mínimo alcanzado');
  }
}

// ==========================================
// AUMENTAR TAMAÑO
// ==========================================

function aumentarTamanio(operador) {
  var botoncontraste = document.getElementById("botoncontraste");
  var botonaumentar = document.getElementById("botonaumentar");
  var botondisminuir = document.getElementById("botondisminuir");
  var botonlector = document.getElementById("botonlector");

  if (!botonaumentar.classList.contains("active-barra-accesibilidad-govco")) {
    botonaumentar.classList.toggle("active-barra-accesibilidad-govco");
    document.getElementById("titleaumentar").style.display = "none";
    document.getElementById("titledisminuir").style.display = "";
    document.getElementById("titlecontraste").style.display = "";
    if (botonlector) {
      document.getElementById("titlelector").style.display = "";
    }
  }

  if (botondisminuir.classList.contains("active-barra-accesibilidad-govco")) {
    botondisminuir.classList.remove("active-barra-accesibilidad-govco");
  }
  if (botoncontraste.classList.contains("active-barra-accesibilidad-govco")) {
    botoncontraste.classList.remove("active-barra-accesibilidad-govco");
  }
  if (botonlector?.classList.contains("active-barra-accesibilidad-govco")) {
    botonlector.classList.remove("active-barra-accesibilidad-govco");
  }

  var div1 = document.getElementById("para-mirar");
  var texto = div1.getElementsByTagName("p");
  var elementosModificados = 0;

  for (let element of texto) {
    const total = tamanioElemento(element);
    if (total <= 64) {
      const nuevoTamanio = (operador === 'aumentar' ? (total + 1) : (total - 1)) + 'px';
      element.style.fontSize = nuevoTamanio;
      elementosModificados++;
    }
  }

  if (elementosModificados > 0) {
    screenReader.speak('Tamaño de letra aumentado');
  } else {
    screenReader.speak('Tamaño máximo alcanzado');
  }
}

// ==========================================
// FUNCIÓN AUXILIAR PARA TAMAÑO
// ==========================================

function tamanioElemento(element) {
  const tamanioParrafo = window.getComputedStyle(element, null).getPropertyValue('font-size');
  return parseFloat(tamanioParrafo);
}

// ==========================================
// NUEVA FUNCIÓN: LECTOR DE PANTALLA
// ==========================================

function screenLecture() {
  var botoncontraste = document.getElementById("botoncontraste");
  var botonaumentar = document.getElementById("botonaumentar");
  var botondisminuir = document.getElementById("botondisminuir");
  var botonlector = document.getElementById("botonlector");

  if (!botonlector.classList.contains("active-barra-accesibilidad-govco")) {
    botonlector.classList.toggle("active-barra-accesibilidad-govco");
    document.getElementById("titleaumentar").style.display = "";
    document.getElementById("titledisminuir").style.display = "";
    document.getElementById("titlecontraste").style.display = "";
    document.getElementById("titlelector").style.display = "none";
  }

  if (botonaumentar.classList.contains("active-barra-accesibilidad-govco")) {
    botonaumentar.classList.remove("active-barra-accesibilidad-govco");
  }
  if (botondisminuir.classList.contains("active-barra-accesibilidad-govco")) {
    botondisminuir.classList.remove("active-barra-accesibilidad-govco");
  }
  if (botoncontraste.classList.contains("active-barra-accesibilidad-govco")) {
    botoncontraste.classList.remove("active-barra-accesibilidad-govco");
  }

  const isEnabled = screenReader.toggle();

  if (isEnabled) {
    screenReader.speak('Lector de pantalla activado. Pase el cursor sobre los elementos para escucharlos.');
    screenReader.enableHoverReading();
  } else {
    screenReader.speak('Lector de pantalla desactivado');
    screenReader.disableHoverReading();
  }
}

// ==========================================
// ATAJOS DE TECLADO
// ==========================================

document.addEventListener('keydown', (e) => {
  // Alt + C = Contraste
  if (e.altKey && e.key === 'c') {
    e.preventDefault();
    cambiarContexto();
  }

  // Alt + + = Aumentar letra
  if (e.altKey && (e.key === '+' || e.key === '=')) {
    e.preventDefault();
    aumentarTamanio('aumentar');
  }

  // Alt + - = Disminuir letra
  if (e.altKey && e.key === '-') {
    e.preventDefault();
    disminuirTamanio('disminuir');
  }

  // Alt + L = Lector de pantalla
  if (e.altKey && e.key === 'l') {
    e.preventDefault();
    screenLecture();
  }

  // Alt + S = Detener lectura
  if (e.altKey && e.key === 's') {
    e.preventDefault();
    screenReader.stop();
    screenReader.speak('Lectura detenida');
  }
});

// ==========================================
// INICIALIZACIÓN AL CARGAR LA PÁGINA
// ==========================================

document.addEventListener('DOMContentLoaded', () => {
  // Si el lector estaba activo, reactivarlo
  if (screenReader.getIsEnabled()) {
    const botonlector = document.getElementById("botonlector");
    if (botonlector) {
      botonlector.classList.add("active-barra-accesibilidad-govco");
      document.getElementById("titlelector").style.display = "none";
      screenReader.enableHoverReading();
    }
  }

  console.log('Sistema de accesibilidad inicializado');
  console.log('Atajos disponibles:');
  console.log('- Alt + C: Cambiar contraste');
  console.log('- Alt + +: Aumentar letra');
  console.log('- Alt + -: Disminuir letra');
  console.log('- Alt + L: Activar/desactivar lector');
  console.log('- Alt + S: Detener lectura');
});
