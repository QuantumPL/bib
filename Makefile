bbt:
	bibtex2html -both -s owens_web -css https://latex.now.sh/style.css -d -t "Quantum PL & Verification Bibliography" --header "<p>Welcome to Quantum PL & Verification Bibliography maintained by <a href="http://ks.cs.uchicago.edu/">Kartik Singhal</a>. Browse <a href="./bbt.html">without</a> and <a href="./bbt_abstracts.html">with abstracts</a>, <a href="./bbt_bib.html">bib entries</a>. Please <a href="https://github.com/k4rtik/qpl-bib">file issues/send PRs</a> if you find any mistakes or missing entries. The entries are sorted chronologically.</p>" --footer "<a href="./bbt.html">Go home</a>." bbt.bib

qpv:
	bibtex2html -both -s owens_web -css https://latex.now.sh/style.css -t "Quantum Programming and Verification" --header "<p>Reading list for University of Chicago's <strong>CMSC 32700 Quantum Programming and Verification</strong> (Spring 2021) offered by <a href="https://people.cs.uchicago.edu/~rand/">Robert Rand</a>. Ordered by class schedule.</p><p>Also see the <a href="index.html">Quantum PL & Verification Bibliography</a>, another outcome of this class.</p>" qpv.bib

all: bbt qpv

clean:
	rm -f bbt*.html qpv*.html
