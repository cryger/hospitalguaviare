window.addEventListener("load", function() {
    initTopBar();
});


function initTopBar() {
    const translateElement = document.querySelector(".idioma-icon-barra-superior-govco");
    // Angular puede no haber dibujado aún la barra cuando se dispara «load»
    if (!translateElement) return;
    translateElement.addEventListener("click", translate, false);

    function translate() {
        // ... // Implementar traducción
    }
}
