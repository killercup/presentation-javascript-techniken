## Streams

### Event & Data Streams

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

