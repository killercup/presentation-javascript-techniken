## Code Strukur: Module

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
```

```javascript
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
- 96.608 Pakete (26. Sep 2014)
- `npm install express`

### Module im Browser

- Module müssen zusammengefasst/umformuliert werden
- Tools:
    - browserify [@browserify]
    - webpack [@webpack]
