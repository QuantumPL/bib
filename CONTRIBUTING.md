# How to contribute to QPLV Bib

## Organization
- Currently `bibtex` style bib entries are supported in `bbt.bib`. Please send all PRs for changes for this file.
- We would love to have a `biblatex` style of entries as well in the file `bblt.bib`, but for now it is not up to date. PRs welcome.

## Style
- I prefer to edit using VSCode, keeping the bib file organized using [LaTeX Workshop's](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) "Align and sort bibliography".
- When sorting the fields of a bibentry, use the following sorting order:
  > `title shorttitle author year month day journal booktitle editor location on publisher school institution address series volume number pages numpages crossref doi archiveprefix eprint howpublished url urldate abstract keywords copyright category note metadata timestamp` 

  For mass sort, I have been using the `bibtex-tidy` tool at https://flamingtempura.github.io/bibtex-tidy/ with the above sorting order.

## Building and Testing
### Prerequisites
- For [retro](https://quantumpl.github.io/bib/retro/bbt.html) HTML generation: `bibtex2html`. Install the latest version using https://github.com/backtracking/bibtex2html
- For website:
  - Go and [`hugo-extended`](https://gohugo.io/getting-started/installing/)
  - A local installation of `academic-cli` using the [qpl-bib](https://github.com/QuantumPL/academic-cli/tree/qpl-bib) branch:
   `git clone --single-branch --branch qpl-bib https://github.com/QuantumPL/academic-cli.git`

### Local directory structure
```
$ tree -L 1 QuantumPL/
QuantumPL/
├── academic-cli
├── bib
└── site
```

### Instructions
- `make` command does two things, runs `bibtex2html` and migrates the HTML generated to a local copy of the [`site` repo](https://github.com/QuantumPL/site).
- If you'd also like to test the Hugo-based site:
  1. First ensure you have `academic-cli` ready using the instructions at https://github.com/QuantumPL/academic-cli/tree/qpl-bib#contribute
  2. Go to `site` and issue `academic import --overwrite --bibtex ../bib/bbt.bib`
  3. Try launching the site by issuing `hugo serve` and see if your entries look okay.
- Send us a PR (be careful not to add any additional files especially `Wecker2014` that has some custom changes in the HTML).
