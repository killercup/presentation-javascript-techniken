## Events

### Asynchrone Ereignisse

- User klickt
- Antwort von Netzwerk

### Wiederholbar

- 5 Klicks auf den selben Knopf
- Teil einer Datei gelesen (bis Ende erreicht)

### Beispiel (jQuery)

```javascript
jQuery.ready(function ($) {
  var state = 1;
  jQuery('button').on('click', function (event) {
    console.log('Clicked', state, 'times');
    state = state + 1;
  });
})
```

### Beispiel (node.js)

```javascript
var fs = require('fs');
var file = fs.createReadStream('test.csv');
file.on('data', logProgress);
file.on('error', logError);
file.on('end', logSuccess);
```

Auch: Event bei neuer Verbindung zu Server.

### Events erstellen

```javascript
jQuery.ready(function ($) {
  jQuery('#bar').on('click', function () {
    jQuery('#foo').trigger('magic', {answer: 42});
  });
  jQuery('#foo').on('magic', function (event, data) {
    console.log("Answer is", data.anwer);
  });
})
```

