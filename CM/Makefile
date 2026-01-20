CM_TEX = cm.tex
TD_TEX = td.tex
LATEX = lualatex -shell-escape

all: clean CM TD

CM:
	@echo "==> Compilation $@"
	mkdir -p build
	$(LATEX) -output-directory=build $(CM_TEX)
	$(LATEX) -output-directory=build $(CM_TEX)

TD:
	@echo "==> Compilation $@"
	mkdir -p build
	$(LATEX) -output-directory=build $(TD_TEX)
	$(LATEX) -output-directory=build $(TD_TEX)

clean:
	@echo "==> Nettoyage build"
	@rm -rf build/*

.PHONY: all clean CM TD

