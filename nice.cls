\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nice}[]

% option foot # side
% option numdepth : depth of section numbering
%          casual : numdepth = -3 : rien numéroté, ni les figures et les sections
%        tocdepth
%    bibliography

\LoadClassWithOptions{article}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[tabular]{ebgaramond}
\RequirePackage{ebgaramond-maths}
\RequirePackage[
	defaultmono,
	scale=.77
]{droidsansmono}
\RequirePackage[]{microtype}
\RequirePackage[]{graphicx}
\RequirePackage[]{mwe}
\RequirePackage{booktabs}
\RequirePackage{csquotes}
\RequirePackage{graphicx}
\RequirePackage[
	autocite = superscript,
	backend = biber,
	% citecolor = niceBlue,
	style = chicago-authordate,
	sorting = anyt,
	texencoding = ascii,
    bibencoding = utf8,
]{biblatex}
\renewcommand{\cite}[1]{\footnote{\fullcite{#1}.}}
\newcommand\sidetextcite[2][]{\sidetext{\tl_if_empty:nTF{#1}{}{\vskip #1}%
\@for\cle:={#2}\do{\makebox[0pt][r]{\autocite{\cle}}\fullcite{\cle}.\\}%
}}

\DeclareCiteCommand{\fullcite}
  {\usebibmacro{prenote}}
  {\clearfield{url}%
   \clearfield{pagetotal}%
   \clearfield{edition}%
   \usedriver
     {\DeclareNameAlias{sortname}{default}}
     {\thefield{entrytype}}}
  {\multicitedelim}
  {\usebibmacro{postnote}}

\RequirePackage{emptypage}
\RequirePackage{lettrine}
\RequirePackage[]{setspace}
\AtBeginDocument{%
    \setstretch{1.12}
}
\RequirePackage[]{fancyhdr}
\RequirePackage[]{textcase}
\fancyhf{}
\fancypagestyle{plain}{
    \fancyhf{}
    \fancyhead[LE]{\thepage}
    \fancyhead[RO]{\thepage}
}
\fancyhf{}
\pagestyle{fancy}
\fancyhead[LE]{\thepage~~$\cdot$~~\scshape\lsstyle  \nouppercase{\MakeTextLowercase{\leftmark}}}
\fancyhead[RO]{\scshape\lsstyle \nouppercase{\MakeTextLowercase{\rightmark}}~~$\cdot$~~\thepage}
\renewcommand{\headrulewidth}{0pt}
\setlength{\headheight}{13.6pt}

\RequirePackage[
    perpage,
    symbol*,
    flushmargin,
    side,
    ragged,
]{footmisc}
\makeatletter
  \renewcommand\@makefnmark{%
    \hbox{%
      \ifx\@fnsymbol\FN@fnsymbol@sym
        \expandafter\@firstofone
      \else
        \expandafter\@textsuperscript
      \fi
      {\normalfont\@thefnmark}%
    }%
  }
\makeatother

\RequirePackage{sidenotes}

\RequirePackage{titlesec}
\titleformat{\section}[block]
	{\thispagestyle{plain}}
	{\huge\thesection}
	{1em}
	{\huge}[]
\titleformat{\subsection}[display]
	{}
	{\itshape\Large\thesubsection}
	{1em}
	{\Large\itshape}[]
\titleformat{\subsubsection}[runin]
	{}
	{\itshape\thesubsubsection}
	{1ex}
	{\itshape}[~~$\cdot$]

\RequirePackage{titletoc}
\contentsmargin{0pt}
\titlecontents{section}[0em]
	{\Large\vspace{16pt}}
	{\makebox[-1em][l]{\thecontentslabel}\hspace{2.5em}}
	{\Large}
	{~~~$\cdot$~~~\contentspage}[]
\titlecontents{subsection}[0em]
	{\hspace{2em}}
	{\makebox[-1em][l]{\thecontentslabel}\hspace{2.5em}}
	{}
	{~~$\cdot$~~\contentspage}
	[]
\titlecontents{subsubsection}[0em]
	{}
	{}
	{}
	{}
	[]

\RequirePackage[
    hidelinks,
    final,
    breaklinks,
    bookmarks,
]{hyperref}

\makeatletter
\def\author#1{\gdef\insertauthor{#1}\gdef\@author{#1}\hypersetup{pdfauthor={#1}}}
\def\title#1{\gdef\inserttitle{#1}\gdef\@title{#1}\hypersetup{pdftitle={#1}}}
\def\firstsupervisor#1{\gdef\insertsupervisor{#1}}
\def\secondsupervisor#1{\gdef\insertsupervisor{#1}}
\def\institution#1{\gdef\insertinstitution{#1}}
\def\degree#1{\gdef\insertdegree{#1}}
\def\faculty#1{\gdef\insertfaculty{#1}}
\def\department#1{\gdef\insertdepartment{#1}}
\def\submitdate#1{\gdef\insertsubmitdate{#1}}
\def\keywords#1{\gdef\insertkeywords{#1}\hypersetup{pdfkeywords={#1}}}
\submitdate{\number\the\year}
\makeatother

\makeatletter
\newcommand\@maketitlebis{%
	\hfill
	\begin{quote}
    \setstretch{1.0}
		\vskip -40pt
		\let\footnote\thanks
		{\huge\raggedright \@title \par }
		\vskip 10pt
		{\large \itshape \@author{}~~$\cdot$~~\@date}
		\vskip 60pt~
	\end{quote}
	\setstretch{1.12}
}
\renewcommand\maketitle{
	\@maketitlebis
	\thispagestyle{empty}
}
\makeatother

\RequirePackage[hypcap=false]{caption}
\captionsetup{
    labelformat=empty,
    labelfont=it, textfont=it,
	%labelformat = lc,
	justification=RaggedRight,
	font={footnotesize, stretch=1},
	singlelinecheck=on,
}

\DeclareCaptionStyle{sidecaption}{
    labelformat=empty,
    labelfont=it, textfont=it,
	%labelformat = lc,
	justification=RaggedRight,
	font={footnotesize, stretch=1},
	singlelinecheck=on,
}


\setcounter{secnumdepth}{0}
\setcounter{tocdepth}{2}
\AtBeginDocument{\setlength{\parskip}{0pt}}

\AddToHook{cmd/section/before}{\clearpage}