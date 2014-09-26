
## Module

### Ziel

- Code aufeilen
- Abhängigkeiten abbilden
- Code-Teile wiederverwenden können

### CommonJS Module

- werden von node.js verwendet
- 1 Datei = 1 Modul
- Globale Variablen: `require` und `module`
- explizite Abhängigkeiten

### Beispiel

```javascript
// helper.js
var fs = require('fs');
module.exports = {
  demo: function () {
    return "Lorem ispum";
  }
}


// main.js
var helper = require('./helper');
helper.demo();
```

### Pakete

- (wiederverwendbare) Code-Einheiten
- Beschrieben durch
    - Name
    - Einstiegspunkt
    - externe Abhängigkeiten

### NPM

- "Node Packaged Modules"
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

