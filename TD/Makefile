# ========================
# Configuration
# ========================
LATEX = pdflatex -shell-escape
TD_DIRS = TD0 TD1 TD2 TD3 TD4 TD5 TD6 TD7 TD8

# ========================
# Cible par défaut
# ========================
all: $(TD_DIRS) nocopy

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
		if [ "$$d" = "TD0" ]; then \
			continue; \
		fi; \
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
		echo "==> Nettoyage $$d/build"; \
		rm -rf $$d/build; \
	done
	@echo "==> Nettoyage nocopy"
	@rm -rf nocopy

.PHONY: all clean $(TD_DIRS) nocopy
