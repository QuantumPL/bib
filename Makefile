all: validate clean

validate: biblatex.bib
	# Validate and normalize biblatex source
	biber --tool --output-safechars --fixinits --isbn-normalise --output_indent=2 --output_fieldcase=lower --output_encoding=ascii --configfile=biber-tool.conf --output_file=biber.bib biblatex.bib

	# Export a version that is almost compatible with bibtex
	biber --tool --output-safechars --fixinits --isbn-normalise --output_indent=2 --output_fieldcase=lower --output_encoding=ascii --output-resolve --configfile=biber-tool.conf --output_file=biber-expanded.bib biber.bib

	# fix the broken bibtex
	python3.9 bibtex-compatibility.py biber

bbt:
	bibtex2html -unicode -both -s owens_web -css https://latex.now.sh/style.css -a -t "Quantum PL & Verification Bibliography" --header "<p>Welcome to Quantum PL & Verification Bibliography maintained by <a href="http://ks.cs.uchicago.edu/">Kartik Singhal</a>. Browse <a href="./bbt.html">without</a> and <a href="./bbt_abstracts.html">with abstracts</a>, <a href="./bbt_bib.html">bib entries</a>. Please <a href="https://github.com/QuantumPL/bib">file issues/send PRs</a> if you find any mistakes or missing entries. An alternate interface is available at <a href="https://quantumpl.github.io/bib">quantumpl.github.io</a>.</p>" --footer "<a href="./bbt.html">Go home</a>." bbt.bib
	mv bbt*.html ../site/static/retro

clean:
	rm *.blg
	rm biber*.bib
	rm -rf auto
