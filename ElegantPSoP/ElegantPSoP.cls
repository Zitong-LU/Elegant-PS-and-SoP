%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SPDX-License-Identifier: BSD-3-Clause
% Copyright (c) 2020, Salman Ahmad Faris
% https://github.com/salfaris/EasyPS
% Copyright (c) 2024, Daize Dong
% https://github.com/DaizeDong/Easier-PS-and-SoP
% Copyright (c) 2025, Zitong LU
% https://github.com/Zitong-LU/Elegant-PS-and-SoP
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ElegantPSoP}[2025/11/08 Modified from Easier-PS-and-SoP]
\LoadClass[12pt]{article} % Load the base article class with 12pt font size
\pdfgentounicode=1  % Ensure generated PDF is ATS parsable

\RequirePackage{lipsum}         % Generates placeholder text, remove if unnecessary
\RequirePackage{geometry}       % For layout and margin control
\RequirePackage{fancyhdr}       % For headers and footers
\RequirePackage{setspace}       % For controlling line spacing
\RequirePackage{titlesec}       % For section title formatting
\RequirePackage{lmodern}        % Load LM Roman (Latin Modern Roman)
\RequirePackage{xcolor}         % For custom colors
\RequirePackage{hyperref}       % For hyperlinking citations
% \RequirePackage[sort,numbers]{natbib} 
\RequirePackage[
    backend=biber,
    style = numeric, 
    sorting=none
]{biblatex}




% BASIC INFO
\def\@DocTitle{{\color{red}Set Your Document Title in the Content}}
\newcommand{\SetDocTitle}[1]{\def\@DocTitle{#1}}
\newcommand*{\GetDocTitle}{\@DocTitle}
\def\@StudentName{{\color{red}Set Your Student Name}}
\newcommand*{\SetStudentName}[1]{\def\@StudentName{#1}}
\newcommand*{\GetStudentName}{\@StudentName}
\def\@ProgramName{{\color{red}Set Your Program Name in the Content}}
\newcommand*{\SetProgramName}[1]{\def\@ProgramName{#1}}
\newcommand*{\GetProgramName}{\@ProgramName}
\def\@UniversityName{{\color{red}Set Your University Name in the Content}}
\newcommand*{\SetUniversityName}[1]{\def\@UniversityName{#1}}
\newcommand*{\GetUniversityName}{\@UniversityName} 
\def\@UniversityAbbr{\@UniversityName}
\newcommand*{\SetUniversityAbbr}[1]{\def\@UniversityAbbr{#1}}
\newcommand*{\GetUniversityAbbr}{\@UniversityAbbr}


% CONTENTS INFO
\def\@BaseContentPath{main/content/base}
\newcommand*{\SetBaseContentPath}[1]{\def\@BaseContentPath{#1}}
\newcommand*{\GetBaseContentPath}{\@BaseContentPath}
\def\@UniContentPath{main/content/base}
\newcommand*{\SetUniContentPath}[1]{\def\@UniContentPath{#1}}
\newcommand*{\GetUniContentPath}{\@UniContentPath}




% LAYOUT SETTINGS
\geometry{
    a4paper, 
    includehead, 
    margin=1.0in, 
    headheight = 14.5pt,  % Adjust the height of the header
    headsep = 18pt,     % Space between the header and content
    heightrounded, 
    % showframe
    } % Page margins, change as you need

% \onehalfspacing              % Line spacing
\linespread{1.5}               % Line spacing
\setlength{\parskip}{6pt}     % Space between paragraphs


% HEADER AND FOOTER SETTINGS
\pagestyle{fancy}               % Use fancy headers/footers
\fancyhf{}                      % Clear default header/footer
\fancyhead[L]{\GetStudentName}    % Custom left header: Student Name
\fancyhead[R]{\GetUniversityName} % Custom right header: University Name
\fancyfoot[C]{\thepage}         % Add a page number in the footer 

% HEADER EXPANSION FOR FIRST PAGE


\newlength{\HTitle} %14.17232
\settoheight{\HTitle}{
    \begin{minipage}[b]{\textwidth}
        \centering {\LARGE \textsc{\GetDocTitle}}
    \end{minipage}
}

\newlength{\HFirstPageHead} %57.67232
\settoheight{\HFirstPageHead}{
    \begin{minipage}[b]{\textwidth}
        \begin{minipage}[b]{\textwidth}
            \centering {\LARGE \textsc{\GetDocTitle}}
        \end{minipage} 
        \ \\ 
        \null\hfill \GetUniversityName\\
        \GetStudentName \hfill \GetProgramName
    \end{minipage}
}


\fancypagestyle{plain}{%
    \fancyhead{ 
    \begin{minipage}[b]{\textwidth}
        \centering {\LARGE \textsc{\GetDocTitle}}
    \end{minipage} 
        \ \\ 
        \null\hfill \GetUniversityName\\
        \GetStudentName \hfill \GetProgramName
    }   
}

\def\@maketitle{%
    \newpage
    \null
    \vspace*{\dimexpr \HFirstPageHead -\baselineskip - \headheight\relax}
}




% CITATION SETTINGS
\renewcommand{\thefootnote}{\fnsymbol{footnote}}
\definecolor{winered}{rgb}{0.5,0,0}
\hypersetup{
    pdfborder={0 0 0},
    colorlinks=true,
    linkcolor={winered},
    urlcolor={winered},
    filecolor={winered},
    citecolor={winered},
    linktoc=all,
}
