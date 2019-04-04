\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{template/lnucmthesis}[2018/04/27]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions
\LoadClass[11pt,a4paper,twoside]{report}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define all the pieces that go on the title page.
%
% \title and \author already defined

\def\documenttype#1{\gdef\@documenttype{#1}}
\def\subtitle#1{\gdef\@subtitle{#1}}
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\examiner#1{\gdef\@examiner{#1}}
\def\semester#1{\gdef\@semester{#1}}
\def\subject#1{\gdef\@subject{#1}}
\def\level#1{\gdef\@level{#1}}
\def\coursecode#1{\gdef\@coursecode{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Packages.
%

\usepackage[utf8]{inputenc} % Load early, required for inputting international characters.
\usepackage[T1]{fontenc}    % Load early, output font encoding for international characters.
\usepackage[english]{babel}

\usepackage{appendix}
% \newcounter{apppage}
\usepackage{background}
\usepackage{csquotes}
\usepackage{fancyhdr}
\usepackage[
  top=3cm, bottom=3cm, left=4cm, right=4cm,
  footskip=2cm
%  top=4cm, bottom=3.8cm, left=4.85cm, right=3cm,
%  headheight=3cm,headsep=24pt,footskip=2.8cm
%  ,showframe,showcrop
  ]{geometry}
\usepackage{graphicx}
\usepackage{import}
% \usepackage{lastpage}
\usepackage[parfill]{parskip}
\usepackage{tikz}
\usepackage{times}
\usepackage{tocloft}
\usepackage{todonotes}
\usepackage{titlesec}
\usepackage{titletoc}
\usepackage[absolute]{textpos}
\usepackage{tocbibind}
\usepackage[strings]{underscore}

\usepackage{lipsum}
% \usepackage{showframe}
% \usepackage[absolute,showboxes]{textpos}
% \usepackage{ulem}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% frontmatter, mainmatter, backmatter
%
\newcommand\frontmatter{%
  \cleardoublepage
  %\@mainmatterfalse
  \pagenumbering{roman}
%  \renewcommand\thechapter{}
}

\newcommand\mainmatter{%
  \cleardoublepage
 % \@mainmattertrue
  \pagenumbering{arabic}
  \setcounter{page}{1}
%  \renewcommand\thechapter{\Arabic{chapter}}
}

\newcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
 % \@mainmatterfalse
%   \renewcommand\thechapter{\Alph{chapter}}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Header and footer.
%

\pagestyle{fancy}                     % Change page style to fancy.
\fancyhf{}                            % Clear header/footer.
% \rfoot{\thepage(\pageref{lastpage})}  % Right footer page number.
\cfoot{\thepage}                      % Center footer page number.

\backgroundsetup{
   scale=1,
   angle=0,
   opacity=1,
   color=black,
   contents={\begin{tikzpicture}[remember picture, overlay]
      \node[anchor=north west,
%            xshift=4.85cm,
            xshift=4cm,
            yshift=-1cm]
            at (current page.north west)
            {\includegraphics[height=1cm]{template/lnu_wordmark_sweden_eng_cmyk.eps}};%
      \node[anchor=north west,
            xshift=1cm,
            yshift=-1cm]
            at (current page.north west)
            {\includegraphics[height=1cm]{template/lnu_symbol_cmyk.eps}};
     \end{tikzpicture}}
 }

\renewcommand{\headrulewidth}{0pt}    % Hide the head rule.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Headings.
%

\titleformat{\chapter}{\normalfont\bfseries\fontsize{17}{20}\selectfont}{\thechapter}{1em}{}
\titleformat{\section}{\normalfont\bfseries\fontsize{13}{15}\selectfont}{\thesection}{1em}{}
\titleformat{\subsection}{\normalfont\bfseries\fontsize{11}{13}\selectfont}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\normalfont\it\fontsize{11}{13}\selectfont}{\thesubsection}{1em}{}
\titleformat{\bibliography}{\normalfont\bfseries\fontsize{17}{20}\selectfont}{\thebibliography}{1em}{}

