MAIN_TEX = main.tex
BUILD_DIR = build
LATEX = lualatex -shell-escape

all: clean pdf

pdf:
	mkdir -p $(BUILD_DIR)
	$(LATEX) -output-directory=$(BUILD_DIR) $(MAIN_TEX)
	$(LATEX) -output-directory=$(BUILD_DIR) $(MAIN_TEX)

clean:
	rm -rf $(BUILD_DIR)/*

.PHONY: all clean pdf
