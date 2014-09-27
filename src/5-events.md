## Events & Streams

### Asynchrone Ereignisse

- User klickt
- Antwort von Netzwerk

### Wiederholbar

- 5 Klicks auf den selben Knopf
- Teil einer Datei gelesen (bis Ende erreicht)

### Beispiel (jQuery)

```javascript
jQuery.ready(function () {
  var state = 1;
  $('button').on('click', function (event) {
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

### Streams

- "Ereignis-Fluß"
- Daten werden in Buffer gespeichert (Push/Pull)
- Functional Reactive Programming

### Streams in Node

```javascript
var request = require("request");
var zlib = require("zlib");
var fs = require("fs");

// HTTP GET Request
request("http://nodestreams.com/input/people.json.gz")
    // Un-Gzip
    .pipe(zlib.createGunzip())
    // Write File
    .pipe(fs.createWriteStream("output/people.json"));
```

Vergleiche auch Beispiele auf [nodestreams.com](http://nodestreams.com/).



