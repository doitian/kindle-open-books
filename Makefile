EBOOK_CONVERT := ebook-convert

RECIPES := $(wildcard calibre-recipes/*.recipe)
TITLES := $(RECIPES:calibre-recipes/%.recipe=%)
EPUBS  := $(RECIPES:calibre-recipes/%.recipe=out/%.epub)
MOBIS  := $(RECIPES:calibre-recipes/%.recipe=out/%.mobi)

EBOOK_CONVERT_ARGS := $(if ${DEBUG},--test -vv --debug-pipeline debug,-v)

info:
	@echo "RECIPES:"
	@echo "$(foreach r,$(TITLES),\t$(r)\n)"

$(EPUBS): out/%.epub: calibre-recipes/%.recipe
	$(EBOOK_CONVERT) $< $@ $(EBOOK_CONVERT_ARGS)

$(TITLES): %: out/%.epub out/%.mobi

.SUFFIXES: .epub .mobi

.epub.mobi:
	$(EBOOK_CONVERT) $< $@

clean:
	rm -rf out/*.epub out/*.mobi debug/

.PHONY: all info clean $(TITLES)
