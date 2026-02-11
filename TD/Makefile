# ========================
# Configuration
# ========================
LATEX = pdflatex -shell-escape
TD_DIRS = TD0 TD1 TD2 TD3 TD4 TD5

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
# Nettoyage
# ========================
clean:
	@for d in $(TD_DIRS); do \
		echo "==> Nettoyage $$d/build"; \
		rm -rf $$d/build; \
	done

.PHONY: all clean $(TD_DIRS)
