EBOOK_CONVERT := ebook-convert
BLACK_LIST := AOSABook.recipe A_Mathematical_Theory_of_Communication.recipe AngularJS_Tutorial_Cn.recipe Computer_Science_from_the_Bottom_Up.recipe Designing_Evolvable_Web_APIs_with_ASP_NET.recipe Forecasting_Principles_and_Practice.recipe Git_Pocket_Guide.recipe High_Performance_Browser_Networking.recipe Mastering_Perl.recipe Programming_JavaScript_Applications.recipe Test_Driven_Web_Development_with_Python.recipe

RECIPES := $(filter-out $(foreach basename,$(BLACK_LIST),calibre-recipes/$(basename)), $(wildcard calibre-recipes/*.recipe))
EPUBS := $(RECIPES:calibre-recipes/%.recipe=out/%.epub)
MOBIS := $(RECIPES:calibre-recipes/%.recipe=out/%.mobi)

all: info $(EPUBS) $(MOBIS)

test:
	$(EBOOK_CONVERT) $(RECIPE) $(patsubst calibre-recipes/%.recipe,out/%.epub,$(RECIPE)) --test -vv --debug-pipeline debug

info:
	@echo "RECIPES:"
	@echo "$(foreach r,$(patsubst calibre-recipes/%.recipe,%,$(RECIPES)),\t$(r)\n)"

$(EPUBS): out/%.epub: calibre-recipes/%.recipe
	$(EBOOK_CONVERT) $< $@

.SUFFIXES: .epub .mobi

.epub.mobi:
	$(EBOOK_CONVERT) $< $@

.PHONY: all info

