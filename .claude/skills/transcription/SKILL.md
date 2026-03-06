---
name: transcription
description: Indexer des PDF sources et transcrire des modules en fichiers Typst de reference. Use when the user wants to index, transcribe, extract, or work on a module from the raw PDFs. Keywords - transcrire, transcription, indexer, index, module, extraire, raw, pdf, reference, typst.
argument-hint: "[index <pdf> | module-number | module-name]"
---

# Indexation & Transcription des sources PDF

Skill d'indexation des manuels scolaires PDF et de transcription en fichiers Typst de reference.

## Routing

Based on `$ARGUMENTS`:

- **"index" + nom de PDF** : See [actions/index-pdf.md](actions/index-pdf.md)
- **Module number or name** : See [actions/transcribe-module.md](actions/transcribe-module.md)
- **Empty / "next"** : Consulter les fiches `_raw/sources/*.yaml` et `_raw/reference/` pour identifier le prochain module a transcrire, puis router vers transcribe-module

## Architecture

```
_raw/
  sources/                   # Fiches d'indexation (1 YAML par PDF)
    manuel-3eme-t1.yaml
    corrige-3eme-t1.yaml
    parascolaire-analyse-3eme.yaml
    xyplus-3eme-t1.yaml
    ...
  *.pdf                      # 8 PDF sources
  pages/                     # PNG temporaires (gitignored)
  reference/
    {programme}/
      {module}/
        manuel.typ           # Manuel CNP + Corrige CMS (merge)
        parascolaire.typ     # Kounouz Editions (autonome)
        xyplus.typ           # CAEU Med Ali (autonome)
```
