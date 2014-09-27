## Promises

---

### Definition

- Ein _Promise_ repräsentiert einen zukünftigen Wert.
- Es kann erfüllt (_fulfilled_) oder abgelehnt (_rejected_) werden.
- Es können Callbacks angehangen werden, die ausgeführt werden, sobald der Wert bekannt ist.

Genauer: Promises/A+ [@promisesaplus]

### Beispiel (ajax)

```javascript
jQuery.ready(function () {
  var currentUser = {name: "Pascal"};

  jQuery.getJSON('/me')
  .then(function (result) {
    currentUser = result.data;
  })
  .fail(function (err) { console.error(err); });
});
```

### Beispiel (node)

```javascript
requests = readConfig()
.then(function (config) {
  return Promise.all(urls, function (url) {
    return request(config, url);
  });
})
.then(userInput)
.then(writeFile('result.txt'))
.catch(function (error) {
  console.error(error);
})
```

---

### Promise erstellen

```javascript
var Promise = require('bluebird');
var maybe = new Promise(function (resolve, reject) {
  var x = Math.random();
  setTimeout(function () {
    if (x > 0.5) {
      resolve("yay");
    } else {
      reject("nope");
    }
  }, 1000);
});
```

