% Modified from suthesis document class for LaTeX version 2e - 20/06/2003
%%% ====================================================================
%%% @LaTeX-class-file{
%%% filename    = "PPGM-UEFS.cls",
%%% version     = "1.0.0",
%%% date        = "24 Abril 2018",
%%% portedby    = "Gilney Zebende",
%%% address     = "Programa de Pós-graduação em Modelagem em Ciências da Terra e do Ambiente
%%%                Avenida Transnordestina, s/n, Bairro Novo Horizonte
%%%                Feira de Santana, Bahia - Brasil",
%%% telephone   = "+55 (75) 3161-8807",
%%% email       = "gfzebende@pq.cnpq.br",
%%% codetable   = "ISO/ASCII",
%%% keywords    = "LaTeX, Programa de P\Žos-gradua\c{c}\~ao, PPGM UEFS, Disserta\c{c}\~ao, Tese",
%%% supported   = "Sei n\~ao...",
%%% copyright©  = "Israel Vieira, All Rights Unreserved
%%%                Premission is granted to use, modify and distribute
%%%                this package under the terms and conditions of
%%%                the GNU software licence",
%%%
%%% docstring   = "This file is the main file for the ustheseis document
%%%                class, which defines the guidelines for a PhD thesis
%%%                at the University of Southampton as by 20/06/2003.
%%%
%%%                WARNING: There is not warranty for the program, either
%%%                expressed or implied, including, but not limited to,
%%%                the implied warranties of merchantability and fitness
%%%                for a particular purpose and noninfrigement of third
%%%                party rights. The entire risk as to the quality and
%%%                performance of the program is with you. Should the
%%%                program prove defective, you assume the cost of all
%%%                necessary servicing, repair or correction".
%%%  }
%======================== initial code ==================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{PPGM-UEFS}[2018/04/24 v1.0.0]
\typeout{---------------------------------------------------------}
\typeout{Esta classe LaTeX está de acordo com os requerimentos do }
\typeout{programa de pós-graduação para a submissão de uma disser-}
\typeout{tação de mestrado ou tese de doutorado ao PPGM-UEFS      }
\typeout{implementada inicialmente por Israel Vieira para atender }
\typeout{os requisitos da University of Southampton e, posterior- }
\typeout{mente, modificada por Hernane Pereira.                   }
\typeout{---------------------------------------------------------}

%------------------------------------------------------------------------
%Define extra packages required by PPGM-UEFS class
%------------------------------------------------------------------------
\RequirePackage{ifthen}
\RequirePackage{setspace}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{eucal}
\RequirePackage{graphics}
\RequirePackage{fancyhdr}
\RequirePackage{ifpdf} 

%------------------------------------------------------------------------
%Define the document output format
%------------------------------------------------------------------------
\newif \ifpdf
    \ifx \pdfoutput \undefined
        \pdffalse   % for running latex
   \else
        % for running pdflatex
        \pdfoutput = 1 % positive value for a PDF output, otherwise a DVI
        \pdftrue
\fi

%==============================================================================
%%% ABNTeX ...
%\usepackage{abnt-alf}
%\usepackage[alf,abnt-repeated-title-omit=yes,abnt-show-options=warn,abnt-verbatim-entry=yes]{abntcite}
%\RequirePackage[alf,abnt-emphasize=bf,abnt-etal-list=0,abnt-etal-text=it]{abntcite}
% http://abntex.codigolivre.org.br/node7.html#instalacao
%==============================================================================

%------------------------------------------------------------------------
%Define the thesis style: report or book
%Usage:
%           1 - default (report) =  \documentclass{PPGM-UEFS}
%           2 - book             =  \documentclass[usbook]{PPGM-UEFS}
%           3 - report           =  \documentclass[usreport]{PPGM-UEFS}
%
%Options:
%
%
%------------------------------------------------------------------------


%------------------------------------------------------------------------
% PPGM-UEFS class options definitions
%------------------------------------------------------------------------
%Variable to hold the selected document class
\newboolean{su@sureport} \setboolean{su@sureport}{true}
\newboolean{su@subook} \setboolean{su@subook}{false}

%Variable to hold the selected page and chapter heardings
\newboolean{su@fancyhead} \setboolean{su@fancyhead}{false}
\newboolean{su@fancychap} \setboolean{su@fancychap}{false}

