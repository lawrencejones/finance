DOCUMENTS := \
	coursework.pdf

TEX_FILES:=$(shell find . -name "*.tex" -type f)
RESOURCE_FILES:=$(shell find ./res -type f)

all: $(DOCUMENTS)

%.pdf: %.tex $(RESOURCE_FILES)
	cp $< libtex/ && cd libtex && ( \
	  pdflatex -interaction=nonstopmode $< | grep -E "^|failed" \
	) && \
		mv $@ ../

clean:
	rm -f $(DOCUMENTS) && git clean -f ./libtex

watch:
	watch "make all" --wait 2
