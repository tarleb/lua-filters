DIFF ?= diff --strip-trailing-cr -u
PANDOC ?= pandoc
CREATE_DOCS_LUA ?= ../.tools/create-docs.lua

test: test-asciidoc test-html test-md

test-asciidoc:
	@$(PANDOC) --lua-filter=pagebreak.lua sample.md --to asciidoc | $(DIFF) expected.adoc -

test-html:
	@$(PANDOC) --lua-filter=pagebreak.lua sample.md | $(DIFF) expected.html -

test-md:
	@$(PANDOC) -t ms --lua-filter=pagebreak.lua sample.md | $(DIFF) expected.ms -

.PHONY: test test-asciidoc test-html test-md

.PHONY: page
page: .build/index.html .build/sample.pdf .build/sample.docx

.build/index.html: README.md sample.md pagebreak.lua $(CREATE_DOCS_LUA)
	@mkdir -p .build
	@FILTER_FILE=pagebreak.lua \
	 SAMPLE_FILE=sample.md \
	 pandoc --standalone \
	    --lua-filter=$(CREATE_DOCS_LUA) \
	    --variable=pagetitle:pagebreak.lua \
	    --css="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/light.min.css" \
	    --output=$@ $<

.build/sample.pdf: sample.md pagebreak.lua
	@mkdir -p .build
	@pandoc --lua-filter=pagebreak.lua --output=$@ $<

.build/sample.docx: sample.md pagebreak.lua
	@mkdir -p .build
	@pandoc --lua-filter=pagebreak.lua --output=$@ $<

.PHONY: clean
clean:
	rm -rf .build
