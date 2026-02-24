En un documento [HTML](https://developer.mozilla.org/es/docs/Web/HTML), el método **`Document.createElement()`** crea un elemento HTML especificado por su `tagName`, o un [`HTMLUnknownElement` (en-US)](https://developer.mozilla.org/en-US/docs/Web/API/HTMLUnknownElement "Currently only available in English (US)") si su `tagName` no se reconoce.

```
var element = document.createElement(tagName, [options]);
```

https://developer.mozilla.org/es/docs/Web/API/Document/createElement

[[JavaScript]]
[[Programación]]


```
```function crearMensaje() {

    let alertas = document.getElementById("alertas");

  

    let parrafo = document.createElement("p");

  

    parrafo.innerHTML = "Tu Enorita atacó con " + ataqueJugador + ", la Enorita enemiga atacó con " + ataqueDePC + " --pendiente";

    alertas.appendChild(parrafo);

}
