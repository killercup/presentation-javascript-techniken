# Präsentation: JavaScript Patterns

Für die Projektgruppe Web-Technologie.

## Techn. Konzept

1. Schreibe Folien als Markdown
2. Hinterlege Metadaten und Referenzen in YAML-Dateien
3. Verwende pandoc um Markdown/YAML umzuwandeln
    - citeproc Filter für Zitate
    - trenne Folien mit `---` oder Überschriften für reveal.js und LaTeX Beamer Präsentation
    - verwende HTML-Klassen für speaker notes
    - Erstelle LaTeX-PDF-Skript durch Entfernen von Folien-Trennern

## Dateistruktur

- In `src` liegen die Texte und Bilder
- `lib` beinhaltet reveal.js sowie einige Templates
- Die fertigen Daten werden in `dist` gespeichert

## Präsentation erzeugen

Folgendes muss installiert sein:

- pandoc
- make
- pdflatex für beamer und pdf Ausgabe

Das Makefile wird nur benutzt, um pandoc mit den korrekten Parametern aufzurufen und Dateien zu kopieren.

- `make` bzw. `make revealjs` für reveal.js
- `make pdf` für PDF-Skript, inkl. speaker notes
- `make beamer` für LaTeX Beamer Ausgabe
    - hat bei mir lokal einige Probleme, kann aber mit `LATEX_FILETYPE=tex make beamer; pdflatex dist/index.tex dist/index.pdf` auch interaktiv benutzt werden (erzeugt viele Log-Dateien)

## reveal.js speaker notes

Um die speaker notes zu benutzen, muss `dist/index.html` Ordner über HTTP aufgerufen werden (wegen Browser Security). Dann kann mit 's' die sekundäre Anzeige geöffnet werden.

