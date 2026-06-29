# IHU Diploma Thesis Template (XeLaTeX)

A-ready-to-use LaTeX template for diploma theses at the **International Hellenic University (IHU)**, Department of Information and Electronic Engineering.

PDF output: **`src/main.pdf`**

## Quick Start

```sh
# Clone and enter
git clone <repo-url> && cd iee-thesis-template

# Full build (XeLaTeX → Biber → XeLaTeX ×2)
make

# View the result
make view
```

## Build Commands

| Command | Purpose |
|---------|---------|
| `make` | Full build (XeLaTeX + Biber + 2× XeLaTeX) |
| `make fast` | Single XeLaTeX pass (no bibliography update) |
| `make clean` | Remove all aux files and PDF under `src/` |
| `make view` | Open `src/main.pdf` |

From `src/` with latexmk: `latexmk -xelatex main.tex`

## Directory Structure

```
├── assets/         # Images, figures, and other resources
├── docs/           # Institutional documentation (regulations, templates)
├── fonts/          # Thesis fonts (Tinos + Helvetica)
├── plugins/        # Supporting tools (e.g., Zotero Better BibTeX)
├── scripts/        # Utility scripts (e.g., bibsync)
├── slides/         # Quarto Beamer presentation for thesis defense
└── src/            # LaTeX source files
    ├── main.tex            # Root document
    ├── preamble.tex        # Packages and configuration
    ├── commands.tex        # Custom LaTeX commands
    ├── abbreviations.tex   # List of abbreviations
    ├── bib.bib             # Bibliography database
    ├── Abstract/           # Thesis abstracts (EN/GR)
    ├── Chapters/           # Thesis chapters
    └── Appendix/           # Supplementary material
```

## Customisation

Edit the following files to adapt the template to your thesis:

| File | What to change |
|------|---------------|
| `src/main.tex` | Title, student info, supervisor, chapter list |
| `src/preamble.tex` | PDF metadata (title, author, keywords) |
| `src/Abstract/en.tex` | English abstract |
| `src/Abstract/gr.tex` | Greek abstract |
| `src/Chapters/*.tex` | Your thesis chapters |
| `src/bib.bib` | Your bibliography database |
| `assets/ihu-logo-gr.png` | Replace with your institution's logo |

## Requirements

- **XeLaTeX** (TeX Live or MikTeX with `xelatex`)
- **Biber** (for bibliography processing)
- **latexmk** (optional, for single-command builds)
- Python packages: `pygments` (for `minted` code highlighting)

## License

The template structure and example content are provided under the MIT License.
Fonts are distributed under the Apache License 2.0 (see `fonts/LICENSE.txt`).
