## Control Flow: Callbacks

### Wozu Callbacks?

- Reagieren auf (externe) Eregnisse
- Code soll ausgeführt werden, sobald
    + User klickt
    + Datei geschrieben
- Code im _aktuellen_ Kontext ausführen

### Anonyme Funktionen

```javascript
function forEach (list, fn) {
  var _len = list.length;
  for (i = 0; i < _len; i++) {
    fn(list[i]);
  }
}

var user = ['Hans', 'Paul'];
forEach(users, function (user) {
  console.log(user);
});
```

### Synchroner Code

```javascript
var fs = require('fs');
var content = "Lorem Ipsum";
fs.writeFileSync('example.txt', content);
console.log("File written");
```

---

- `writeFileSync` blockiert den Prozess, bis Datei geschrieben wurde
- danach wird auf die Konsole geschrieben

### Asynchroner Code

```javascript
var fs = require('fs');

function log (err, res) {
  if (!err) {
    console.log("File written");
  }
}

var content = "Lorem Ipsum";
fs.writeFile('example1.txt', content, log);
fs.writeFile('example2.txt', content, log);
```

---

- `log` ist ein Callback
- wird ausgeführt, nachdem Datei geschrieben wurde
- welche Datei zuerst geschrieben wurde, wissen wir nicht
- auch zu beachten: Fehler-Parameter

### Reagieren auf Events

Verwendet jQuery.

```javascript
$('button').on('click', function (event) {
  console.log('Button was clicked.');
});
```

### Verschachtelte Callbacks

- Beispiel:
    + Config-Datei lesen
    + dann 3 Netzwerk-Abfragen
    + dann User-Eingabe abwarten
    + dann Ergebnis in Datei schreiben
- führt schnell zu vielen verschachtelten Funktionen mit vielen `if (error)`-Abfragen
