DIFF ?= diff --strip-trailing-cr -u
PANDOC ?= pandoc

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

.build/index.html: README.md sample.md pagebreak.lua
	@mkdir -p .build
	@pandoc --standalone \
	    --lua-filter=../.utils/create-docs.lua \
	    --metadata=sample_files:sample.md \
	    --metadata=code_file:pagebreak.lua \
	    --metadata=pagetitle:pagebreak \
	    --css="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/light.css" \
	    --self-contained \
	    --toc \
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
