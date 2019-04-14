DIFF ?= diff --strip-trailing-cr -u

test:
	@pandoc --lua-filter=pagebreak.lua sample.md | $(DIFF) expected.html -

.PHONY: test

page: .build/index.html .build/sample.pdf .build/sample.docx

.PHONY: page

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
