## Module

### Ziel

- Code aufeilen
- Abhängigkeiten abbilden
- Code-Teile wiederverwenden können

### CommonJS Module

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

