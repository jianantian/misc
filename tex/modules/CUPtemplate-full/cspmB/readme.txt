% readme.txt for the cspmB design
% 2009/09/17, v2.00

The 25 files included in this distribution are:

amsthdoc.pdf
amsthm.sty
appendixA.tex
appendixB.tex
appendixC.tex
authors.ind
cambridgeauthordate.bst
cantor1.eps
chap1.tex
chap2.tex
chap3.tex
chap4.tex
chap5.tex
cspmB.cls
cspmBguide.bbl
cspmBguide.pdf
cspmBguide.tex
floatpag.sty
multind.sty
natbib.dtx
natbib.sty
percolation.bib
readme.txt
rotating.sty
subject.ind

To run the guide through LaTeX, you need to run something like this (depending on your installation):
  latex cspmBguide

***NOTE***
The first time you run the files through LaTeX, you will get a `Missing number' message, such as:

  ! Missing number, treated as zero.
  <to be read again>
                     \protect
  l.380   \begin{fig}{cantor}

  ?

This is because LaTeX requires the page number before placing a caption. Run the files through LaTeX a second time, and the message will disappear.

Run the files three times, then make a ps or pdf using the driver you have, e.g. dvips

If you are missing any other standard files, go to http://www.ctan.org/ to download them



