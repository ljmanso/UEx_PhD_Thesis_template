all: thesis
	python thesisometer.py printnumber

number:
	python thesisometer.py onlyprintnumber

thesis: main.pdf

main.pdf: main.tex references.bib abstract_en.tex abstract_es.tex abstract_ext.tex introduction.tex chapter1.tex chapter2.tex chapter3.tex chapter4.tex review.tex futureWork.tex publications.tex 
	pdflatex main.tex
	makeindex main
	pdflatex main.tex

clean:
	rm -rf *.aux *~ *.backup *.log *.dvi *.pdf *.idx *.ilg *.out *.ps *.ind *.toc *.bbl *.blg

