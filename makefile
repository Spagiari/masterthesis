TEX = pdflatex -interaction nonstopmode
BIB = bibtex
GS = gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite

PAPER = masterthesis
BIBFILE = biblproj.bib
BUNDLE = masterthesis.pdf

all: $(PAPER).pdf
	$(GS) -sOutputFile=$(BUNDLE) $(PAPER).pdf

view:
	$(BUNDLE)
	open $(BUNDLE)

spell::
	ispell *.tex

clean::
	rm -fv *.aux *.log *.bbl *.blg *.toc *.out *.lot *.lof $(PAPER).pdf $(BUNDLE)

$(PAPER).pdf: $(PAPER).tex $(BIBFILE)
	$(TEX) $(PAPER)
	$(BIB) $(PAPER)
	$(TEX) $(PAPER)
	$(TEX) $(PAPER)
