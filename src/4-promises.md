
## Promises

---

### Definition

- Ein _Promise_ repräsentiert einen zukünftigen Wert.
- Es kann erfüllt (_fulfilled_) oder abgelehnt (_rejected_) werden.
- Es können Callbacks angehangen werden, die ausgeführt werden, sobald der Wert bekannt ist.

Genauer: Promises/A+ [@promisesaplus]

### Beispiel

Beispiel von Callback-Slides.

```javascript
var requests = readConfig()
.then(function (config) {
  return Promise.all(urls, function (url) {
    return request(config, url);
  });
})
```

---

(Fortsetzung.)

```javascript
requests.then(function (requests) {
  return userInput(requests);
})
.then(function (input) {
  return writeFile('result.txt', input);
})
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