\titlespacing*{\chapter}{0pt}{-26pt}{0pt} % 50 - 24 (headsep?)
\titlespacing*{\section} {0pt}{12pt}{0pt}
\titlespacing*{\subsection} {0pt}{12pt}{0pt}
\titlespacing*{\subsubsection} {0pt}{12pt}{0pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Redefine '\maketitle'
%

\def\maketitle{\begin{titlepage}

\backgroundsetup{
   scale=1,
   angle=0,
   opacity=1,
   color=black,
   contents={\begin{tikzpicture}[remember picture, overlay]
%      \draw (-5.85,9.25) -- (-5.85,13.85);
      \draw (-6.65,9.25) -- (-6.65,13.85);
      \node[anchor=north west,
%             xshift=4.85cm,
            xshift=4cm,
            yshift=-1cm]
            at (current page.north west)
            {\includegraphics[height=1cm]{template/lnu_wordmark_sweden_eng_cmyk.eps}};
      \node[anchor=north west,
            xshift=1cm,
            yshift=-1cm]
            at (current page.north west)
            {\includegraphics[height=1cm]{template/lnu_symbol_cmyk.eps}};
      \node[anchor=north west,
            xshift=-3.98cm,
            yshift=-15.6cm]
            at (current page.north west)
            {\includegraphics[width=15.05cm]{template/copperplate.png}};
     \end{tikzpicture}}
 }

\null

% \begin{textblock*}{13cm}[0,1](4.85cm,5.95cm)
\begin{textblock*}{13cm}[0,1](4cm,5.95cm)
  \normalfont\fontsize{22pt}{29pt}\selectfont
  \@documenttype
  \vspace{6pt}
\end{textblock*}

% \begin{textblock*}{13cm}[0,0](4.85cm,5.95cm)
\begin{textblock*}{13cm}[0,0](4cm,5.95cm)
  \normalfont\fontsize{30pt}{36pt}\selectfont
  \vspace{72pt}
  \@title\\
  \normalfont\fontsize{18pt}{22pt}\selectfont
  \it \@subtitle\\
\end{textblock*}

\begin{textblock*}{0cm}[0,0](12.62cm,25,92cm)
  \vrule width .4pt height 3.2cm
\end{textblock*}

\newlength{\savetextblock}
\newlength{\heighttextblock}

\begin{textblock*}{7.44cm}[0,0](12.82cm,25,92cm)
  \normalfont
  \emph{Authors:} \@author\\
  \emph{Supervisor:} \@supervisor\\
  \emph{Examiner:} \@examiner\\
  \emph{Semester:} \@semester\\
  \emph{Subject:} \@subject\\
  \emph{Level:} \@level\\
  \emph{Course code:} \@coursecode
\end{textblock*}

\end{titlepage}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Add abstract to ToC and redefine '\abstractname'.
%

\patchcmd{\abstract}{\titlepage}{\titlepage% Insert ToC-writing after starting a titlepage
  \addcontentsline{toc}{chapter}{Abstract}}{}{}

\addto{\captionsenglish}{%
  \renewcommand{\abstractname}{\raggedright\normalfont\bfseries\fontsize{17}{20}\selectfont Abstract}}
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  \keywords
%

% \newcommand{\keywords}[1]{\textbf\textit{Keywords: #1} \par}
\newenvironment{keywords}{\noindent\textbf{Keywords: }}{\par}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Section numbering & table of contents
%

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}

\renewcommand{\cfttoctitlefont}{\bfseries\fontsize{17}{20}\selectfont}
\setlength\cftbeforetoctitleskip{-13pt}
\setlength{\cftaftertoctitleskip}{6pt}

\titlecontents{chapter}[0cm]
  {\normalsize\bfseries\addvspace{6pt}}
  {\thecontentslabel\hspace{0.78cm}}
  {}
  {\titlerule[0pc]{}\contentspage}
  
\titlecontents{section}[0.39cm]
  {\normalsize\itshape}
  {\thecontentslabel\hspace{0.78cm}}
  {}
  {\titlerule[0pc]{}\contentspage}
  
\titlecontents{subsection}[0.78cm]
  {\normalsize}
  {\thecontentslabel\hspace{0.78cm}}
  {}
  {\titlerule[0pc]{}\contentspage}

\addto{\captionsenglish}{%
 \renewcommand{\listfigurename}{List of figures}}
\renewcommand{\cftloftitlefont}{\bfseries\fontsize{17}{20}\selectfont}
\setlength\cftbeforeloftitleskip{-13pt}
\setlength{\cftafterloftitleskip}{6pt}

\addto{\captionsenglish}{%
 \renewcommand{\listtablename}{List of tables}}
\renewcommand{\cftlottitlefont}{\bfseries\fontsize{17}{20}\selectfont}
\setlength\cftbeforelottitleskip{-13pt}
\setlength{\cftafterlottitleskip}{6pt}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Redefine '\chapter'.
%

% \def\chapter{\cleardoublepage	% Starts new page.
%    \thispagestyle{fancy}	    % Page style of chapter page is 'fancy'
%    \global\@topnum\z@		    % Prevents figures from going at top of page.
%    \@afterindentfalse		    % Suppresses indent in first paragraph.  Change
%    \secdef\@chapter\@schapter}	% to \@afterindenttrue to have indent.
   
% Redefine '/chapter' to always start on an odd page.
% Should make no difference in singleside mode.
%
% \if@leftblank
% Prints "THIS PAGE INTENTIONALLY LEFT BLANK" on blank pages.
\def\chapter{\clearpage\ifodd\c@page\else
   \hbox{}\par\vfill\centerline%
   {(THIS PAGE INTENTIONALLY LEFT BLANK)}%
   \vfill\newpage\fi
   \thispagestyle{fancy}	% Page style of chapter page is 'plain'
   \global\@topnum\z@		% Prevents figures from going at top of page.
   \@afterindentfalse		% Suppresses indent in first paragraph.  Change
   \secdef\@chapter\@schapter}	% to \@afterindenttrue to have indent.
% \else
% \def\chapter{\cleardoublepage	% Starts new page.
%    \thispagestyle{plain}	% Page style of chapter page is 'plain'
%    \global\@topnum\z@		% Prevents figures from going at top of page.
%    \@afterindentfalse		% Suppresses indent in first paragraph.  Change
%    \secdef\@chapter\@schapter}	% to \@afterindenttrue to have indent.
% \fi
  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% \appendixpagenumbering
%

% \newcommand{\appendixpagenumbering}{
%   \break
%   \pagenumbering{arabic}
%   \renewcommand{\thepage}{\thesection\arabic{page}}
% }  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Redefine '\bibname'
%

\addto{\captionsenglish}{%
  \renewcommand{\bibname}{References}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Redefine '\@makefnmark' (footnote mark)
%

\renewcommand{\@makefnmark}{%
  \mbox{\textsuperscript{\tiny\@thefnmark}}}
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Redefine '\labelitemi' (itemize bullet)
%

\renewcommand\labelitemi{\small\textbullet}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Redefine '\textit' (italic)
%

\let\oldtextit\textit
\DeclareTextFontCommand{\textit}{\normalsize\normalfont\itshape\selectfont}

\renewcommand\appendixname{New Name}
% \AtBeginDocument{\renewcommand\appendixname{New Name}}