%document class style
\DeclareOption{sureport}{
    \setboolean{su@sureport}{true}
    \setboolean{su@subook}{false}
    }

\DeclareOption{subook}{
    \setboolean{su@sureport}{false}
    \setboolean{su@subook}{true}
    }

%Page headings style
\DeclareOption{fancyheadings}{\setboolean{su@fancyhead}{true}}

%The chapter headings style
\DeclareOption{fancychapter}{\setboolean{su@fancychap}{true}}

% Fix for AMSBook
\@ifundefined{@chapapp}{\let\@chapapp\chaptername}{}

\ProcessOptions\relax

%------------------------------------------------------------------------
% DOCUMENT CLASS
%------------------------------------------------------------------------
\typeout{---------------------------------------------------------}
\ifsu@sureport
    \typeout{PPGM-UEFS usará a classe de documento -> report.}
    \ifx\pdfoutput\undefined
        \typeout{PPGM-UEFS gerará um arquivo DVI.}
        \LoadClass[11pt, a4paper, oneside]{report}
    \else
        \typeout{PPGM-UEFS gerará um arquivo PDF.}
             \LoadClass[pdftex, 11pt, a4paper, oneside]{report}
    \fi
    \DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\else
    \typeout{PPGM-UEFS usará a classe de documento -> book.}
    \ifx\pdfoutput\undefined
        \typeout{PPGM-UEFS gerará um arquivo DVI.}
        \LoadClass[11pt, a4paper, oneside]{book}
    \else
             % ALTEREI O TAMANHO PARA 12PT
        \typeout{PPGM-UEFS gerará um arquivo PDF.}
        \LoadClass[pdftex, 12pt, a4paper, oneside]{book}
    \fi
    \DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\fi
\typeout{---------------------------------------------------------}%

\ProcessOptions\relax

%------------------------------------------------------------------------
% DOCUMENT OPTIONS
%------------------------------------------------------------------------
% Define the figures type, location, packages and hyperref options

\ifpdf
   % Define PDF options
   \usepackage[ pdftex,
                pdfstartview = FitH,
                 pdfpagelayout = useoutlines,
                 bookmarks,
                 bookmarksopen = true,
                 bookmarksnumbered = true,
                 breaklinks = true,
                 linktocpage,
                 backref,
                 colorlinks = false,
                 linkcolor = blue,
                 urlcolor  = blue,
                 citecolor = blue,
                 anchorcolor = green,
                 hyperindex = true]{hyperref}
    \DeclareGraphicsExtensions{.png, .jpg, .mps, .pdf}
    \usepackage[pdftex]{graphicx}
    \pdfcompresslevel=9
    \graphicspath{{Figures/PNG/}{Figures/JPG/}{Figures/MPS/}{Figures/PDF/}{Figures/}{Tables/}}
\else
    %Define DVI options
    \usepackage[ bookmarks,
                 bookmarksopen = true,
                 bookmarksnumbered = true,
                 breaklinks = true,
                 linktocpage,
                 backref,
                 colorlinks = false,
                 linkcolor = blue,
                 urlcolor  = blue,
                 citecolor = blue,
                 anchorcolor = green,
                 hyperindex = true]{hyperref}
    \DeclareGraphicsExtensions{.eps, .ps}
    \usepackage{graphicx}
    \graphicspath{{Figures/EPS/}{Figures/PS/}{Figures/}}
\fi

%------------------------------------------------------------------------
% PAPER SIZE AND MARGINS
%------------------------------------------------------------------------
%
% Define the paper margins for A4 paper 210x297mm
% Margins are 15mm (44pt) all around, except 40mm (114pt) at the binding

% New margins definition   
\newdimen\rightmargin 
\newdimen\botmargin

% undo primitive default margins
%\voffset -1in
%\hoffset -1in
%\topskip 0in

% Top margin and headings
\topmargin = 15mm
\headheight = 12pt 
\headsep = 20pt  

% Bottom margin and headings
\footnotesep = 3pt  
\footskip = 30pt  
\botmargin = 15mm   

%\textheight = \paperheight
%    \advance\textheight by-\topmargin
%    \advance\textheight by-\headheight
%    \advance\textheight by-\headsep
%    \advance\textheight by-\footnotesep
%    \advance\textheight by-\footskip
%    \advance\textheight by-\botmargin

