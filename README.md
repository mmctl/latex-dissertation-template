# LaTeX Dissertation Template

This repository provides a ready-to-use LaTeX template and skeleton structure
for writing a PhD dissertation. While parts of the setup, in particular some of
the included packages, are geared toward computer science and cryptography, the
template is not limited to those areas and should readily be usable for (or
adaptable to) other disciplines as well.

It is built around [KOMA-Script’s](https://ctan.org/pkg/koma-script) `scrbook`
class and aims to offer a typographically aware starting point. The goal is not
to impose a single "correct" style, but to give you a solid foundation that
already tries to make a number of formatting decisions with care.[^1]

[^1]: I am by no means an expert in typography or related fields. The choices in
    this template reflect a good-faith attempt to make reasonable typesetting
    and formatting decisions, based primarily on the KOMA-Script manual (and
    some forums/blogs).

## Getting started

This template assumes a reasonably recent TeX distribution, in particular TeX
Live. It uses the LuaLaTeX engine together with `biber` for bibliography
processing and `latexmk` for building; recent TeX Live versions include all of
these out of the box. In practice, the template has been developed and tested
only with TeX Live 2025 and 2026. Although it can also be used with Overleaf,
the instructions below focus first on a local TeX Live installation, since that
is the primary setup assumed by this repository.

### Local setup (recommended)

1. Ensure that you have a reasonably recent TeX Live distribution installed; see
   [the TeX Live website](https://tug.org/texlive/).

2. [Create your own repository from this template repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template#creating-a-repository-from-a-template).  
   If you do not want to use GitHub yourself, you can skip this step.

3. [Clone or download your newly created repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository).  
   If you do not want to use GitHub yourself, you can also clone or download
   this repository directly, i.e., without first creating your own repository
   from the template.

4. As a quick first check, you can try compiling the project from the repository
   root by running `latexmk` in a terminal. If everything is set up correctly,
   this should produce the dissertation PDF. If you prefer, you can skip this
   step and continue with your editor setup.

5. Open the project in your TeX editor of choice.  
   If you do not yet have a preferred editor, you may first want to choose and
   set up [one](https://en.wikipedia.org/wiki/Comparison_of_TeX_editors).

6. Configure your (editor’s) build setup to use LuaLaTeX (and/or `latexmk`).  
   The simplest option is usually to perform a full build with `latexmk`, which
   typically just requires setting your (editor’s) build command to `latexmk`.
   However, a full `latexmk` build may invoke multiple runs of LuaLaTeX and
   Biber in order to regenerate citations, references, and other auxiliary data,
   so it can take noticeable time for larger documents. In practice, many edits
   require only a single LuaLaTeX run to preview the result. It is therefore
   often useful to configure your setup so that you can do both: run a full
   `latexmk` build when needed, and run a single `lualatex` pass for quicker
   iteration during writing. Depending on your editor, this is typically done by
   setting up `lualatex` as an additional build command or binding it to a
   shortcut. It may also be useful to pass options such as
   `--interaction=nonstopmode`, `--halt-on-error`, and `--file-line-error` to
   this command. If you use features such as TikZ externalization, you may
   additionally need `--shell-escape`.

7. Compile `main.tex`.  
   If everything is set up correctly, this should produce the dissertation PDF.

5. Optionally, if your editor supports it, set `main.tex` as the main project file.  
   In other words, make it the default file your editor compiles.

### Overleaf setup

WIP

### Personalizing

Once your editor and build setup are working and the project compiles
successfully, the first thing you will likely want to do is personalize the
template by replacing the placeholders with your own information.

All placeholders are written in angled brackets, that is, in the form `<X>`,
where `X` indicates the information to be filled in.

At the moment, placeholders occur in the following files:

- `preamble/preamble.tex`
- `frontmatter/frontmatter.tex`
- `frontmatter/tuetitlepage.tex`  
  If you are not at TU/e, you will likely want to replace this file with a title
  page that follows your own university’s requirements rather than fill in the
  placeholders in the existing TU/e-specific version.

Naturally, you may not be able to fill in every placeholder immediately, so it
is perfectly normal to leave some of them for later.

### Familiarizing

After personalizing the template, it might be worth taking a little time to
familiarize yourself with its overall structure and features, so that you know
where to look, what is already provided, and what to expect while writing.

For information about the skeleton’s layout, see [Skeleton
structure](#skeleton-structure); for an overview of the available features, see
[Features](#features). In addition, the repository includes a dummy chapter
(`mainmatter/dummy.tex`) showcasing and explaining some of the most common
features. Finally, many of the files contain comments with further explanation.

### Customizing

WIP

## Skeleton structure

```text
.
├── main.tex
├── bibliography.bib
├── .gitignore
├── .latexmkrc
├── preamble
│   ├── preamble.tex
│   ├── packagesetup.tex
│   ├── macrosetup.tex
│   ├── tikzsetup.tex
│   └── listingssetup.tex
├── frontmatter
│   ├── frontmatter.tex
│   ├── tuetitlepage.tex
│   ├── acknowledgments.tex
│   └── abstract.tex
├── mainmatter
│   └── ...
├── backmatter
│   └── backmatter.tex
├── figures
│   ├── ...
│   └── tikz
└── .github
    └── workflows
        └── build_and_release.yml
```

At a high level, the purpose of each included directory and file is as follows:

- `main.tex`  
    Main entry point of the dissertation. This is the file you compile, and the
    main file to inspect when first exploring the project.
- `bibliography.bib`  
  Main bibliography file. Add your BibLaTeX entries here.
- `.gitignore`  
  Preset gitignore file that also includes non-standard auxiliary files
  originating from custom setup
- `.latexmkrc`  
  Build configuration for `latexmk`. Lets you compile the project with `latexmk`
  and clean auxiliary files with `latexmk -C`.
- `preamble/`  
  This directory contains the global document setup.
    - `preamble.tex`  
      Main preamble file, loaded by `main.tex`.
    - `packagesetup.tex`  
      Loads and configures LaTeX packages.
    - `macrosetup.tex`  
      Defines custom macros, notation, and theorem-like environments.
    - `tikzsetup.tex`  
      Place for TikZ libraries, styles, and related setup.
    - `listingssetup.tex`  
      Place for source-code listing styles and related configuration.
- `frontmatter/`  
  This directory contains the material before the main chapters.
    - `frontmatter.tex`  
      Main frontmatter file. Controls the order of the title pages,
      acknowledgments, abstract, table of contents, and lists of
      figures/tables/algorithms/listings.
    - `tuetitlepage.tex`  
      TU/e-specific title page. Replace or adapt this to match your university's
      specific requirements.
    - `acknowledgments.tex`  
      Acknowledgments chapter.
    - `abstract.tex`  
      Abstract chapter.
- `mainmatter/`  
  This directory is for the dissertation chapters. Put your main chapter files
  here, typically one file per chapter. A dummy chapter file (`dummy.tex`) is
  provided, demonstrating some of the basic elements and features you can use
  for typesetting your dissertation.
- `backmatter/`  
  This directory contains the material after the main chapters.
    - `backmatter.tex`  
      Main backmatter file. In the current setup, this handles the bibliography
      and appendix transition.
- `figures/`  
  This directory is for figures and graphics. Store image files and other
  graphical assets here.
    - `tikz/`  
      Cache directory for externalized TikZ figures, if you decide to enable
      that.
- `.github/workflows/`  
  This directory contains the GitHub Actions workflow.
    - `.github/workflows/build_and_release.yml`  
      Builds the dissertation PDF on each push, creates a GitHub release with
      the PDF on tags or manual dispatch.

## Features

- Document layout
  - Dissertation-oriented layout based on KOMA-Script’s `scrbook` class.
  - B5, two-sided setup, with a built-in guess for binding correction.[^2]
  - Configured headings, chapter openings, running heads, captions, margin
    equation tags, and microtypography.
- Fonts, language, and quotations
  - LuaLaTeX-based font setup using Libertinus.
  - STIX Two calligraphic, script, and fraktur math alphabets.
  - Multilingual support via `polyglossia` and quotations via `csquotes`.
- Floating environments and graphics
  - Consistent setup for figures, tables, algorithms, and listings.
  - Matching captions, float behavior, and content lists.
  - Support for regular graphics, TikZ, `forest`, and optional TikZ
    externalization.
- Mathematics and formal statements
  - Mathematical setup based on `mathtools`, including margin equation
    numbering.
  - Theorem-like environments for theorems, lemmas, propositions, corollaries,
    axioms, definitions, remarks, and claims.
- Pseudocode, code, and technical writing support
  - Pseudocode support via `algpseudocodex` and a custom `algorithmicframed`
    environment.
  - `cryptocode` styling adjusted to better match the main pseudocode setup.
  - Default `listings` configuration for source-code listings.
- Referencing, bibliography, and metadata
  - Hyperlinks and automatic cross-referencing via `hyperref` and `cleveref`.
  - Bibliography support via `biblatex` and `biber`.
  - PDF metadata configured through `\hypersetup`.
- Drafting, notes, and helper macros
  - Todo notes, a corresponding todo list, layout visualization, and dummy text.
  - Margin notes.
  - Small helper macros for, e.g., simultaneous text sub- and superscripts and
    context-aware outlined text/math boxes.
- Colors
  - Default color setup via `colorblind`.
  - Colorblind-friendly remappings of built-in color names.
- Project structure and build tooling
  - Modular project structure with separate files for package setup, macros,
    TikZ setup, listings setup, front matter, and back matter.
  - Local build workflow centered around LuaLaTeX, `latexmk`, and `biber`.
  - GitHub Actions workflow for automatic PDF builds and optional tagged/manual
  releases.


[^2]: Binding correction depends on several factors, including the paper type,
    the number of pages, and the binding method. This template uses a default
    value of 5\,mm, which is only a rough estimate based on personal
    communication with dissertation printers in the Netherlands. You may want to
    verify this value for your specific case; see the KOMA-Script manual for
    more information on binding correction.

## Acknowledgments

WIP
