# Basic Variables
MAIN = main
SRC_DIR = src
ASSETS_DIR = assets
BIBTEX = biber
FLAGS = -interaction=nonstopmode -shell-escape -halt-on-error

ifeq ($(shell uname -s),Darwin)
	LATEX = xelatex
	OPEN=open
	PRE_TEX = eval "$$(/usr/libexec/path_helper)" &&
else
	LATEX = latexmk -xelatex
	OPEN=xdg-open
	PRE_TEX =
endif

# Quarto (thesis slides, Beamer -> PDF)
QUARTO ?= quarto
SLIDES_QMD = slides/presentation.qmd
SLIDES_PDF = slides/presentation.pdf

.PHONY: all clean view help slides slides.preview slides.clean slides.view

all: ## Default: Builds the bibliography and the PDF
	@echo "--- Compiling: Pass 1 ---"
	cd $(SRC_DIR) && $(PRE_TEX) $(LATEX) $(FLAGS) $(MAIN).tex
	@echo "--- Generating Bibliography ---"
	cd $(SRC_DIR) && $(PRE_TEX) $(BIBTEX) $(MAIN)
	@echo "--- Compiling: Pass 2 ---"
	cd $(SRC_DIR) && $(PRE_TEX) $(LATEX) $(FLAGS) $(MAIN).tex
	@echo "--- Compiling: Pass 3 (Final Sync) ---"
	cd $(SRC_DIR) && $(PRE_TEX) $(LATEX) $(FLAGS) $(MAIN).tex
	@echo "--- Success! PDF is in $(SRC_DIR)/$(MAIN).pdf ---"

fast: ## Quick compile (no bibtex)
	cd $(SRC_DIR) && $(PRE_TEX) $(LATEX) $(FLAGS) $(MAIN).tex

clean: ## Clean up all auxiliary files
	cd $(SRC_DIR) && rm -f *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.pdf *.fdb_latexmk *.fls
	cd $(SRC_DIR)/Abstract && rm -f *.aux
	cd $(SRC_DIR)/Chapters && rm -f *.aux

view: ## View PDF
	$(OPEN) $(SRC_DIR)/$(MAIN).pdf

slides: ## Build Beamer deck to PDF (Quarto)
	$(QUARTO) render $(SLIDES_QMD)

slides.preview: ## Live preview / watch slides (Quarto; Ctrl+C to stop)
	$(QUARTO) preview $(SLIDES_QMD)

slides.clean: ## Remove Quarto/LaTeX build artifacts under slides/
	rm -rf slides/presentation_files
	cd slides && rm -f \
		presentation.pdf presentation.tex presentation.html presentation.ipynb \
		presentation.aux presentation.log presentation.nav presentation.out \
		presentation.snm presentation.toc presentation.vrb presentation.synctex.gz \
		presentation.bbl presentation.bcf presentation.blg presentation.run.xml

slides.view: ## Open rendered Beamer PDF
	$(OPEN) $(SLIDES_PDF)

help: ## Show this help message
	@echo "Available commands:"
	@grep -h -E '^[a-zA-Z0-9_.-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-25s\033[0m %s\n", $$1, $$2}'
