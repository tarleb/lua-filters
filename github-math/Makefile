DIFF ?= diff --strip-trailing-cr -u

test: sample.md github-math.lua
	@pandoc --lua-filter=github-math.lua --to=native $< \
	    | $(DIFF) expected.native -

expected.native: sample.md github-math.lua
	@pandoc --lua-filter=github-math.lua --to=native --output $@ $<

sample.html: sample.md github-math.lua
	@pandoc --lua-filter=github-math.lua --standalone --output $@ $<

.PHONY: test clean

clean:
	rm sample.html
