## Module

### Ohne Module

```html
<script src="js/jquery.js"></script>
<script src="js/jquery.lightbox.js"></script>
<script src="js/effects.js"></script>
```

<aside class="notes">
- Das sind 3 HTTP-Requests
- `jquery.lightbox.js`: Anscheinend ein jQuery-Plugin
    + Welche Version von jQuery?
- `effects.js` benötigt vermutlich jQuery und das Lightbox-Plugin. Diese werden vom Browser vorher geladen, und sind _nur_ deshalb verfügbar.
</aside>

### Ziel von Modulen

- Code aufteilen
- Abhängigkeiten abbilden
- Code-Teile wiederverwenden können

### CommonJS Module [@commonjsmodules]

- von node.js verwendet
- explizite Abhängigkeiten
- Nur eins von vielen Modul-Systemen

### Modul-Aufbau

- 1 Datei = 1 Modul
- `require` lädt andere Module
- `module` repräsentiert das aktuelle Modul
- `module.exports` ist, was andere Module von `require` bekommen

### Beispiel

```javascript
// src/helper.js
var fs = require('fs');
module.exports = {
  saveTheQueen: function (name) {
    fs.writeFile(name+".txt", name+" was saved.");
  }
}


// src/main.js
var helper = require('./helper');
helper.saveTheQueen("Elizabeth");
```

### Pakete

- (wiederverwendbare) Code-Einheiten
- Beschrieben durch
    - Name
    - Einstiegspunkt
    - externe Abhängigkeiten

### NPM

- [npmjs.org](https://www.npmjs.org/), "Node Packaged Modules"
- _Registry_ mit 96.608 Paketen (26. Sep 2014)
- löst Abhängigkeiten automatisch auf
- `npm install express`

<aside class="notes">
- Pakete können zentral gespeichert werden (müssen aber nicht)
- Ein Grund, warum node.js so viel Anklang findet
</aside>

### Module im Browser

- Code kann nicht direkt eingebunden werden
- Tools, um CommonJS zu verarbeiten:
    - browserify [@browserify]
    - webpack [@webpack]
- Anderes System: AMD (_require.js_)

---

!["What is Webpack?" [@webpack]](figures/what-is-webpack)

