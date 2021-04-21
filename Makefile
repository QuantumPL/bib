all: qpv
	bibtex2html -both -s owens_web -css https://latex.now.sh/style.css -d -t "Quantum PL & Verification Bibliography" --header "<p>Welcome to Quantum PL & Verification Bibliography maintained by <a href="http://ks.cs.uchicago.edu/">Kartik Singhal</a>. Browse <a href="./bbt.html">without</a> and <a href="./bbt_abstracts.html">with abstracts</a>, <a href="./bbt_bib.html">bib entries</a>. Please <a href="https://github.com/k4rtik/qpl-bib">file issues/send PRs</a> if you find any mistakes or missing entries. The entries are sorted chronologically.</p>" --footer "<a href="./bbt.html">Go home</a>." bbt.bib

qpv:
	bibtex2html -both -s owens_web -css https://latex.now.sh/style.css -t "Quantum Programming and Verification" --header "Ordered by class schedule" qpv.bib

clean:
	rm -f bbt*.html qpv*.html
