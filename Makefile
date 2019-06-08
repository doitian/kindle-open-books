EBOOK_CONVERT := ebook-convert

RECIPES := $(ildcard calibre-recipes/*.recipe)
EPUBS := $(RECIPES:calibre-recipes/%.recipe=out/%.epub)
MOBIS := $(RECIPES:calibre-recipes/%.recipe=out/%.mobi)

all: info $(EPUBS) $(MOBIS)

test:
	$(EBOOK_CONVERT) $(RECIPE) $(patsubst calibre-recipes/%.recipe,out/%.epub,$(RECIPE)) --test -vv --debug-pipeline debug

info:
	@echo "RECIPES:"
	@echo "$(foreach r,$(patsubst calibre-recipes/%.recipe,%,$(RECIPES)),\t$(r)\n)"

$(EPUBS): out/%.epub: calibre-recipes/%.recipe
	$(EBOOK_CONVERT) $< $@ -v

.SUFFIXES: .epub .mobi

.epub.mobi:
	$(EBOOK_CONVERT) $< $@

.PHONY: all info
