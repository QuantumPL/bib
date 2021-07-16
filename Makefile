bbt:
	bibtex2html -both -s owens_web -css https://latex.now.sh/style.css -d -t "Quantum PL & Verification Bibliography" --header "<p>Welcome to Quantum PL & Verification Bibliography maintained by <a href="http://ks.cs.uchicago.edu/">Kartik Singhal</a>. Browse <a href="./bbt.html">without</a> and <a href="./bbt_abstracts.html">with abstracts</a>, <a href="./bbt_bib.html">bib entries</a>. Please <a href="https://github.com/k4rtik/qpl-bib">file issues/send PRs</a> if you find any mistakes or missing entries. The entries are sorted chronologically.</p>" --footer "<a href="./bbt.html">Go home</a>." bbt.bib

selinger:
	bib2bib -oc selinger-citations -ob selinger.bib -c 'author : "Selinger"' bbt.bib
	bibtex2html -both -s owens_web -css https://latex.now.sh/style.css -d -t "Papers by Peter Selinger in qpl-bib" --header "<p>Welcome to Quantum PL & Verification Bibliography maintained by <a href="http://ks.cs.uchicago.edu/">Kartik Singhal</a>. Browse <a href="./bbt.html">without</a> and <a href="./bbt_abstracts.html">with abstracts</a>, <a href="./bbt_bib.html">bib entries</a>. Please <a href="https://github.com/k4rtik/qpl-bib">file issues/send PRs</a> if you find any mistakes or missing entries. The entries are sorted chronologically.</p>" --footer "<a href="./bbt.html">Go home</a>." selinger.bib

rand:
	bib2bib -oc rand-citations -ob rand.bib -c 'author : "Rand"' bbt.bib
	bibtex2html -both -s owens_web -css https://latex.now.sh/style.css -d -t "Papers by Robert Rand in qpl-bib" --header "<p>Welcome to Quantum PL & Verification Bibliography maintained by <a href="http://ks.cs.uchicago.edu/">Kartik Singhal</a>. Browse <a href="./bbt.html">without</a> and <a href="./bbt_abstracts.html">with abstracts</a>, <a href="./bbt_bib.html">bib entries</a>. Please <a href="https://github.com/k4rtik/qpl-bib">file issues/send PRs</a> if you find any mistakes or missing entries. The entries are sorted chronologically.</p>" --footer "<a href="./bbt.html">Go home</a>." rand.bib

valiron:
	bib2bib -oc valiron-citations -ob valiron.bib -c 'author : "Valiron"' bbt.bib
	bibtex2html -both -s owens_web -css https://latex.now.sh/style.css -d -t "Papers by Benoit Valiron in qpl-bib" --header "<p>Welcome to Quantum PL & Verification Bibliography maintained by <a href="http://ks.cs.uchicago.edu/">Kartik Singhal</a>. Browse <a href="./bbt.html">without</a> and <a href="./bbt_abstracts.html">with abstracts</a>, <a href="./bbt_bib.html">bib entries</a>. Please <a href="https://github.com/k4rtik/qpl-bib">file issues/send PRs</a> if you find any mistakes or missing entries. The entries are sorted chronologically.</p>" --footer "<a href="./bbt.html">Go home</a>." valiron.bib

mingsheng:
	bib2bib -oc mingsheng-citations -ob mingsheng.bib -c 'author : "Mingsheng"' bbt.bib
	bibtex2html -both -s owens_web -css https://latex.now.sh/style.css -d -t "Papers by Mingsheng Ying in qpl-bib" --header "<p>Welcome to Quantum PL & Verification Bibliography maintained by <a href="http://ks.cs.uchicago.edu/">Kartik Singhal</a>. Browse <a href="./bbt.html">without</a> and <a href="./bbt_abstracts.html">with abstracts</a>, <a href="./bbt_bib.html">bib entries</a>. Please <a href="https://github.com/k4rtik/qpl-bib">file issues/send PRs</a> if you find any mistakes or missing entries. The entries are sorted chronologically.</p>" --footer "<a href="./bbt.html">Go home</a>." mingsheng.bib

qpv:
	bibtex2html -both -s owens_web -css https://latex.now.sh/style.css -t "Quantum Programming and Verification" --header "<p>Reading list for University of Chicago's <strong>CMSC 32700 Quantum Programming and Verification</strong> (Spring 2021) offered by <a href="https://people.cs.uchicago.edu/~rand/">Robert Rand</a>. Ordered by class schedule.</p><p>Also see the <a href="index.html">Quantum PL & Verification Bibliography</a>, another outcome of this class.</p>" qpv.bib

all: bbt qpv

clean:
	rm -f bbt*.html qpv*.html
