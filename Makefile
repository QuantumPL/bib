all: validate clean

validate: biblatex.bib
	# Validate and normalize biblatex source
	biber --tool --output-align --output-field-order=title,shorttitle,edition,author,year,month,day,date,journal,journaltitle,booktitle,editor,on,publisher,type,school,institution,address,location,series,volume,number,eid,pages,numpages,crossref,doi,archiveprefix,eprinttype,eprint,howpublished,url,urldate,abstract,keywords,copyright,category,note,metadata,timestamp,webnote,bibsource --output-safechars --fixinits --output_indent=2 --output_fieldcase=lower --configfile=biber-tool.conf --output_file=biber.bib biblatex.bib

	# I am choosing not to use the --output-resolve option as I have not yet deduplicated crossrefs in the bibfile

	# fix the broken bibtex
	python3 bibtex-compatibility.py biber

bbt:
	bibtex2html -unicode -both -s owens_web -css https://latex.now.sh/style.css -a -t "Quantum PL & Verification Bibliography" --header "<p>Welcome to Quantum PL & Verification Bibliography maintained by <a href="http://ks.cs.uchicago.edu/">Kartik Singhal</a>. Browse <a href="./bbt.html">without</a> and <a href="./bbt_abstracts.html">with abstracts</a>, <a href="./bbt_bib.html">bib entries</a>. Please <a href="https://github.com/QuantumPL/bib">file issues/send PRs</a> if you find any mistakes or missing entries. An alternate interface is available at <a href="https://quantumpl.github.io/bib">quantumpl.github.io</a>.</p>" --footer "<a href="./bbt.html">Go home</a>." bbt.bib
	mv bbt*.html ../site/static/retro

clean:
	rm *.blg
	rm biber*.bib
