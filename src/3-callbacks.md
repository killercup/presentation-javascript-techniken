## Callbacks

### Anonyme Funktionen

<aside class="notes">
- _First-order functions_, _closures_
- Grundlegend für funktionale Programmierung

</aside>

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
- werden in bestehendem Kontext ausgeführt
- Code soll ausgeführt werden, sobald z.B.
    + User klickt
    + Datei geschrieben wurde

### Synchroner Code

```javascript
var fs = require('fs');
fs.writeFileSync('example.txt', "Lorem Ipsum");
console.log("File written");
```

<aside class="notes">
- `writeFileSync` blockiert den Prozess, bis Datei geschrieben wurde
- danach wird auf die Konsole geschrieben
</aside>

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

<aside class="notes">
- `log` ist ein Callback
- wird ausgeführt, nachdem Datei geschrieben wurde
- welche Datei zuerst geschrieben wurde, wissen wir nicht
- auch zu beachten: Fehler-Parameter
</aside>

---

Verwendet jQuery.

```javascript
var currentUser = {name: "Pascal"};
jQuery.getJSON('/me', function (result) {
  currentUser = result.data;
});
```

<aside class="notes">
- Ajax Event: "Request fertig"
- Callback wird im Fehlerfall nicht ausgeführt (Sonderfall)

</aside>

### Node.js Callback Conventionen

- Asynchrone Funktionen verlangen als letztes Argument eine Callback-Funktion
- Callbacks werden mit Fehler als erstes Argument aufgerufen

```javascript
async(param1, param2, function (err, result) {});
```

### Verschachtelte Callbacks

- Beispiel:
    + Config-Datei lesen
    + dann 3 Netzwerk-Abfragen
    + dann User-Eingabe abwarten
    + dann Ergebnis in Datei schreiben
- viele verschachtelte Funktionen, viele `if (error)`
- "Callback-Hell"

