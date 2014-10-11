PANDOC ?= $(shell which pandoc)
INPUT_FOLDER ?= $(shell pwd)/src
OUTPUT_FOLDER ?= $(shell pwd)/dist
LIB_FOLDER ?= $(shell pwd)/lib
IMAGES_FOLDER ?= $(INPUT_FOLDER)/figures

REVEAL_TEMPLATE ?= $(LIB_FOLDER)/template.html
MARKDOWN_OPTIONS ?= markdown
FILTER_OPTIONS ?= --filter pandoc-citeproc

LATEX_TEMPLATE ?= $(LIB_FOLDER)/template.tex
LATEX_FILETYPE ?= pdf

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
	cp -R $(IMAGES_FOLDER) $(OUTPUT_FOLDER); \
	cd $(INPUT_FOLDER); \
	$(PANDOC) $(INPUT_FOLDER)/*.yml $(INPUT_FOLDER)/*.md \
	--from=$(MARKDOWN_OPTIONS) \
	--table-of-contents --toc-depth=2 \
	--smart --html-q-tags \
	-V revealjs-url=lib -V transition=linear -V theme=solarized \
	$(FILTER_OPTIONS) \
	--template=$(REVEAL_TEMPLATE) \
	--default-image-extension=svg \
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
	cd $(INPUT_FOLDER); \
	cat $(INPUT_FOLDER)/*.md | sed '/^---$$/d' > $(OUTPUT_FOLDER)/tmp_index.md; \
	$(PANDOC) $(INPUT_FOLDER)/*.yml $(OUTPUT_FOLDER)/tmp_index.md \
	--from=$(MARKDOWN_OPTIONS) \
	--table-of-contents \
	$(FILTER_OPTIONS) \
	--default-image-extension=pdf \
	--standalone \
	--to=latex --output=$(OUTPUT_FOLDER)/script.$(LATEX_FILETYPE); \
	rm $(OUTPUT_FOLDER)/tmp_index.md;

beamer:
	cp -R $(IMAGES_FOLDER) $(OUTPUT_FOLDER); \
	cd $(INPUT_FOLDER); \
	$(PANDOC) $(INPUT_FOLDER)/*.yml $(INPUT_FOLDER)/*.md \
	--from=$(MARKDOWN_OPTIONS) \
	--base-header-level=2 \
	--table-of-contents \
	$(FILTER_OPTIONS) \
	--default-image-extension=pdf \
	--standalone \
	--template=$(LATEX_TEMPLATE) \
	--to=beamer --output=$(OUTPUT_FOLDER)/index.$(LATEX_FILETYPE);

clean:
	rm -rf $(OUTPUT_FOLDER)/*