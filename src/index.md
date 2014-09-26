## JavaScript — Was bisher geschah

---

- Seit 1995: Skriptsprache für dynamisches HTML
- Seit etwa 2008: Eine der schnellsten Scriptsprachen [@v8]
- Node.js: System-Schnittstellen, JavaScript Event Loop, ideal für Web-Server [@nodejs]
- Größere Applikation in JavaScript benötigen Struktur

## Code Strukur: Module

---

- Ziel: Teilsysteme und deren Abhängigkeiten abbilden

---

### CommonJS Module

```javascript
// email.js
var sendmail = require('system-sendmail');
module.exports = {
    send: function (opts) {
        sendmail('admin@system.local', opts.to, opts.subject, opts.body);
    }
}
```

```javascript
// main.js
var Mail = require('./email');
Mail.send({to: 'pascal@hertleif.de', subject: 'Hi', body: 'Lorem Ipsum'});
```

## Quellen {.allowframebreaks}

---