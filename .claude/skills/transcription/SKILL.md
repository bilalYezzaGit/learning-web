---
name: transcription
description: Transcrire les PDF sources (Manuel, Corrige, Parascolaire, XY Plus) en fichiers Typst de reference. Use when the user wants to transcribe, extract, or work on a module from the raw PDFs. Keywords - transcrire, transcription, module, extraire, raw, pdf, reference, typst.
argument-hint: "[module-number or module-name]"
---

# Transcription des sources PDF

Skill de transcription des manuels scolaires PDF en fichiers Typst de reference.

## Routing

Based on `$ARGUMENTS`:

- **Module number or name** : See [actions/transcribe-module.md](actions/transcribe-module.md)
- **Empty / "next"** : Consulter `_raw/CARTOGRAPHIE.md` pour identifier le prochain module a transcrire, puis router vers transcribe-module

## Architecture

```
_raw/
  CARTOGRAPHIE.md          # Source de verite (23 modules, plages de pages)
  *.pdf                    # 8 PDF sources
  pages/                   # PNG temporaires (gitignored)
  reference/
    01-generalites-fonctions/
      manuel.typ            # Manuel CNP + Corrige CMS (merge)
      parascolaire.typ      # Kounouz Editions (autonome)
      xyplus.typ            # CAEU Med Ali (autonome)
    02-continuite/
      ...
```
