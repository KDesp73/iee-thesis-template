# Thesis Presentation Slides

Quarto **Beamer** (PDF) deck for the diploma thesis presentation.

## Render

From the repository root:

```sh
quarto render slides/presentation.qmd
```

Or: `make slides` from the repository root.

To preview while editing:

```sh
quarto preview slides/presentation.qmd
```

The deck uses the thesis bibliography at `../src/bib.bib`, the Beamer `gotham` theme with the local color theme `beamercolorthemechess.sty`.

## Suggested Editing Flow

1. Keep each slide focused on one claim.
2. Move extra explanation into `::: notes` blocks.
3. Replace text-heavy result slides with figures once the final figures are chosen.
4. Rehearse once with speaker notes and trim slides that take too long.
