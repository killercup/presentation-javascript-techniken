## Callbacks

### Anonyme Funktionen

```javascript
function forEach (list, fn) {
  for (i = 0; i < list.length; i++) {
    fn(list[i]);
  }
}

var user = ['Hans', 'Paul'];

forEach(users, function (user) {
  console.log(user);
});
```

### Was sind Callbacks?

- Beim Aufruf einer Funktion wird eine "Rückgabe-Funktion" mitgegeben
- Reagieren auf (externe) Ereignisse
- wird im bestehende Kontext ausgeführen
- Code soll ausgeführt werden, sobald z.B.
    + User klickt
    + Datei geschrieben wurde

### Synchroner Code

```javascript
var fs = require('fs');
fs.writeFileSync('example.txt', "Lorem Ipsum");
console.log("File written");
```


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

fs.writeFile('example1.txt', "One", log);
fs.writeFile('example2.txt', "Two", log);
```

---

- `log` ist ein Callback
- wird ausgeführt, nachdem Datei geschrieben wurde
- welche Datei zuerst geschrieben wurde, wissen wir nicht
- auch zu beachten: Fehler-Parameter

### Reagieren auf Events

Verwendet jQuery.

```javascript
jQuery.ready(function () {
  var state = 1;
  $('button').on('click', function (event) {
    console.log('Clicked', state, 'times');
    state = state + 1;
  });
})
```

### Verschachtelte Callbacks

- Beispiel:
    + Config-Datei lesen
    + dann 3 Netzwerk-Abfragen
    + dann User-Eingabe abwarten
    + dann Ergebnis in Datei schreiben
- viele verschachtelte Funktionen, viele `if (error)`
- "Callback-Hell"

