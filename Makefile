.PHONY: all clean

DST_DIR ?= ./
ORG_SOURCES := $(shell find . -name "*.org")
MD_SOURCES := $(shell find . -name "*.md")
ORG_HTML := $(addprefix $(DST_DIR), $(ORG_SOURCES:.org=.html))
MD_HTML := $(addprefix $(DST_DIR), $(MD_SOURCES:.md=.html))

all: $(ORG_HTML) $(MD_HTML)

$(info $(DST_DIR))

# $(ORG_HTML): $(DST_DIR)/%.html: %.org    # Grave here (the slash)!!!
$(ORG_HTML): $(DST_DIR)%.html: %.org
	@mkdir -p `dirname $@`
	pandoc -f org -t html --mathjax --toc -N -s $< -o $@

$(MD_HTML): $(DST_DIR)%.html: %.md
	@mkdir -p `dirname $@`
	pandoc -f markdown -t html --mathjax --toc -N -s $< -o $@

clean:
	@find $(DST_DIR) -name "*.html" | xargs rm -rf
