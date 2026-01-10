# Variables
MAIN_TEX = main.tex
BUILD_DIR = build
PDF_OUTPUT = $(BUILD_DIR)/cours_langages_script.pdf

# Cible par défaut
all: clean pdf

# Générer le PDF
pdf:
	mkdir -p $(BUILD_DIR)
	pdflatex -shell-escape -output-directory=$(BUILD_DIR) $(MAIN_TEX)
	@echo "Compilation terminée. Résultat : $(PDF_OUTPUT)"

# Nettoyer les fichiers temporaires
clean:
	rm -rf $(BUILD_DIR)/*

# Visualiser le PDF (nécessite un visualiseur comme evince, okular, etc.)
view: pdf
	okular $(PDF_OUTPUT) &

# Recompiler et visualiser
rebuild: clean pdf view

.PHONY: all clean pdf view rebuild