% left margins for odd and even pages (binding margin
\oddsidemargin = 40mm   
\evensidemargin = 40mm  

% Right margins and margin notes
\rightmargin = 10mm
\marginparwidth=0pt
\marginparsep = 0pt

\textwidth = \paperwidth
    \advance\textwidth by-\oddsidemargin
    \advance\textwidth by-\marginparwidth
    \advance\textwidth by-\marginparsep
    \advance\textwidth by-\rightmargin

%------------------------------------------------------------------------
% CONFIGURATIONS
%------------------------------------------------------------------------
%Define the document default font family
\fontfamily{cmr}

\usepackage[english, brazil]{babel}   % acentos
\selectlanguage{brazil}   % Portugues

%Change bibliography name to references for Report document class
\renewcommand{\bibname}{Referências}

\usepackage{ragged2e}

%Define the default paragraph format
\onehalfspacing
\parindent 0.0\p@
%\raggedright
\mdseries

%Define the default page number format
\pagenumbering{arabic}


%------------------------------------------------------------------------
% PAGE STYLE AND HEADINGS
%------------------------------------------------------------------------
\ifsu@fancyhead
    \pagestyle{fancy}
    \rhead{\small\mdseries\rightmark}
    \lhead{\small\mdseries\leftmark}
    \renewcommand{\headrulewidth}{0.3pt} 
    \renewcommand{\footrulewidth}{0.3pt}
    \renewcommand{\chaptermark}[1]{\markboth{\chaptername \thechapterwords\ }{}}
    \renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}}
\else
    \pagestyle{plain}
    \rhead{}
    \lhead{}
\fi

