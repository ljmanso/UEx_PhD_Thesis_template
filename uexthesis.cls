\ProvidesClass{uexthesis}[2014/10/01]

\ProcessOptions \relax
\typeout{**************************************************************************}
\typeout{*** Si tienes alguna duda o sugerencia, envíala a: lmanso@unex.es ***}
\typeout{**************************************************************************}

\LoadClass[twoside]{book}


\RequirePackage[utf8x]{inputenc}

\RequirePackage{enumerate}
\RequirePackage{float}
\RequirePackage{colortbl}

\RequirePackage{graphicx}
\RequirePackage{flushend}
\RequirePackage{times}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{float}
\RequirePackage{color}
\RequirePackage{hyphenat}

\definecolor{azuloscuro}{rgb}{0,0,0.6}
\RequirePackage[colorlinks,breaklinks=true,linkcolor=azuloscuro,urlcolor=azuloscuro,citecolor=azuloscuro]{hyperref}

\RequirePackage{bm}
\RequirePackage{makeidx}
\RequirePackage{listings}

\RequirePackage{graphics}
\RequirePackage{epsfig}
% \RequirePackage{mathptmx} % assumes new font selection scheme installed
\RequirePackage{amsmath}
\RequirePackage{amssymb}

\RequirePackage{array}
\RequirePackage{algorithm}
\RequirePackage{algorithmic}
\RequirePackage{multirow}
\RequirePackage{multicol}
\RequirePackage{subfig}
\RequirePackage{color}
\RequirePackage{anysize}

\RequirePackage{xargs}
\RequirePackage{shorttoc}

\RequirePackage{marginnote}
\RequirePackage{ifthen,changepage}


\RequirePackage{tabularx}

% DRAFT MODE??
\newif\ifDRAFT
%\DRAFTtrue
\DRAFTfalse

%%% BIBLIOGRAPHY STYLE 1
% \RequirePackage[square]{natbib}
% \bibpunct{[}{]}{;}{a}{,}{,}
% \renewcommand{\cite}{\citep}
% \bibliographystyle{plainnat}

%%% BIBLIOGRAPHY STYLE 2
% \RequirePackage{cite}
% \bibliographystyle{apalike}
% \def\printbetweencitations{; }

%%% BIBLIOGRAPHY STYLE 3
\def\printbetweencitations{; }
\bibliographystyle{apalike}
\def\printbetweencitations{; }

\makeindex

\lstset{% general command to set parameter(s)
    basicstyle=\scriptsize\ttfamily,                 % print whole listing small
    keywordstyle=\scriptsize\color{black}, % underlined bold black keywords
    identifierstyle=\scriptsize\ttfamily,           % nothing happens
    commentstyle=\scriptsize\ttfamily, % white comments
    stringstyle=\scriptsize\ttfamily,      % typewriter type for strings
    showstringspaces=false,            % no special string spaces
    language=C++,
    numbers=left,
    numberstyle=\scriptsize,
    frame=single,
    linewidth=\textwidth,
    breaklines=true,
    framesep=2.9mm,
    xleftmargin=0.57cm
}



% Mandatory (first) argument: text, term to label
% Optional (second) argument: index topic (if the label to index should be placed in a specific index section)
% Optional (third) argument:  optional text (it the text to display is wanted to be differ from the label to index)
% \newcommand{\termMarkOdd}{$\Leftarrow$}
% \newcommand{\termMarkEven}{$\Rightarrow$}
% \newcommand{\termMarkOdd}{$\triangleleft$}
% \newcommand{\termMarkEven}{$\triangleright$}
\newcommand{\termMarkOdd}{$\surd$}
\newcommand{\termMarkEven}{$\surd$}
\newcommandx{\importante}[2][2]{
\checkoddpage
\ifthenelse
{
\boolean{oddpage}
}
{
\marginnote{\termMarkOdd}
}
{
\marginnote{\termMarkEven}
}
\ifx\\#2\\
\textbf{\em{#1\index{#1}}}
\else
\textbf{\em{#2\index{#1}}}
\fi
\label{#1}
}


% \newcounter{exp}
% \makeatletter
% \newcommand\listofexperiments{\chapter{List of experiments}\@starttoc{exp}}
% \makeatother

% \newenvironment{experiment}
% {
%   \stepcounter{exp}
%   \addcontentsline{exp}{section}{Experiment~\arabic{exp}:\\ \theexp}
%   \par\vspace*{2.3ex plus .2ex}\noindent\ignorespaces
% }
 
\ifDRAFT
	\newcommandx{\PORHACER}[1]{{\color{red}\textbf{XXX #1}}}
\else
	\newcommandx{\PORHACER}[1]{}
\fi



\newcommand{\argmax}{\operatornamewithlimits{argmax}}
\newcommand{\argmin}{\operatornamewithlimits{argmin}}
\newcommand{\eg}{\textit{e.g.},~}
\newcommand{\ie}{\textit{i.e.},~}

\newcommand{\iid}{\stackrel{\mathrm{iid}}{\sim}}

\newcommand{\iidsim}{\stackrel{\text{iid}}{\sim}}
\newcommand{\iidpropto}{\stackrel{\text{iid}}{\propto}}




\newenvironment{miEnumerate}%
  {\begin{enumerate} \setlength{\itemsep}{0cm}\setlength{\parskip}{0.18cm}}%
  {\end{enumerate}}

\newenvironment{miItemize}%
  {\begin{itemize} \setlength{\itemsep}{0cm}\setlength{\parskip}{0.18cm}}%
  {\end{itemize}}


  

\long\def\place#1{\gdef\@place{#1}}






\newcommand{\InsertaPaginasIniciales}
{

  \thispagestyle{empty}
  \begin{titlepage} 
  \begin{center}
  % H E A D I N G
  \vspace{\fill}
  \vspace{1cm}
  \begin{figure}[ht]
  \begin{center}
  \includegraphics[width=0.2\linewidth]{img/UEx.jpg}
  \end{center}
  \end{figure}
  % T I T L E
  \vspace{5cm}
  \begin{huge}
  \par
  \parbox{0.8\textwidth}{\begin{center}\textbf{\@title}\end{center}}
  \par
  \end{huge}
  % D A T A
  \vspace*{3.5cm}
  \begin{large}
  \textbf{\@author}
  \end{large}
  \vspace*{0.2cm}
  \par
  \textbf{\@place}
  \par
  \textbf{University of Extremadura}
  \par
  \textbf{Doctoral Dissertation}
  % L I C E N S E
  \vspace*{1.2cm}
  \par
  {\small This work is licensed under license:\\\href{http://creativecommons.org/licenses/by-nc-nd/3.0/es/deed.en}{Creative Commons Attribution-Noncommercial-No Derivative Works 3.0}.} % Puedes cambiar la licencia...
  \begin{figure}[ht]
  \begin{center}
  \includegraphics[width=0.09\linewidth]{img/CreativeCommons.png}
  \end{center}
  \end{figure}
  \end{center}
  \vspace{\fill}
  \end{titlepage}


  \newpage{\thispagestyle{empty}\ }
  \newpage{\cleardoublepage}

  \setcounter{page}{-1}

}
