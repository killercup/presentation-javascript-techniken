PANDOC ?= $(shell which pandoc)
INPUT_FOLDER ?= $(shell pwd)/src
OUTPUT_FOLDER ?= $(shell pwd)/dist
LIB_FOLDER ?= $(shell pwd)/lib

REVEAL_TEMPLATE ?= $(LIB_FOLDER)/template.html
MARKDOWN_OPTIONS ?= markdown
FILTER_OPTIONS ?= --filter pandoc-citeproc

all: clean revealjs

###
# ## Generate reveal.js Slideshow
# 
# Uses a custom template that includes code highlighting for solarized.
# This expects section headings to be h2. Text right after a section
# heading will not be displayed, use a separate slide for that (using `---`).
###
revealjs:
	cp -R $(LIB_FOLDER) $(OUTPUT_FOLDER); \
	$(PANDOC) $(INPUT_FOLDER)/*.yml $(INPUT_FOLDER)/*.md \
	--from=$(MARKDOWN_OPTIONS) \
	--table-of-contents --toc-depth=2 \
	-V revealjs-url=lib -V transition=linear -V theme=solarized \
	$(FILTER_OPTIONS) \
	--template=$(REVEAL_TEMPLATE) \
	--slide-level=3 \
	--standalone \
	--to=revealjs --output=$(OUTPUT_FOLDER)/index.html

###
# ## Generate PDF
# 
# This removes slide delimeters first. So make sure to use `---` to separate
# slides only.
###
pdf:
	cp -R $(LIB_FOLDER) $(OUTPUT_FOLDER); \
	cat $(INPUT_FOLDER)/*.md | sed '/^---$$/d' > $(OUTPUT_FOLDER)/tmp_index.md; \
	$(PANDOC) $(INPUT_FOLDER)/*.yml $(OUTPUT_FOLDER)/tmp_index.md \
	--from=$(MARKDOWN_OPTIONS) \
	--table-of-contents \
	$(FILTER_OPTIONS) \
	--standalone \
	--to=latex --output=$(OUTPUT_FOLDER)/script.pdf; \
	rm $(OUTPUT_FOLDER)/tmp_index.md;

# pdflatex throws `Undefined control sequence.` on my machine.
beamer:
	cp -R $(LIB_FOLDER) $(OUTPUT_FOLDER); \
	$(PANDOC) $(INPUT_FOLDER)/*.yml $(INPUT_FOLDER)/*.md \
	--from=$(MARKDOWN_OPTIONS) \
	--table-of-contents \
	$(FILTER_OPTIONS) \
	--standalone \
	--to=beamer --output=$(OUTPUT_FOLDER)/index.pdf

clean:
	rm -rf $(OUTPUT_FOLDER)/*