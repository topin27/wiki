.PHONY: all clean

DST_DIR ?= ./
ORG_SOURCES := $(shell find . -name "*.org")
ORG_HTML := $(addprefix $(DST_DIR), $(ORG_SOURCES:.org=.html))

all: $(ORG_HTML)

$(info $(DST_DIR))

$(ORG_HTML): $(DST_DIR)%.html: %.org
	@mkdir -p `dirname $@`
	pandoc -f org -t html --mathjax --toc -N -s $< -o $@

clean:
	@find $(DST_DIR) -name "*.html" | xargs rm -rf