%Add/remove lines in page headings.
%Enter a vluae of {0pt} to remove lines
\newcommand{\footlinewidth}[1]{\renewcommand{\footrulewidth}{#1}}
\newcommand{\headlinewidth}[1]{\renewcommand{\headrulewidth}{#1}}
\newcommand{\headingslinewidth}[1]{
    \renewcommand{\headrulewidth}{#1}
    \renewcommand{\footrulewidth}{#1}
}
%Head and foot lines without text
\newcommand{\headingslinesonly}{
   \rhead{}
   \lhead{}
}


%------------------------------------------------------------------------
% CHAPTERS HEADINGS
%------------------------------------------------------------------------
\newcommand{\thechapterwords}{
    \ifsu@appending
        \thechapter
    \else
        \ifcase\thechapter\or Um\or Dois\or Tr\^es\or Quatro\or Cinco\or Seis\or
                           Sete\or Oito\or Nove\or Dez\or Onze\or
                           Doze\or Treze\or Quatorze\or Quinze\or
                           Dezesseis\or Dezessete\or Dezoito\or Dezenove\or
                           Vinte\or Vinte e um\or Vinte e dois\or Vinte e tr\^es\or
                           Vinte e quatro\or Vinte e cinco\or Vinte e seis\or
                           Vinte e sete\or Vinte e oito\or Vinte e nove\or
                           Trinta\fi
    \fi
}

\ifsu@fancychap
    \def\thickhrulefill{\leavevmode \leaders \hrule height 1ex \hfill \kern \z@}

    \def\@makechapterhead#1{%
        {\parindent \z@ \centering \reset@font
            \thickhrulefill\quad
            \large \@chapapp{} \thechapterwords
            \quad \thickhrulefill
            \vspace*{5\p@}
            \interlinepenalty\@M
            \hrule
            \parskip=0ex
            \vspace*{5\p@}%
            \LARGE \bfseries #1\par\nobreak
            \par
            \vspace*{5\p@}%
            \hrule
         \vspace*{30\p@}
        }
    }

    \def\@makeschapterhead#1{%
        {\parindent \z@ \centering \reset@font
            \interlinepenalty\@M
            \hrule
            \parskip=0ex
            \vspace*{5\p@} 
            \LARGE \bfseries #1\par\nobreak
            \vspace*{5\p@}
            \hrule
            \vspace*{30\p@}% 
        }
    }
\fi

%------------------------------------------------------------------------
%  SECTION HEADINGS
%------------------------------------------------------------------------
\ifsu@fancychap
    \renewcommand\section{%
        \@startsection {section}{1}{\z@}%
            {-3.5ex \@plus -1ex \@minus -.2ex}% before 
            {1ex \@plus.2ex}% after
            {\reset@font\Large\bfseries\slshape}}

    \renewcommand\subsection{%
        \@startsection{subsection}{2}{\z@}%
            {-3.25ex\@plus -1ex \@minus -.2ex}% before
            {1ex \@plus .2ex}% after
            {\reset@font\Large\mdseries\slshape}}

    \renewcommand\subsubsection{%
        \@startsection{subsubsection}{3}{\z@}%
            {-3.25ex\@plus -1ex \@minus -.2ex}% before
            {1ex \@plus .2ex}% after
            {\reset@font\Large\mdseries\itshape}}
\fi

%------------------------------------------------------------------------
% IDENTIFICATION (FIRST PAGE) COMMANDS
%------------------------------------------------------------------------
% O nome da instituição que oferece o programa de pós-graduação
\newcommand{\@university}{}
\newcommand{\university}[1]{\renewcommand{\@university}{#1}}

% O nome da Faculdade (quando for o caso)
\newcommand{\@faculty}{}
\newcommand{\faculty}[1]{\renewcommand{\@faculty}{#1}}

% O nome do Departamento (quando for o caso)
\newcommand{\@school}{}
\newcommand{\school}[1]{\renewcommand{\@school}{#1}}

% O nome do curso (quando for o caso)
\newcommand{\@course}{}
\newcommand{\course}[1]{\renewcommand{\@course}{#1}}

% O tipo do trabalho (quando for o caso)
\newcommand{\@typework}{}
\newcommand{\typework}[1]{\renewcommand{\@typework}{#1}}

% Título completo da dissertação ou tese
\newcommand{\@thesistitle}{}
\newcommand{\thesistitle}[1]{\renewcommand{\@thesistitle}{#1}}

% Subtítulo da dissertação ou tese (quando for o caso)
\newcommand{\@thesissubtitle}{}
\newcommand{\thesissubtitle}[1]{\renewcommand{\@thesissubtitle}{#1}}

% O número deste volume e o total de números de volumes (e.g. 1 of 3)
\newboolean{@usvolume} \setboolean{@usvolume}{true}
\newcommand{\showvolume}{\setboolean{@usvolume}{true}}
\newcommand{\hidevolume}{\setboolean{@usvolume}{false}}
\newcommand{\@thesisvolume}{}
\newcommand{\thesisvolume}[1]{\renewcommand{\@thesisvolume}{#1}}

% O nome completo do autor da dissertação ou tese
\newcommand{\@thesisauthor}{}
\newcommand{\thesisauthor}[1]{\renewcommand{\@thesisauthor}{#1}}

% O nome completo do orientador da dissertação ou tese
\newcommand{\@thesisadvisor}{}
\newcommand{\thesisadvisor}[1]{\renewcommand{\@thesisadvisor}{#1}}

% O nome completo do co-orientador da dissertação ou tese
\newboolean{@coadvisor} \setboolean{@coadvisor}{true}
\newcommand{\showcoadvisor}{\setboolean{@coadvisor}{true}}
\newcommand{\hidecoadvisor}{\setboolean{@coadvisor}{false}}
\newcommand{\@thesiscoadvisor}{}
\newcommand{\thesiscoadvisor}[1]{\renewcommand{\@thesiscoadvisor}{#1}}

% O grau ou qualificação para o qual a dissertação ou tese é submetida
\newcommand{\@thesisdegree}{}
\newcommand{\thesisdegree}[1]{\renewcommand{\@thesisdegree}{#1}}

% O título acadêmico para o qual a dissertação ou tese é submetida
\newcommand{\@thesisdegreetitle}{}
\newcommand{\thesisdegreetitle}[1]{\renewcommand{\@thesisdegreetitle}{#1}}

% Mês e ano da defesa
\newcommand{\@thesismonthyear}{}
\newcommand{\thesismonthyear}[1]{\renewcommand{\@thesismonthyear}{#1}}

%------------------------------------------------------------------------
% MAKE TITLE PAGE COMMAND
%------------------------------------------------------------------------
\newcommand{\maketitlepage}
{
    \thispagestyle{empty}
    \singlespacing
    \large
    \ifpdf
        \pdfbookmark{Title Page}{Title}
    \fi
    \vspace*{10mm}
    
    \begin{center}
% Logo Side by side figures 
    \begin{figure}
    	\begin{minipage}[c]{0.15\linewidth}
    		\includegraphics[width=\linewidth]{Logo_Uefs}
    	\end{minipage}
    	\hfill
    	\begin{minipage}[c]{0.2\linewidth}
    		\includegraphics[width=\linewidth]{logoPPGM-UEFS}
    	\end{minipage}%
    \end{figure} \par

	\large\bfseries{\MakeUppercase{\@university}}\par
        \doublespacing
        \vspace*{3mm}
        \large\MakeUppercase{\@faculty} \par
%        \Large\@school \par
%        \vspace*{50mm}
        \large\@course \par
        \vspace*{20mm}                
        \Large\@typework \par        
        \vspace*{10mm}                
        \singlespacing
        \LARGE\bfseries{\@thesistitle} \Large \par
        \vspace*{5mm}
        \@thesissubtitle \par
        \vspace*{20mm}
        \mdseries
        \if@usvolume
            \@thesisvolume \par
            \vspace*{10mm}
        \fi
        Apresentada por: \@thesisauthor \par
        Orientador: \@thesisadvisor \par
        \if@coadvisor
            Co-orientador: \@thesiscoadvisor \par
            \vspace*{1mm}
        \fi
        \vspace*{35mm}
        \@thesismonthyear \par
    \end{center}
    \null\vfill
    \onehalfspacing
}


%------------------------------------------------------------------------
% FOLHA DE ROSTO
%------------------------------------------------------------------------
\newenvironment{folharosto}{
\thispagestyle{empty}
}

\newenvironment{theauthor}{%
\@thesisauthor
}

\newenvironment{thetitle}{%
\@thesistitle
}

\newenvironment{thetypework}{%
\@typework \space
}

\newenvironment{thefaculty}{%
\@faculty
}

\newenvironment{thecourse}{%
\@course \space
}

\newenvironment{theuniversity}{%
\@university
}

\newenvironment{thedegreetitle}{%
\@thesisdegreetitle
}

\newenvironment{theadvisor}{%
\@thesisadvisor \space
}

\newenvironment{thecoadvisor}{%
\@thesiscoadvisor \space
}

%------------------------------------------------------------------------
% FOLHA DE ASSINATURAS
%------------------------------------------------------------------------
\newenvironment{folhaassinaturas}{
\thispagestyle{empty}
}

\newenvironment{thetypeworktwo}{%
\@typework
}

%------------------------------------------------------------------------
% DEDICATORIA
%------------------------------------------------------------------------
\newenvironment{dedicatoria}{
\thispagestyle{empty}
}

%------------------------------------------------------------------------
% AGRADECIMENTOS
%------------------------------------------------------------------------
\newenvironment{agradecimentos}{
    \writesectiontitle{Agradecimentos}
    \thispagestyle{empty}
}

%------------------------------------------------------------------------
% WRITE NEW ENVIRONMENT SECTION TITLE
%------------------------------------------------------------------------
\newcommand{\writesectiontitle}[1]{
    \newpage
    \large
    \ifpdf
        \pdfbookmark[1]{#1}{#1}
    \fi
    \onehalfspacing
    \parindent \z@ \reset@font
    \interlinepenalty\@M
    \ifsu@fancychap
        \centering
        \hrule
        \vspace*{5\p@}%
        \LARGE \bfseries #1 \par\nobreak
        \vspace*{5\p@}%
        \hrule
    \else
        \raggedright
        \vspace*{5\p@}%
        \Huge \bfseries #1 \par\nobreak
    \fi
    \vspace*{40pt}
    \justifying \mdseries \large    
}

%------------------------------------------------------------------------
% NOTA SOBRE O ESTILO
%------------------------------------------------------------------------
\newenvironment{notaestilo}{
    \writesectiontitle{Nota sobre o estilo do PPGM-UEFS}
    \thispagestyle{empty}
    \parindent 0.0\p@
}

\newenvironment{thetypeworkthree}{%
\MakeLowercase\@typework  \space
}

\newenvironment{thefacultytwo}{%
\@faculty \space
}

%------------------------------------------------------------------------
% ANEXOI
%------------------------------------------------------------------------
\newenvironment{anexo1}{
    \writesectiontitle{ANEXO I}
    \thispagestyle{plain}
}

%------------------------------------------------------------------------
% ABSTRACT
%------------------------------------------------------------------------
\newboolean{su@abstractsingle} \setboolean{su@abstractsingle}{false}
\newcommand{\abastractsingle}{\setboolean{su@abstractsingle}{true}}
\newcommand{\abastractonehalf}{\setboolean{su@abstractsingle}{false}}

\newenvironment{thesisabastract}{
    \writesectiontitle{Abstract}
    \thispagestyle{plain}    

    \parindent 0.0\p@    
%    \justifying \mdseries \large    
}

%------------------------------------------------------------------------
% RESUMO
%------------------------------------------------------------------------

\newenvironment{thesisresumo}{
    \writesectiontitle{Resumo}
    \thispagestyle{plain}

    \setlength{\parindent}{0.0mm}
%    \justifying \mdseries \large    
}

%------------------------------------------------------------------------
% LIST OF CONTENTS
%------------------------------------------------------------------------
\newenvironment{thesiscontents}{
    \singlespacing
    \large
    \setcounter{secnumdepth}{3}
    \setcounter{tocdepth}{3}
    \ifpdf
        \pdfbookmark[1]{Sumário}{toc} \tableofcontents
        \newpage
        \pdfbookmark[1]{Lista de Tabelas}{lot}\listoftables
        \newpage
        \pdfbookmark[1]{Lista de Figuras}{lof} \listoffigures
        \newpage
    \else
        \tableofcontents
        \listoftables
        \listoffigures
    \fi
}


%------------------------------------------------------------------------
% PREFACE
%------------------------------------------------------------------------
\newenvironment{thesispreface}{
    \writesectiontitle{Pref\'acio}
    \thispagestyle{plain}
}


%------------------------------------------------------------------------
% DEFINITIONS AND ABBREVIATIONS
%------------------------------------------------------------------------
\newenvironment{thesisabbreviations}{
    \writesectiontitle{Lista de Siglas}
    \thispagestyle{plain}
}


%------------------------------------------------------------------------
% THESIS APPENDICES
%------------------------------------------------------------------------
\newboolean{su@appending} \setboolean{su@appending}{false}
\newenvironment{thesisappendices}{
    \setboolean{su@appending}{true}
    \appendix
}

%------------------------------------------------------------------------
% ULTIMA FOLHA
%------------------------------------------------------------------------
\newenvironment{ultimafolha}{
\thispagestyle{empty}
}

\newenvironment{mesdeano}{%
\@thesismonthyear
}

%------------------------------------------------------------------------
% Citação Literal
%------------------------------------------------------------------------

\newenvironment{CitacaoLiteral}
{  \begin{list}{}
   {
      \setlength{\rightmargin}{0cm}
      \setlength{\leftmargin}{3cm}
      \singlespacing
      \footnotesize
   }
   \item[]``\ignorespaces
}
{
   \unskip"\end{list}
   \normalsize
%   \doublespacing
}

%------------------------------------------------------------------------
% As duas linhas de comando que seguem servem para incluir a subsubsection
% na tabela de conteudo e inserir seu respectivo numero ao lado do subsubitem
%------------------------------------------------------------------------
\addtocounter{secnumdepth}{3} \setcounter{tocdepth}{3}


%------------------------------------------------------------------------
% SET ROMAN PAGE NUMBERS
%------------------------------------------------------------------------
% The romanpages environment set the page numbering to lowercase roman one
% for the contents and figures lists. It also resetspage-numbering for the
% remainder of the dissertation (arabic, starting at 1).

\newenvironment{romanpagenumbers}{
    \newpage
    \setcounter{page}{1}
    \renewcommand{\thepage}{\roman{page}}}
    {\newpage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}

%------------------------------------------------------------------------
% AMBIENTE PARA OS QUADROS
%------------------------------------------------------------------------
\usepackage{newfloat}
\DeclareFloatingEnvironment[
    fileext=loq,
    listname={Lista de Quadros},
    name=Quadro,
    placement=tbhp,
    within=none,
]{quadro}
