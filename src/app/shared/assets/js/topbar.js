window.addEventListener("load", function() {
    initTopBar();
});


function initTopBar() {
    const translateElement = document.querySelector(".idioma-icon-barra-superior-govco");
    translateElement.addEventListener("click", translate, false);
    console.log('Esta importando bien la libreria');

    function translate() {
        // ... // Implementar traducción
    }
}
