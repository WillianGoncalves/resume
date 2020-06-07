\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{altacv}[2017/04/30 AltaCV v1.1.3, yet another alternative class for a résumé/curriculum vitae.]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions\relax

\LoadClass{extarticle}

\RequirePackage[margin=2cm]{geometry}
\RequirePackage{xcolor}
\RequirePackage{fontawesome}
\RequirePackage[skins]{tcolorbox}
\RequirePackage{enumitem}
\RequirePackage{graphicx}
\RequirePackage{etoolbox}
\RequirePackage{dashrule}
\RequirePackage{multirow,tabularx}
\RequirePackage{changepage}

% colors
\definecolor{accent}{HTML}{192a56}
\definecolor{heading}{HTML}{192a56}
\definecolor{emphasis}{HTML}{333333}
\definecolor{body}{HTML}{333333}
\definecolor{border}{HTML}{999999}

\colorlet{heading}{heading}
\colorlet{accent}{accent}
\colorlet{emphasis}{emphasis}
\colorlet{body}{body}
\colorlet{border}{border}

% defindes line spacing
\renewcommand{\baselinestretch}{1.5}

% paragraph indentation
\setlength{\parindent}{0pt}

% enumitem configuration
\setlist{leftmargin=*,labelsep=0.5em,nosep,after=\vskip0.3\baselineskip}
\setlist[itemize]{label=\faAngleRight}

% define icons
\newcommand{\emailsymbol}{\faAt}
\newcommand{\phonesymbol}{\faPhone}
\newcommand{\linkedinsymbol}{\faLinkedin}
\newcommand{\githubsymbol}{\faGithub}
\newcommand{\locationsymbol}{\faMapMarker}

\newcommand{\printinfo}[2]{\mbox{\textcolor{accent}{#1}\hspace{0.5em}#2\hspace{2em}}}

% used to create the header
\newcommand{\email}[1]{\printinfo{\emailsymbol}{#1}}
\newcommand{\phone}[1]{\printinfo{\phonesymbol}{#1}}
\newcommand{\linkedin}[1]{\printinfo{\linkedinsymbol}{#1}}
\newcommand{\github}[1]{\printinfo{\githubsymbol}{#1}}
\newcommand{\location}[1]{\printinfo{\locationsymbol}{#1}}

\newcommand{\cvsummary}[1]{
  \bigskip
  \justify{#1}\par
  \bigskip
}

\newcommand{\cvsection}[2][]{%
  \bigskip%
  \ifstrequal{#1}{}{}{\marginpar{\vspace*{\dimexpr1pt-\baselineskip}\raggedright\input{#1}}}% 
  {\color{heading}\LARGE\bfseries\MakeUppercase{#2}}\\[-1ex]%
  {\color{heading}\rule{\linewidth}{1pt}\par}\medskip
}

\newcommand{\cvevent}[4]{%
  {\large\color{emphasis}#1}\par
  \textbf{\color{accent}#2}\par
  \bigskip
  \begin{tabular}{ c l }
    \faCalendar & #3 \\
    \faMapMarker & #4
  \end{tabular}
  \bigskip
}

% cvtag uses tcolorbox: http://linorg.usp.br/CTAN/macros/latex/contrib/tcolorbox/tcolorbox.pdf
\newtcbox{\cvtag}{on line,
  arc=2pt,boxrule=0.5pt,
  colback=white,colframe=border,colupper=body,
  before upper={\rule[-3pt]{0pt}{10pt}},
  enlarge bottom by=1.5mm,grow to right by=-1mm,
  boxsep=1pt,left=6pt,right=6pt,top=4pt,bottom=2pt}

\newcommand{\cvskill}[2]{%
  \textcolor{body}{#1}\hfill
  \foreach \x in {1,...,5}{%
    \space{\ifnumgreater{\x}{#2}{\faCircleO}{\faCircle}}}\par%
}

\RequirePackage[backend=biber,style=authoryear,sorting=ydnt]{biblatex}

\AtBeginDocument{%
  \pagestyle{empty}
  \color{body}
  \raggedright
}
