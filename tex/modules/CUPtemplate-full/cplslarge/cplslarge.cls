%%
%% This is file 'cplslarge.cls'
%% cplslarge LaTeX2e document class
%%
%% copyright (c) Cambridge University Press 2011
%%
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
%%
\NeedsTeXFormat{LaTeX2e}
%
\newcommand\version{2011/02/01, v1.0 }
\ProvidesClass{cplslarge}[\version LaTeX2e document class]
%
\newif\iftwocolumnstyle
%
\DeclareOption{final}{\setlength\overfullrule{\z@}}
%
\@twosidetrue
\setlength\paperheight {276mm}%
\setlength\paperwidth  {219mm}%
\setlength\voffset     {-6.1pc}%
\setlength\hoffset     {-6.1pc}%
\def\special@paper{219mm,276mm}
% Needed to set PDF page size
\special{papersize=219mm,276mm}

\ExecuteOptions{final}
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument{%
% 1. to bring multind.sty   into line with cplslarge style
% 2. to bring index.sty     into line with cplslarge style
% 3. to bring natbib.sty    into line with cplslarge style
% 4. to bring rotating.sty  into line with cplslarge style
% 5. to bring amsmath.sty   into line with cambridge style
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 1. to bring multind.sty into line with cplslarge style
%      note that an error in multind.sty will stop verbatim environment
%      working; also everything will come out \indexsize
%      to correct this, we've added an extra set of parens
%
% change chapter opening
%
\@ifpackageloaded{multind}{%
  \def\printindex#1#2{{\@restonecoltrue
    \if@twocolumn\@restonecolfalse\fi
    \columnseprule\z@
    \columnsep 1pc%
    \twocolumn[\vspace*{10\p@}\mbox{}\par\@makeschapterhead{#2}]%
    \@mkboth{#2}{#2}%\markright{\uppercase{#2}}
    \typeout{#2}%
    \addcontentsline{toc}{schapter}{#2}%
    \thispagestyle{plain}
    \indexsize\raggedright
    \parindent\z@
    \parskip\z@ \@plus.3\p@\relax
    \let\item=\@idxitem
    \@input{#1.ind}}}
%
  \def\@idxitem{\par\hangindent 2em}
  \def\subitem{\par\hangindent 3em \hspace*{1em}}
  \def\subsubitem{\par\hangindent 4em \hspace*{2em}}
  \def\indexspace{\par \vskip 3\p@ \@plus 1\p@ \@minus 1\p@\relax}}{}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 2. to bring index.sty into line with cplslarge style
%
\@ifpackageloaded{index}{%
  \renewenvironment{theindex}{%
    \edef\indexname{index}%
    \twocolumn[{\indexname}]%
    \addcontentsline{toc}{schapter}{\indexname}
  \thispagestyle{plain}%
  \indexsize\raggedright%
  \parindent\z@%
  \parskip\z@ \@plus .3\p@\relax%
  \let\item\@idxitem%
  }{%
  }}%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 3. to bring natbib.sty into line with cplslarge style
%    and make 'References' the default
%
\@ifpackageloaded{natbib}{%
\providecommand\refname{References}
\providecommand\bibname{Bibliography}
\setlength\bibhang{2em}
\renewenvironment{thebibliography}[1]{%
	\ifchapterreference%
	    \chapter*{\refname}%
        \@mkboth{\refname}{\refname}%
	  \else%
	    \section*{\refname}%
	  \fi%
	  \parindent \z@\bibpreamble\bibliofont\list
   {\@biblabel{\arabic{NAT@ctr}}}{\@bibsetup{#1}%
    \setcounter{NAT@ctr}{0}}%
    \ifNAT@openbib
      \renewcommand\newblock{\par}
    \else
      \renewcommand\newblock{\hskip .11em \@plus.33em \@minus.07em}%
    \fi
    \sloppy%\clubpenalty4000\widowpenalty4000
    \sfcode`\.=1000\relax
    \let\citeN\cite \let\shortcite\cite
    \let\citeasnoun\cite
 }{\def\@noitemerr{%
  \PackageWarning{natbib}
     {Empty `thebibliography' environment}}%
  \endlist\vskip-\lastskip}
  \renewcommand\bibsection{\chapter*{\refname
    %\@mkboth{\refname}{\refname}
    }}%
}{}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. to bring rotating.sty into line with cplslarge style
%
\@ifpackageloaded{rotating}{%
\renewenvironment{sidewaystable*}
               {\let\@makecaption\make@table@caption\@rotdblfloat{table}}
               {\end@rotdblfloat}
\renewenvironment{sidewaysfigure*}
               {\let\@makecaption\make@figure@caption\@rotdblfloat{figure}}
               {\end@rotdblfloat}
  }%
  {}%
%
%
% 5. to bring amsmath.sty into line with cambridge style
%
%
\@ifpackageloaded{amsmath}{%
}{
\newenvironment{equation*}%
    {\@beginparpenalty\predisplaypenalty
     \@endparpenalty\postdisplaypenalty
 %    \refstepcounter{equation}%
       \topsep\abovedisplayskip
      \trivlist\item[]\leavevmode
       \hbox to\linewidth\bgroup $\m@th% $
         \displaystyle
         \hskip\mathindent}%
        {$\hfil % $
         \displaywidth\linewidth%\hbox{\@eqnnum}%
       \egroup
     \endtrivlist}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
}% end of \AtBeginDocument section
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\newif\if@backmatter
\newif\if@mainmatter \@mainmattertrue
\newcommand\frontmatter{\cleardoublepage%
            \@mainmatterfalse%
	    \pagenumbering{roman}}
\newcommand\mainmatter{\cleardoublepage%
       \@mainmattertrue%
       \pagestyle{headings}%
       \pagenumbering{arabic}}
\newcommand\backmatter{\cleardoublepage%
      \@backmattertrue\@mainmatterfalse\twocolumnstyletrue}

%  ****************************************
%  *               FONTS                  *
%  ****************************************
%
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
%
% common sizes
\newcommand{\@xvipt}{16}%
\newcommand{\@xviiipt}{18}%
\newcommand\tiny{\@setfontsize\tiny\@vpt{6}}
\newcommand\large{\@setfontsize\large\@xipt{14}}
\newcommand\Large{\@setfontsize\Large\@xiipt{17}}
\newcommand\LARGE{\@setfontsize\LARGE\@xvipt{19}}
\newcommand\huge{\@setfontsize\huge\@xviiipt{24}}
\let\Huge\huge
%
\renewcommand\normalsize{%
  \@setfontsize\normalsize{9.5pt}{11.5pt}%\@xpt\@xiipt
  \abovedisplayskip .5\baselineskip plus2pt minus1pt\belowdisplayskip \abovedisplayskip
  \abovedisplayshortskip .5\baselineskip plus0pt minus 3pt
  \belowdisplayshortskip .5\baselineskip plus0pt minus3pt\let\@listi\@listI} 
%
\newcommand\footnotesize{%
  \@setfontsize\footnotesize{8pt}{9.5pt}%
  \abovedisplayskip 4pt plus 1pt minus 0pt%
  \belowdisplayskip \abovedisplayskip%
  \abovedisplayshortskip 4pt plus 0pt minus 1pt%
  \belowdisplayshortskip 4pt plus 0pt minus 1pt
}
%
\newcommand\indexsize{%
  \@setfontsize\indexsize{8.5pt}{10pt}%
  \abovedisplayskip .5\baselineskip plus2pt minus1pt\belowdisplayskip \abovedisplayskip
  \abovedisplayshortskip .5\baselineskip plus0pt minus 3pt
  \belowdisplayshortskip .5\baselineskip plus0pt minus3pt\let\@listi\@listI} 
%
\normalsize
%
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch{\relax}{\mathcal}}
\DeclareRobustCommand*\mit{\@fontswitch{\relax}{\mathnormal}}
%
\def\runningheadfont{\fontsize{10pt}{10pt}\itshape}
\def\dropfoliofont{\fontsize{9.5pt}{9.5pt}\itshape}
\def\extractfont{\fontsize{8.5pt}{9.5pt}\selectfont}
\def\tablefont{\fontsize{9.5pt}{11pt}\selectfont}
\def\listfont{}
\def\sectionfont{\fontsize{10pt}{13pt}\bfseries\raggedright}
\def\subsectionfont{\fontsize{9.5pt}{11.5pt}\bfseries\raggedright}
\def\subsubsectionfont{\fontsize{10pt}{11.5pt}\itshape\raggedright}
\def\paragraphfont{\fontsize{9.5pt}{11.5pt}\bfseries}
\def\partfont{\fontsize{14}{16}\selectfont}
\def\parttitlefont{\fontsize{18}{21}\selectfont}
\def\chapterfont{\fontsize{18}{21}\selectfont}
\def\authorfont{\fontsize{11}{12}\selectfont\scshape}
\def\mhfont{\fontsize{14}{16}\selectfont}
\def\figcaptionfont{\fontsize{8.5}{10}\selectfont\raggedright}
\def\tablecapfont{}%
\def\tablenotefont{\fontsize{9.5}{11.5}\raggedright\selectfont}
\def\bibliofont{\fontsize{8.5}{10.5}\selectfont}
\def\appendixfont{\fontsize{8.5}{10}\selectfont}
\def\tocauthorfont{\fontsize{8.5}{13}\selectfont\leftskip18pt}
\def\lotfont{\fontsize{9.5}{11.5}\selectfont}
\def\tocfont{\fontsize{11}{13}\selectfont}%
\def\tocchapterfont{\fontsize{11}{13}\selectfont}%\leftskip12pt}
% define a smallverbatim 8/10

\begingroup \catcode `|=0 \catcode `[= 1
\catcode`]=2 \catcode `\{=12 \catcode `\}=12
\catcode`\\=12 |gdef|@xsmallverbatim#1\end{smallverbatim}[#1|end[smallverbatim]]
|gdef|@sxsmallverbatim#1\end{smallverbatim*}[#1|end[smallverbatim*]]
|endgroup
%
\def\@smallverbatim{\trivlist \item\relax
  \if@minipage\else\vskip\parskip\fi
  \leftskip\@totalleftmargin\rightskip\z@skip
  \parindent\z@\parfillskip\@flushglue\parskip\z@skip
  \@@par
  \@tempswafalse
  \def\par{%
    \if@tempswa
      \leavevmode \null \@@par\penalty\interlinepenalty
    \else
      \@tempswatrue
      \ifhmode\@@par\penalty\interlinepenalty\fi
    \fi}%
  \let\do\@makeother \dospecials
  \obeylines \smallverbatim@font \@noligs
  \hyphenchar\font\m@ne
  \everypar \expandafter{\the\everypar \unpenalty}%
}
\def\smallverbatim{\@smallverbatim \frenchspacing\@vobeyspaces \@xsmallverbatim}
\def\endsmallverbatim{\if@newlist \leavevmode\fi\endtrivlist}
%
\def\smallverbatim@font{\normalfont\indexsize\ttfamily}
%
%  ****************************************
%  *            PAGE LAYOUT               *
%  ****************************************
%
% All margin dimensions measured from a point one inch from top and side
% of page.
%
% SIDE MARGINS:
%
  \setlength\oddsidemargin{60pt}
  \setlength\evensidemargin{66pt}
  \setlength\marginparwidth{47pt}%53pt minus 6pt
  \setlength\marginparsep{6pt}
  \setlength\topmargin{30\p@}
  \setlength\headheight{7\p@}
  \setlength\footskip{21\p@}
  \setlength\topskip{6.8\p@}
  \setlength\headsep{18.3\p@}
%
% DIMENSION OF TEXT:
%
\setlength\textheight{58\baselineskip}
\addtolength\textheight{\topskip}
%
\textwidth41.5pc%
\setlength\columnsep{1.5pc}
\setlength\columnseprule{0\p@}
%
% FOOTNOTES
%
\setlength\footnotesep{6.5\p@}
\setlength{\skip\footins}{9\p@ \@plus 4\p@ \@minus 2\p@}%
%
% FLOATS
%
\setlength\floatsep{13\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\textfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\intextsep{13\p@ \@plus 2\p@ \@minus 2\p@}
%
\setlength\dblfloatsep{13\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dbltextfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
%
%
% for floats on a separate float page
\setlength\@fptop{0\p@ \@plus 1fil}
\setlength\@fpsep{13\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}
%
%   wide floats
\setlength\@dblfptop{0\p@ \@plus 0fil}
\setlength\@dblfpsep{13\p@ \@plus 0fil}
\setlength\@dblfpbot{0\p@ \@plus 3fil}
%
%
% MARGINAL NOTES:
%
\setlength\marginparpush{5\p@}
%
%  ****************************************
%  *           PARAGRAPHING               *
%  ****************************************
%
\setlength\parskip{0\p@}% \@plus .25\p@}
\setlength\parindent{1em}
\listparindent\parindent
\setlength\partopsep{0\p@ \@plus 1\p@}
%
\tolerance 1414
\hbadness 1414
\emergencystretch 1.5em
\hfuzz 0.3pt
\widowpenalty=10000
\vfuzz \hfuzz
\clubpenalty=10000
%
%    ****************************************
%    *        CHAPTERS AND SECTIONS         *
%    ****************************************
%
\usepackage{soul}
  \sodef\lettersptw{}{.03em}{.35em\@plus.08em\@minus.06em}%
    {.35em\@plus.275em\@minus.183em}%
  \sodef\letterspth{}{.1em}{.35em\@plus.08em\@minus.06em}%
    {.35em\@plus.275em\@minus.183em}%
  \sodef\letterspthh{}{.07em}{.35em\@plus.08em\@minus.06em}%
    {.35em\@plus.275em\@minus.183em}%
%
\def\spreadoutfactor{1}
%
\def\spreadout#1{%
  \gdef\temp{#1}\dimen0 = \spreadoutfactor pt
  \expandafter\dospreadout\temp\endmark\kern-\dimen0}
%
\def\dospreadout{%
  \afterassignment\findospreadout
  \let\next= }
%
\def\findospreadout{%
   \ifx\next\endmark
      \let\nextaction = \relax
   \else
      \let\nextaction = \dospreadout
      \next
      \kern\dimen0
   \fi
   \nextaction}
%
% Heading for the \chapter command -- fixed depth chapter headings...
%
\newif\if@appendix
%
\newcommand\chapterauthor[1]{%
    \def\@chapterauthor{#1}%
}

\edef\@chapterauthor{\relax}

\newcommand\ch@pterauthor[1]{%
  \gdef\@ch@pterauthor{#1}}

\gdef\@ch@pterauthor{%
  \vbox to0pt{%
  \vspace*{-7pt}
  \parbox[t]{\textwidth}{\normalfont\normalsize%\baselineskip 13\p@
  \centering\@chapterauthor
  }%
  \vss}%
}

\def\@makechapterhead#1{%
  {\normalsize
  \parindent 0\p@
   \raisebox{-1.1\baselineskip}[0\p@][0\p@]{\mbox{\hspace*{4pc}}%
     \centering%
    \begin{minipage}[t]{33.5pc}%
     \centering%
       \if@appendix
         {\chapterfont \appendixname\ \thechapter}%
       \else
       {\chapterfont \thechapter}%
     \fi
     \par
          \vskip 1\p@
          \rule{33.5pc}{0.5pt}\par
          \vskip 2.2pt
     {\chapterfont #1%
     \nobreak
     \par}\vskip10pt%
       {\authorfont\MakeUppercase{\lettersptw{\@author}}%
      \par}%
    \end{minipage}%
    }%
  \par%
  \vskip 12\baselineskip% 2.5 less than the first line of text
  }%
  \chapterauthor{\relax}%
}

\def\@makeschapterhead#1{{\normalsize%
  \parindent 0\p@%
  \raisebox{-2.6\baselineskip}[0\p@][0\p@]{\mbox{\hspace*{4pc}}%
   \begin{minipage}[t]{33.5pc}%
    \centering%
    \mhfont%
\iftwocolumnstyle%
\else%
  \if@mainmatter%
  \else%
  \vspace*{-16.2pt}%
  \fi%
\fi%
    \MakeUppercase{\letterspth{#1}}\par%
    \nobreak%
   \end{minipage}}
  \par \nobreak
  \vskip 12\baselineskip % 2.5 less than the first line of text
  }\chapterauthor{\relax}%
}
%
% \secdef{UNSTARCMDS}{STARCMDS} :
%
\def\chapter{%
   \endappendix%
   \clearpage
   \thispagestyle{plain}
   \global\@topnum\z@
   \@afterindentfalse
   \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{%
  \ifnum \c@secnumdepth >\m@ne
    \refstepcounter{chapter}
    \typeout{\@chapapp\space\thechapter.}
          \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#1}
  \else
   \addcontentsline{toc}{chapter}{#1}
  \fi
   \chaptermark{#1}%
    \twocolumn[\@makechapterhead{#2}]%
    \ifx\@author\@empty\else\addcontentsline{toc}{author}{\@author}\fi%
   \markboth{\@shortauthor}{#1}%
    \@afterheading%
}
\def\@schapter#1{%
  \if@mainmatter
   \addcontentsline{toc}{schapter}{#1}%
  \else
  \if@backmatter
   \addcontentsline{toc}{schapter}{\itshape #1}%
   \fi%
  \fi%
  \chaptermark{#1}%
\iftwocolumnstyle%
  \twocolumn[\@makeschapterhead{#1}]%
\else%
  \if@mainmatter%
  \twocolumn[\@makeschapterhead{#1}]%
  \else%
  \@makeschapterhead{#1}%
  \vspace*{-\baselineskip}%
  \fi%
\fi%
   \markboth{#1}{#1}%
  \@afterheading%
 \normalsize%
}
%
% \@startsection {NAME}{LEVEL}{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE}
%            optional * [ALTHEADING]{HEADING}
%
 \def\section{\@startsection {section}{1}{\z@}
  {-33\p@ \@plus-7\p@ \@minus-3.5\p@}{11.5\p@}{\sectionfont}}
 \def\subsection{\@startsection{subsection}{2}{\z@}
  {-17\p@ \@plus-7\p@ \@minus-3.5\p@}{5.6\p@}{\subsectionfont}}
 \def\subsubsection{\@startsection{subsubsection}{3}{\z@}
  {-17.3\p@ \@plus-7\p@ \@minus-3.5\p@}{5.6\p@}{\subsubsectionfont}}
 \def\paragraph{\@startsection{paragraph}{4}{\z@}
  {11.5\p@ \@plus7\p@ \@minus3.5\p@}{-0.5em}{\paragraphfont}}
%
% Default initializations of \...mark commands
%
\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{3}
%
% APPENDIX
%
% single version
\def\appendix{\par\clearpage
 \@appendixtrue
 \setcounter{chapter}{0}
 \setcounter{section}{0}
 \setcounter{equation}{0}
 \setcounter{table}{0}
 \setcounter{figure}{0}
 \def\@chapapp{\appendixname}
 \def\thechapter {\Alph{chapter}}
 \def\thesection {\arabic{section}}
 \def\thetable   {\@arabic\c@table}
 \def\thefigure  {\@arabic\c@figure}
 \def\theequation{\arabic{equation}}
 \appendixfont}
%
%%%%%%%%%%%%%%%%%%%%%%
\def\endappendix{\relax}
%
%    ****************************************
%    *                LISTS                 *
%    ****************************************
%
\setlength\leftmargini{1em}
\setlength\leftmarginii{1em}
\setlength\leftmarginiii{1em}
\setlength\leftmarginiv{1em}
\setlength\leftmarginv{1em}
\setlength\leftmarginvi{1em}
\leftmargin\leftmargini
\setlength\labelsep{0.5em}
\labelwidth\leftmargini \advance\labelwidth-\labelsep
\def\@listI{\leftmargin\leftmargini
 \parsep    \z@%
 \partopsep \z@%
 \topsep  \z@%
 \itemsep   \z@%
 \listparindent \parindent%
}
\let\@listi\@listI
\@listi
\def\@listii{\leftmargin\leftmarginii%
 \labelwidth\leftmarginii \advance\labelwidth-\labelsep%
 \parsep    \z@%
 \partopsep \z@%
 \topsep \z@%
 \itemsep   \z@%
}
\def\@listiii{\leftmargin\leftmarginiii%
 \labelwidth\leftmarginiii \advance\labelwidth-\labelsep%
 \parsep    \z@%
 \partopsep \z@%
 \topsep \z@%
 \itemsep   \z@%
}
\def\@listiv{\leftmargin\leftmarginiv
 \labelwidth\leftmarginiv \advance\labelwidth-\labelsep}
\def\@listv{\leftmargin\leftmarginv
 \labelwidth\leftmarginv  \advance\labelwidth-\labelsep}
\def\@listvi{\leftmargin\leftmarginvi
 \labelwidth\leftmarginvi \advance\labelwidth-\labelsep}
%
%    ****************************************
%    *           LIST ENVIRONMENTS          *
%    ****************************************
%
%
% ENUMERATE -- with optional argument to set left margin
% DEFAULT is arabic numbering with full point

\def\makeRRlabel#1{\hss\llap{#1}}
\def\makeRRlabeldot#1{\hss\llap{#1.}}
%
\newbox\@dotbox
\setbox\@dotbox\hbox{.}%
\def\enumerate{\ifnum \@enumdepth >3 \@toodeep \else
  \advance\@enumdepth \@ne
  \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
 \fi
 \@ifnextchar [{\@enumeratetwo}{\@enumerateone}%
}
\def\@enumeratetwo[#1]{%
 \list{\csname label\@enumctr\endcsname}%
  {\settowidth\labelwidth{#1}%
   \leftmargin\labelwidth \advance\leftmargin\labelsep
   \usecounter{\@enumctr}%
   \let\makelabel\makeRRlabel}%
}
\def\@enumerateone{%
 \list{\csname label\@enumctr\endcsname}%
  {\usecounter{\@enumctr}%
    \leftmargin 0.5em%
    \advance\leftmargin\labelsep%
    \advance\leftmargin\wd\@dotbox%
   \let\makelabel\makeRRlabeldot}}
%
\newcommand\labelenumi{\theenumi}
\newcommand\labelenumii{\theenumii}
\newcommand\labelenumiii{\theenumiii}
\newcommand\labelenumiv{\theenumiv}
%
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
%
% ITEMIZE
%
\def\itemize{\ifnum \@itemdepth >3 \@toodeep \else%
  \advance\@itemdepth \@ne%
  \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
  \list{\csname\@itemitem\endcsname}%
   {\def\makelabel##1{\hss\llap{##1}}}%
 \fi%
}
\newcommand\labelitemi{\leavevmode\raise.8pt\hbox{$\bullet$}}
\newcommand\labelitemii{\leavevmode\raise.8pt\hbox{$\bullet$}}
\newcommand\labelitemiii{\leavevmode\raise.8pt\hbox{$\bullet$}}
\newcommand\labelitemiv{\leavevmode\raise.8pt\hbox{$\bullet$}}
%
%unnumberedlist
\newenvironment{unnumlist}{%
  \topsep\z@%
    \list{}{%
    \listparindent1em%
    \itemindent-1em%
    \leftmargin2em%
    \parsep0pt%
    \itemsep0pt%
    \partopsep0pt}
    \def\makelable##1{##1}%
}{\endlist}%
%
% DESCRIPTION
%
\newcommand*\descriptionlabel[1]{\hspace\labelsep\bfseries #1}
\def\description{%
 \list{}{\labelwidth\z@%
  \leftmargin 3pc%
  \itemindent-\leftmargin%
  \let\makelabel\descriptionlabel%
 }}
\let\enddescription\endlist
%
%    ****************************************
%    *         OTHER ENVIRONMENTS           *
%    ****************************************
%
% VERSE
%
\def\verse{\let\\=\@centercr
  \list{}{\itemsep\z@ \itemindent -1em\listparindent \itemindent
          \rightmargin\z@%
	  \advance\leftmargin 1em}\item[]\smallish}
\let\endverse=\endlist
%
% QUOTATION
%
\def\quotation{\list{}{%
    \rightmargin\z@}\item[]\smallish}
\let\endquotation=\endlist
%
% QUOTE
%
\def\quote{\list{}{%
\rightmargin\z@}\item[]\smallish}
\let\endquote=\endlist
%
% INDENTED (for use in title pages)
%
\def\indented{\list{}{%
 \listparindent\z@\rightmargin\z@}\raggedright\item[]}
\let\endindented=\endlist
%
% ARRAY AND TABULAR
%
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.5\p@}
\setlength\doublerulesep{2\p@}
%
% TABBING
%
\tabbingsep\labelsep
%
% FRAMEBOX
%
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.5\p@}
%
%
%    ****************************************
%    *        CHAPTERS AND SECTIONS         *
%    ****************************************
%
% DEFINE COUNTERS:
%
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\Roman{part}}
%
\def\thechapter       {\arabic{chapter}}
\def\thesection       {\thechapter.\arabic{section}}
\def\thesubsection    {\thesection.\arabic{subsection}}
\def\thesubsubsection {\thesubsection .\arabic{subsubsection}}
\def\theparagraph     {\thesubsubsection.\arabic{paragraph}}
\def\thesubparagraph  {\theparagraph.\arabic{subparagraph}}
\def\@chapapp{\chaptername}
%
%    ****************************************
%    *                 PARTS                *
%    ****************************************
%
\newcommand\ls{\kern.1em}% for letterspacing; .15em is a hair less than thinspace
\newcommand\ns{\kern.4em}% for name-spacing
%
\def\part{\cleardoublepage%
 \thispagestyle{empty}%
 \if@twocolumn%
   \onecolumn%
   \@tempswatrue%
  \else \@tempswafalse%
 \fi%
 \secdef\@part\@spart%
}
% rule appears in Part title whether [multi] option is used or not
\def\@part[#1]#2{\ifnum \c@secnumdepth >-2\relax%
  \refstepcounter{part}%
\let\numberline\partnumberline%
    \addcontentsline{toc}{part}{\numberline{\thepart}#1}%
  \fi%
  \@mkboth{}{}%
  {\centering%
  \vspace*{-.75\baselineskip}%
   \ifnum \c@secnumdepth >-2\relax%
    {\partfont\letterspth{\thepart}}%
    \par%
    \vskip 1.5\p@%
    \rule{33.5pc}{0.5pt}\par%
    \vskip 2.2pt%
   \else%
    \par%
    \vskip 2.5\baselineskip%
  \fi%
  {\parttitlefont%
\MakeUppercase{\letterspth{#2}}\par}}%
  \@endpart%
}
% rule appears in sPart title whether [multi] option is used or not
\def\@spart#1{{\centering%
  \vspace*{-\baselineskip}%
  \par%
  \vskip 13\p@%
         \vskip 0\p@%
         \rule{\textwidth}{0.4pt}\par%
         \vskip 7pt%
  \parttitlefont \MakeUppercase{\letterspth{#1}}\par}%
\@endpart}
%
\def\@endpart{\cleardoublepage}
%
%
%    ****************************************
%    *         TABLE OF CONTENTS, ETC.      *
%    ****************************************
%
\def\numberline#1{\hbox to\@tempdima{\hfill#1\enspace}}
\def\partnumberline#1{{#1.\enspace}}
%
\newif\if@firstTOCentry \@firstTOCentrytrue%
\newdimen\@toclmarg%
 \setcounter{tocdepth}{0}%
 \@toclmarg 18\p@%
\def\@pnumwidth{1.5em}%
\def\@dotsep{4.5}
%
% TABLEOFCONTENTS
%
\newcommand*\l@section      {\@dottedtocline{1}{28pt}{28pt}}
\newcommand*\l@subsection   {\@dottedtocline{2}{56pt}{34pt}}

% these are not used
\newcommand*\l@subsubsection{\@dottedtocline{3}{\z@}{\@toclmarg}}
\newcommand*\l@paragraph    {\@dottedtocline{4}{\z@}{\@toclmarg}}
\newcommand*\l@subparagraph {\@dottedtocline{5}{\z@}{\@toclmarg}}
\newcommand\tableofcontents{%\onecolumn%
  \twocolumnstylefalse%
  \@firstTOCentrytrue%
 \begingroup%
 \hsize30pc%
 \chapter*{\contentsname}%
 \vspace*{-1.2pt}%
 \tocfont%
 \@starttoc{toc}%
 \endgroup%
}
%
\newcommand*\l@part[2]{\vspace{\baselineskip}%
 \addpenalty{-\@highpenalty}%
 \begingroup%
  \parindent \z@ \rightskip \@pnumwidth%
  \parfillskip -\@pnumwidth%
  \leavevmode%
  \if@firstTOCentry%
    {\tocfont\leftskip18pt{\bfseries #1} \hfil \hbox to\@pnumwidth{\hss {\itshape page\/} #2}\par}%
    \global\@firstTOCentryfalse%
  \else%
   {\tocfont\leftskip18pt{\normalfont\bfseries #1} \hfil \hbox to\@pnumwidth{\hss #2}\par}%
  \fi%
  \nobreak%
 \endgroup%
}
%
\newcommand*\l@author[2]{%
 \addpenalty{-\@highpenalty}%
 \begingroup%
  \parindent \z@ \rightskip \@pnumwidth%
  \parfillskip -\@pnumwidth%
  \leavevmode%
  \if@firstTOCentry%
    {\tocauthorfont\MakeUppercase{\letterspthh{#1}} \hfil \hbox to\@pnumwidth{ }\par}%
    \global\@firstTOCentryfalse%
  \else%
    {\tocauthorfont\MakeUppercase{\letterspthh{#1}} \hfil \hbox to\@pnumwidth{ }\par}%
  \fi%
  \nobreak%
 \endgroup%
}
%
\newcommand*\l@chapter[2]{%
 \vspace{.5\baselineskip}%
 \@tempdima \@toclmarg%
 \begingroup%
  \parindent \z@%
  \leavevmode%
  \if@firstTOCentry%
   {\tocchapterfont{#1}\nobreak\hfil \nobreak\hbox to\@pnumwidth{\hfil {\normalfont\itshape page\/} #2}\par}%
   \global\@firstTOCentryfalse%
  \else%
   {\tocchapterfont\hangindent2em{#1}\nobreak\hfill \nobreak\hbox to\@pnumwidth{\hfil #2}\par}%
  \fi%
 \endgroup%
}
%
\newcommand*\l@schapter[2]{%
 \@tempdima \@toclmarg%
 \begingroup%
  \parindent \z@  \rightskip \@pnumwidth  \parfillskip -\@pnumwidth%
  \leavevmode%
  \advance \leftskip \@tempdima %
  \if@firstTOCentry%
   {\tocfont{\itshape #1}\nobreak\hfil \nobreak\hbox to\@pnumwidth{\hss {\itshape page\/} #2}\par}%
   \global\@firstTOCentryfalse%
  \else%
  \vspace*{-.5\baselineskip}\par%
  {\tocfont{#1}\nobreak\hfil \nobreak\hbox to\@pnumwidth{\hss #2}\par}%
  \fi%
 \endgroup%
}
% remove page number from contributor page
\newcommand*\l@contrib[2]{%
 \begingroup%
 \normalsize
  \parindent \z@  \rightskip \z@%
  \leavevmode%
   {{#1}\par\addvspace{\baselineskip}}%
 \endgroup%
}
%
% LIST OF FIGURES
%
\newcommand\listoffigures{%
  \twocolumnstyletrue%
  \@firstTOCentrytrue%
  \bgroup%
      \chapter*{\listfigurename}%
 \lotfont%
 \@starttoc{lof}%
 \egroup%
 \twocolumnstylefalse%
}
%
% listing for figures (repeat of schapter)
\newcommand*\l@figure[2]{\pagebreak[3]%
 \@tempdima\@toclmarg%
 \begingroup%
  \parindent \z@  \rightskip \@pnumwidth  \parfillskip -\@pnumwidth%
  \leavevmode%
  \advance \leftskip \@tempdima  \hskip -\leftskip%
  \if@firstTOCentry%
    {#1}\nobreak\hfil \nobreak\hbox to\@pnumwidth{\hss {\itshape page\/} #2}\par%
    \global\@firstTOCentryfalse%
  \else%
    {#1}\nobreak\hfil \nobreak\hbox to\@pnumwidth{\hss #2}\par%
 \fi%
 \endgroup%
}
%
% LIST OF TABLES
%
\newcommand\listoftables{%
  \twocolumnstyletrue%
  \@firstTOCentrytrue%
  \bgroup%
    \chapter*{\listtablename}%
    \lotfont%
    \@starttoc{lot}%
 \egroup%
 \twocolumnstylefalse%
}
%
\let\l@table\l@figure
%
% LIST OF CONTRIBUTORS
\def\contribauthor#1#2{{\scshape#1}\\{#2}}
%
\newcommand\contributor[2]{\addcontentsline{loc}{contrib}{\contribauthor{#1}{#2}}}
%
\newcommand\listofcontributors{%
  \twocolumnstyletrue%
 \bgroup%
 \normalsize%
   \chapter*{\listcontribname}%
%   \addcontentsline{toc}{schapter}{\listcontribname}%
 \@starttoc{loc}%
 \egroup%
 \twocolumnstylefalse%
}
%
\newcommand\editedlistofcontributors{%
  \twocolumnstyletrue%
 \bgroup
  \normalsize%
   \chapter*{\listcontribname}
 \@input{editedloc}
 \egroup
 \twocolumnstylefalse%
}
%
% \@dottedtocline{LEVEL}{INDENT}{NUMWIDTH}{TITLE}{PAGE} without the dots
%
\def\@dottedtocline#1#2#3#4#5{% For toc alone, all designs assume 
 \ifnum #1>\c@tocdepth
 \else
  \vskip \z@ \@plus .2\p@
  {\leftskip #2\relax
   \rightskip \@tocrmarg \@plus2em % for ragged right entries
   \parfillskip -\rightskip
   \parindent #2\relax
   \@afterindenttrue
   \interlinepenalty\@M
   \leavevmode
   \@tempdima #3\relax \advance\leftskip \@tempdima \hbox{}\hskip -\leftskip
   #4\nobreak
   \hfill \nobreak
   \if@firstTOCentry
    \hbox to\@pnumwidth{\hfil\rm {\itshape page\/} #5}\par
    \global\@firstTOCentryfalse
   \else
    \hbox to\@pnumwidth{\hfil\rm #5}\par
   \fi}%
 \fi
}
%
%    ****************************************
%    *             BIBLIOGRAPHY             *
%    ****************************************
%
\newif\ifchapterreference
\chapterreferencetrue
\newdimen\bibindent
\setlength\bibindent{2em}
\newenvironment{thebibliography}[1]
     {\ifchapterreference%
	    \chapter*{\refname}%
        \@mkboth{\refname}{\refname}%
	  \else%
	    \section*{\refname}
	  \fi%
	  \bibliofont%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
%
%    ****************************************
%    *              THE INDEX               *
%    ****************************************
%
% THE THEINDEX ENVIRONMENT
%
\def\index@prologue{}
\def\@indextype{}
\newenvironment{theindex}{%\the\baselineskip%
    \chapter*{\indexname}%
  \indexsize\raggedright%
  \parindent\z@%
  \parskip\z@%
  \let\item\@idxitem%
  }{%
  }
\newif\if@restonecol
%
\newcommand\@idxitem{\par\hangindent 2em}
\newcommand\subitem{\par\hangindent 3em \hspace*{1em}}
\newcommand\subsubitem{\par\hangindent 4em \hspace*{2em}}
\newcommand\indexspace{\par\relax}
%
%    ****************************************
%    *          NUMBERED FOOTNOTES          *
%    ****************************************
%
\newskip\@footindent
\@footindent=1em
%
\renewcommand\footnoterule{\kern-3\p@ \hrule width 0\columnwidth \kern 2.6\p@}
%
% reset on chapters
\@addtoreset{footnote}{chapter}
%
\long\def\@makefntext#1{\footnotesize\parindent 1em%
 ${\@thefnmark}$\enskip#1}
%
\renewcommand\thefootnote{\mbox{$\fnsymbol{footnote}$}}
\def\@makefnmark{\hbox{\@thefnmark}}
%
\def\@fnsymbol#1{{{^{\scriptstyle\@arabic{#1}}}\relax}}% correct
%
% MINIPAGE
%
\skip\@mpfootins = 4\p@ \@plus 1\p@ \@minus .1\p@  %
\def\thempfootnote{\alph{mpfootnote}}
\def\@makempfnmark{\hbox{$^{\@thefnmark}$}}
%
\long\def\@makempfntext#1{\@setpar{\@@par\@tempdima \hsize
 \advance\@tempdima-\@footindent
 \parshape \@ne \@footindent \@tempdima}\par
 \noindent \hbox to \z@{\hss$^{\@thefnmark}$\enskip}#1}
%
\def\@iiiminipage#1#2[#3]#4{% from latex.ltx
  \leavevmode
  \@pboxswfalse
  \setlength\@tempdima{#4}%
  \def\@mpargs{{#1}{#2}[#3]{#4}}%
  \setbox\@tempboxa\vbox\bgroup
    \color@begingroup
      \hsize\@tempdima
      \textwidth\hsize \columnwidth\hsize
      \@parboxrestore
      \def\@mpfn{mpfootnote}\def\thempfn{\thempfootnote}\c@mpfootnote\z@
      \let\@makefnmark\@makempfnmark % 
      \let\@footnotetext\@mpfootnotetext
      \let\@listdepth\@mplistdepth \@mplistdepth\z@
      \@minipagerestore\global\@minipagetrue %
      \everypar{\global\@minipagefalse\everypar{}}}
%
\long\def\@mpfootnotetext#1{\global\setbox\@mpfootins
 \vbox{\unvbox\@mpfootins
  \footnotesize
  \hsize\columnwidth \@parboxrestore
  \edef\@currentlabel{\csname p@mpfootnote\endcsname\@thefnmark}
  \@makempfntext{\rule{\z@}{\footnotesep}\ignorespaces #1\strut}}}
%
%
%    ****************************************
%    *         FIGURES AND TABLES           *
%    ****************************************
%
% Float placement parameters.
%
\setcounter{topnumber}{2}
\renewcommand\topfraction{0.9}
\setcounter{bottomnumber}{2}
\renewcommand\bottomfraction{0.5}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{0.05}
\renewcommand\floatpagefraction{0.95}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{0.9}
\renewcommand\dblfloatpagefraction{0.8}
%
% \@makecaption{NUMBER}{TEXT} : Macro to make a figure or table caption.
%
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{20\p@}
\setlength\belowcaptionskip{2\p@}
\long\def\make@table@caption#1#2{%
    {\tablecapfont #1.\enskip{\itshape #2}\par}\vskip\belowcaptionskip}
%
\def\toprule{\\[-10pt]\hline\hline\\[-10\p@]}
\def\botrule{\\[-8pt]\hline\hline}
\newenvironment{tabnote}{\par\addvspace{5pt}\tablenotefont}{\par}
%
\newlength\figcapindent
\setlength\figcapindent{1.5pc}% 1.5pc either side
%
\newbox\@figbox
\long\def\make@figure@caption#1#2{%
  \IfFileExists{\@figurebox}{%
  \ifx\@figwidth\empty%
    \ifx\@figheight\@empty%
     \centerline{\includegraphics{\@figurebox}}%
     \else
     \centerline{\includegraphics[height=\@figheight]{\@figurebox}}%
     \fi%
 \else
   \ifx\@figheight\@empty
        \centerline{\includegraphics[width=\@figwidth]{\@figurebox}}%
	\else
     \centerline{\includegraphics[width=\@figwidth,height=\@figheight]{\@figurebox}}%
   \fi%
 \fi%
   }{\centerline{\vrule width9pc height10pc}}%
  \setbox\@tempboxa\hbox{\figcaptionfont{\bfseries#1}\enskip #2}%
  \vskip5pt%
  \ifdim \wd\@tempboxa >\hsize%
      {\figcaptionfont{\bfseries #1}\enskip #2\par}%
  \else%
       \hbox to\hsize{\hfil\box\@tempboxa\hfil}\par%
  \fi%
\gdef\@figurebox{}\gdef\@figwidth{0pt}\gdef\@figheight{0pt}}
%
\usepackage{stfloats,graphicx}
\edef\flt@bottom{b}
\def\@figurebox{}
\gdef\@figwidth{0pt}%
\gdef\@figheight{0pt}%
\def\figurebox#1#2#3{%
  \gdef\@figwidth{#1}%
  \gdef\@figheight{#2}
  \gdef\@figurebox{#3}}
%
\newdimen\figcapheight
\long\def\make@figure@dblcaption#1#2{%
\xdef\figtemp{\@fps}%
  \setbox0\vbox{\hsize\columnwidth{\figcaptionfont{\bfseries #1}\enskip #2\par}}%
  \global\figcapheight\ht\z@%
  \gdef\capadjust{\vspace*{-\figcapheight}}
  \if\figtemp\flt@bottom
  \vspace*{-\figcapheight}%
   \vskip-\abovecaptionskip%
   \vbox to \figcapheight{{\figcaptionfont\leftskip21.5pc{\bfseries #1}\enskip #2\par}}%
   \vskip\abovecaptionskip%
  \fi%
  \IfFileExists{\@figurebox}{%
  \ifx\@figwidth\empty%
    \ifx\@figheight\@empty%
     \centerline{\includegraphics{\@figurebox}}%
     \else
     \centerline{\includegraphics[height=\@figheight]{\@figurebox}}%
     \fi%
 \else
   \ifx\@figheight\@empty
        \centerline{\includegraphics[width=\@figwidth]{\@figurebox}}%
	\else
     \centerline{\includegraphics[width=\@figwidth,height=\@figheight]{\@figurebox}}%
   \fi%
 \fi%
   }{\centerline{\vrule width9pc height10pc}}%
  \if\figtemp\flt@bottom\else%
    \vskip-\abovecaptionskip%
   \vbox to -\abovecaptionskip{{\figcaptionfont\leftskip21.5pc{\bfseries #1}\enskip #2\par}}%
  \fi%
\gdef\@figurebox{}\gdef\@figwidth{0pt}\gdef\@figheight{0pt}}
\def\adjustfigure#1{\begin{figure}\vspace*{#1}\end{figure}}
%
% FIGURE
%
\newcounter{figure}[chapter]
\def\thefigure{\thechapter.\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\ \thefigure}
%
\newenvironment{figure}
               {\let\@makecaption\make@figure@caption\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\let\@makecaption\make@figure@dblcaption\@dblfloat{figure}}
               {\end@dblfloat}
%
% TABLE
%
\newcounter{table}[chapter]
\def\thetable{\thechapter.\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\ \thetable}
%
\newenvironment{table}
               {\let\@makecaption\make@table@caption\@float{table}\begin{center}}
               {\end{center}\end@float}
\newenvironment{table*}
               {\let\@makecaption\make@table@caption\@dblfloat{table}\begin{center}}
               {\end{center}\end@dblfloat}
%
%    ****************************************
%    *                TITLE                 *
%    ****************************************
%
% TITLEPAGE
%
\def\maketitle{%
 \openin1 \jobname.ttl
 \ifeof1
  \typeout{No file \jobname.ttl.}
  \cleardoublepage
 \else
  \closein1 \relax\@@input \jobname.ttl
 \fi
 \let\maketitle\relax
}
\gdef\@title{\mbox{}}
\def\title{\@ifnextchar[ {\@titletwo}{\@titleone}}
\def\@titletwo[#1]#2{\gdef\@title{#2}\gdef\@subtitle{#1}}
\def\@titleone#1{\gdef\@title{#1}\gdef\@subtitle{}}
\def\subtitle#1{\gdef\@subtitle{#1}}
\gdef\@subtitle{}
\def\halftitle#1{\gdef\@halftitle{#1}}
\gdef\@halftitle{\@title}
%
\gdef\@author{\mbox{}}
\gdef\@shortauthor{}
\def\author{
  \@ifnextchar[{\@authortwo}{\@authorone}%
}
\def\@authortwo[#1]#2{\gdef\@author{#2}\gdef\@shortauthor{#1}%
}
\def\@authorone#1{\gdef\@author{#1}\gdef\@shortauthor{}%
}
\def\forewardauthor#1{{\itshape #1}%
    \addcontentsline{toc}{author}{#1}%
}
%
%    ****************************************
%    *            PAGE STYLES               *
%    ****************************************
%
\newcommand\copyrightline[1]{%
  \def\@copyrightline{#1}}
%
\edef\@copyrightline{\relax}
%
\newcommand\c@pyrightline[1]{%
  \gdef\@c@pyrightline{#1}}
%
\gdef\@c@pyrightline{%
  \vbox to 5.5\p@{\noindent
  \parbox[t]{\textwidth}{\normalfont\footnotesize\baselineskip 9\p@
  \@copyrightline
  }%
  \vss}%
}
% Initializes TeX's marks
%
  \def\ps@plain{\let\@mkboth=\@gobbletwo
    \def\@oddfoot {\dropfoliofont\rm\hfill\thepage\hfill}
    \def\@evenfoot{\dropfoliofont\rm\hfill\thepage\hfill}
    \def\@oddhead {}
    \def\@evenhead{}}
%
% Definition of 'headings' page style
%
\def\ps@headings{%
 \let\@mkboth=\markboth
 \def\@oddfoot {}
 \def\@evenfoot{}
   \def\@oddhead {\runningheadfont
                   \hfil \rightmark\hbox to 30pt{\hfil\rm\thepage}}
   \def\@evenhead{\runningheadfont
                  \hbox to 30pt{\rm \thepage}%
                  \leftmark \hfill}
  \def\chaptermark##1{\markboth{}{##1}}
}
%
\newcommand\contentsname{Contents}
\newcommand\listfigurename{Illustrations}
\newcommand\listtablename{Tables}
\newcommand\listcontribname{List of Contributors}
\newcommand\bibname{Bibliography}
\newcommand\refname{References}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\lspartname{P\ls a\ls r\ls t}% letterspaced version
\newcommand\chaptername{Chapter}
\newcommand\appendixname{Appendix}
%
%    ****************************************
%    *            MATH                      *
%    ****************************************
%
\newdimen\mathindent
\mathindent0pt%
\@addtoreset{equation}{chapter}
\def\theequation{\thechapter.\arabic{equation}}
%
\renewcommand{\[}{\relax
                 \ifmmode\@badmath
                 \else
                  \topsep\abovedisplayskip
                   \begin{trivlist}%
                     \@beginparpenalty\predisplaypenalty
                     \@endparpenalty\postdisplaypenalty
                     \item[]\leavevmode
                     \hbox to\linewidth\bgroup $\m@th\displaystyle %$
                       \hskip\mathindent\bgroup
                 \fi}
\renewcommand{\]}{\relax
                 \ifmmode
                       \egroup $\hfil% $
                     \egroup
                   \end{trivlist}%
                 \else \@badmath
                 \fi}
\renewenvironment{equation}%
    {\@beginparpenalty\predisplaypenalty
     \@endparpenalty\postdisplaypenalty
     \refstepcounter{equation}%
       \topsep\abovedisplayskip
      \trivlist\item[]\leavevmode
       \hbox to\linewidth\bgroup $\m@th% $
         \displaystyle
         \hskip\mathindent}%
        {$\hfil % $
         \displaywidth\linewidth\hbox{\@eqnnum}%
       \egroup
     \endtrivlist}

\renewenvironment{eqnarray}{%
    \stepcounter{equation}%
    \def\@currentlabel{\p@equation\theequation}%
    \global\@eqnswtrue\m@th
    \global\@eqcnt\z@
    \tabskip\mathindent
    \let\\=\@eqncr
    \ifvmode
      \addtolength\abovedisplayskip{\partopsep}%
    \fi
    \setlength\belowdisplayskip{\abovedisplayskip}%
    \setlength\belowdisplayshortskip{\abovedisplayskip}%
    \setlength\abovedisplayshortskip{\abovedisplayskip}%
    $$\everycr{}\halign to\linewidth% $$
    \bgroup
      \hskip\@centering
      $\displaystyle\tabskip\z@skip{##}$\@eqnsel&%
      \global\@eqcnt\@ne \hskip \tw@\arraycolsep \hfil${##}$\hfil&%
      \global\@eqcnt\tw@ \hskip \tw@\arraycolsep
        $\displaystyle{##}$\hfil \tabskip\@centering&%
      \global\@eqcnt\thr@@
        \hbox to \z@\bgroup\hss##\egroup\tabskip\z@skip\cr}%
      {\@@eqncr
    \egroup
    \global\advance\c@equation\m@ne$$% $$
    \global\@ignoretrue
    }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  End Math %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    ****************************************
%    *            CUP SPECIALS              *
%    ****************************************
%
% redefinition of \cleardoublepage to get blank empty pages
%
\def\cleardoublepage{\clearpage
 \if@twoside
  \ifodd\c@page
   \else
    \thispagestyle{empty}
    \mbox{}\newpage
    \if@twocolumn
      \hbox{}\newpage
    \fi
  \fi
 \fi
}
%
% redefinition of sections to get en space after chapter number
%
\def\@sect#1#2#3#4#5#6[#7]#8{%
 \ifnum #2>\c@secnumdepth % LEVEL -- is heading to be numbered?
  \def\@svsec{}%
 \else
  \refstepcounter{#1}
  \edef\@svsec{\csname the#1\endcsname\hskip 0.5em}
 \fi
 \@tempskipa #5\relax % AFTERSKIP (-ve indicates a run-in heading)
 \ifdim \@tempskipa>\z@
  \begingroup #6\relax
   \noindent{\hskip #3\relax\@svsec}{\interlinepenalty \@M #8\par}
  \endgroup
  \csname #1mark\endcsname{#7}%
  \addcontentsline{toc}{#1}{\ifnum #2>\c@secnumdepth \else
   \protect\numberline{\csname the#1\endcsname}\fi #7}
 \else
  \def\@svsechd{#6\hskip #3\@svsec #8%
   \csname #1mark\endcsname{#7}%
   \addcontentsline{toc}{#1}{\ifnum #2>\c@secnumdepth \else
    \protect\numberline{\csname the#1\endcsname}\fi#7}}%
 \fi
 \@xsect{#5}}
%
% ABSTRACT
%
\newenvironment{abstract}{\section*{Abstract}\trivlist\item[]%
 }{\endtrivlist\addvspace{13\p@}}
%
% Extract
%
\newenvironment{extract}{\par\addvspace{.7\baselineskip plus 1pt}\bgroup\extractfont%
\noindent\ignorespaces}{\par\egroup\addvspace{.5\baselineskip plus 1pt}}
%
%Source
\def\source#1{\par\rightline{#1}}
%
% series page
%
\def\seriesfont{\fontsize{10}{11}\leftskip69pt plus1fill\rightskip\leftskip\selectfont}
\def\serieseditor#1{{\fontsize{9.5}{11.5}\leftskip69pt plus1fill\rightskip\leftskip\selectfont #1\par\vskip17.5pt}}
\newenvironment{seriespage}{\clearpage\par\begingroup\seriesfont%
\thispagestyle{empty}
\def\@enumerateone{\normalsize%
 \list{\csname label\@enumctr\endcsname}%
  {\usecounter{\@enumctr}%%
                           \leftmargin 0.5em% width of a digit
                           \advance\leftmargin\labelsep
   \let\makelabel\makeRRlabel}\leftskip69pt\rightskip69pt}
}{\par\endgroup\clearpage}
%
%HT page
%
\def\htfont{\fontsize{10}{13}\leftskip69pt\rightskip\leftskip\selectfont}
\def\httitle#1{{\fontsize{14}{16}\leftskip69pt plus1fill\rightskip\leftskip\bfseries\selectfont\noindent#1\par\vskip7pt}}
\def\htsubtitle#1{{\fontsize{12}{14}\leftskip69pt plus1fill\rightskip\leftskip\selectfont \noindent#1\par\vskip23pt}}
\def\htauthor#1{\noindent{\spreadout{\scshape #1}}}
\newenvironment{htpage}%
{\cleardoublepage\par\htfont\vspace*{-16pt}%
  \def\spreadoutfactor{.1}\thispagestyle{empty}%
  \let\title\httitle%
  \let\subtitle\htsubtitle%
  \let\author\htauthor
  \parindent1em}%
{\clearpage}%
%
%Title page
%
\def\booktitle#1{{\def\spreadoutfactor{3}\fontsize{30}{34}\selectfont\spreadout{#1}\par}}
\def\booksubtitle#1{{\fontsize{18}{36}\selectfont#1\par}}
\def\editortag#1{\fontsize{10}{60}\selectfont #1\par}
\def\bookauthor#1{{\fontsize{11}{24}\selectfont\spreadout{#1}\par}}
\def\bookaffil#1{{\fontsize{8}{14}\selectfont\itshape #1\par}}
\newenvironment{titlepage}%
{\cleardoublepage\vbox to \textheight\bgroup\par\vskip19pt\parskip\z@\centering%
	\let\title\booktitle%
	\let\subtitle\booksubtitle%
	\let\author\bookauthor%
	\let\affil\bookaffil
	\thispagestyle{empty}}%
{\vfill
\centerline{\includegraphics[width=44mm]{camlogo.eps}}\vspace*{11.5pt}%
\egroup\clearpage}%
%
% Copyright Page
%
\def\dsctext#1{%
  \vfill%
  \vrule height.5pt width\textwidth depth0pt\par\vskip-10.3pt%
   #1\par\vskip-15pt%
 \vrule height.5pt width\textwidth depth0pt\par%
}
%
\def\pressname#1{\def\spreadoutfactor{.75}%
{\def\spreadoutfactor{.75}\scshape{\spreadout{#1}}}}
%
\newenvironment{imprintpage}{\thispagestyle{empty}%
\clearpage
\vbox to \textheight\bgroup
\vskip-8.2pt\fontsize{8}{11}\selectfont\parindent\z@\parskip\baselineskip%
\centering}{\egroup\clearpage}
%
% Photo gallary
%
\newcount\tempcount
\newcount\calccount
\newcount\photocount
\newcount\printphotocount
\def\photogallery#1#2{%
\global\advance\photocount\@ne
\expandafter\gdef\csname photoname\romannumeral\photocount\endcsname{#1}%
\expandafter\gdef\csname photofig\romannumeral\photocount\endcsname{#2}%
}%
%
\def\printphotogallery{%
\@input{\jobname.pic}%
\onecolumn%%
  \tabcolsep8pt%
  \printphotocount\photocount%
  \tempcount=\z@%
  \chapter*{PHOTO GALLERY}%
  \vspace*{-3\baselineskip}%
  \begingroup%
  \loop%
  \ifnum\printphotocount>0%
  \calccount\printphotocount%
  \advance\calccount-4%
  \global\advance\printphotocount-4%
      \centering\@whilenum\photocount>\calccount%
    \do{%
       \ifnum\photocount>0%
       \begin{tabular}{c}%
       \global\advance\tempcount\@ne%
       \edef\temp{\csname photofig\romannumeral\tempcount\endcsname}%
       \IfFileExists{\temp}{\includegraphics[width=9pc]{\temp}}{\vrule width9pc height10pc}\\ \\[-7pt]%
       \reset@font\csname photoname\romannumeral\tempcount\endcsname%
       \end{tabular}%
        \fi%
       \global\advance\photocount\m@ne%
    }%
  \\[1.5\baselineskip]%
\repeat%
\endgroup%
}%
%
% acknowledgement
\newenvironment{acknowledgment}{\global\@mainmattertrue\let\author\acknowauthor}{}
\def\acknowauthor#1{\vskip\baselineskip{\parindent0pt\itshape#1\par}}%
%
\newenvironment{foreword}{\let\author\forewardauthor}{}
%
%    ****************************************
%    *           INITIALIZATION             *
%    ****************************************
%
% Default initializations
%
\pagestyle{headings}%\fi
\pagenumbering{arabic}
\onecolumn
\flushbottom
\frenchspacing

\endinput

