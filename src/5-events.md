## Events

### Asynchrone Ereignisse

- User klickt
- Antwort von Netzwerk

### Wiederholbar

- 5 Klicks auf den selben Knopf
- Teil einer Datei gelesen (bis Ende erreicht)

### Beispiel (jQuery)

```javascript
var count = 1;
jQuery('button').on('click', function (event) {
  console.log('Clicked', count, 'times');
  count = count + 1;
});
```

### Beispiel (node.js)

```javascript
var fs = require('fs');
var file = fs.createReadStream('test.csv');
file.on('data', logProgress);
file.on('error', logError);
file.on('end', logSuccess);
```

<aside class="notes">
- Auch: Event bei neuer Verbindung zu Server.
- System-Events
</aside>

### Events erstellen

```javascript
jQuery('#bar').on('click', function () {
  jQuery('#foo').trigger('magic', {answer: 42});
});
jQuery('#foo').on('magic', function (event, data) {
  console.log("Answer is", data.anwer);
});
```

