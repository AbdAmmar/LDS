# ========================
# Configuration
# ========================
LATEX = pdflatex -shell-escape
TD_DIRS = TD0 TD1 TD2 TD3

# ========================
# Cible par défaut
# ========================
all: $(TD_DIRS)

# ========================
# Règle générique pour chaque TD
# ========================
$(TD_DIRS):
	@echo "==> Compilation $@"
	@mkdir -p $@/build
	@cd $@ && $(LATEX) -output-directory=build $$(basename $@ | tr 'A-Z' 'a-z').tex
	@cd $@ && $(LATEX) -output-directory=build $$(basename $@ | tr 'A-Z' 'a-z').tex

# ========================
# PDF sans copier/coller
# ========================
nocopy:
	@mkdir -p nocopy
	@for d in $(TD_DIRS); do \
		echo "==> Rasterisation $$d"; \
		pdftoppm -png -r 300 $$d/build/$$(basename $$d | tr 'A-Z' 'a-z').pdf $$d/build/page; \
		img2pdf $$d/build/page-*.png -o $$d/build/$$(basename $$d | tr 'A-Z' 'a-z')_nocopy.pdf; \
		rm $$d/build/page-*.png; \
		mv $$d/build/$$(basename $$d | tr 'A-Z' 'a-z')_nocopy.pdf nocopy/$$(basename $$d | tr 'A-Z' 'a-z').pdf; \
	done

# ========================
# Nettoyage
# ========================
clean:
	@for d in $(TD_DIRS); do \
		rm -rf $$d/build nocopy; \
	done

.PHONY: all clean $(TD_DIRS)
