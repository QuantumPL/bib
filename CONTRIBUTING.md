# How to contribute to QPLV Bib

NOTE: We are not accepting suggestions for ZX-calculus papers as [a comprehensive database]([url](https://zxcalculus.com/publications.html)) already exists.

## Easiest Method

Just use the this [web form](https://forms.gle/watgbhcDa5jkf85T7).

## Detailed Method

`bibtex` entries are in `bbt.bib` while `biblatex` ones are in `biblatex.bib`. Please send all PRs for changes to both these files.

### Style
- I prefer to edit using VSCode, keeping the bib file organized using [LaTeX Workshop's](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) "Align and sort bibliography".
- When sorting the fields of a bibentry, use the sorting order specified at the beginning of each `.bib` file. For mass sort, I have been using the `bibtex-tidy` tool at <https://flamingtempura.github.io/bibtex-tidy/>.

### Building and Testing (optional)
You **do not have to** test the website for contributing here, I have added the steps if you would like to, however. I will test the site for issues before I merge a PR.

#### Prerequisites
- For [retro](https://quantumpl.github.io/bib/retro/bbt.html) HTML generation: `bibtex2html`. Install the latest version using <https://github.com/backtracking/bibtex2html>
- For website:
  - Go and a recent version of [`hugo_extended`](https://github.com/gohugoio/hugo/releases)
  - A local installation of `academic-cli` using the [qpl-bib](https://github.com/QuantumPL/academic-cli/tree/qpl-bib) branch:
   `git clone --single-branch --branch qpl-bib https://github.com/QuantumPL/academic-cli.git`

#### Local directory structure
```
$ tree -L 1 QuantumPL/
QuantumPL/
├── academic-cli
├── bib
└── site
```

#### Instructions
- If you'd also like to test the Hugo-based site:
  1. First ensure you have `academic-cli` ready using the instructions at <https://github.com/QuantumPL/academic-cli/tree/qpl-bib#contribute>
  2. Go to `site` and issue `./build.sh`
  3. Try launching the site by issuing `hugo serve` and see if your entries look okay.
- Send a PR (be careful not to add any additional files especially `Wecker2014` that has some custom changes in the HTML).
