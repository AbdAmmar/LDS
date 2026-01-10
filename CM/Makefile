MAIN_TEX = main.tex
BUILD_DIR = build

all: clean pdf

pdf:
	mkdir -p $(BUILD_DIR)
	pdflatex -shell-escape -output-directory=$(BUILD_DIR) $(MAIN_TEX)

clean:
	rm -rf $(BUILD_DIR)/*

.PHONY: all clean pdf
