\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{thesis}[2007/10/19 v1.0]
\LoadClass[12pt,a4paper,BCOR=.7cm,headsepline,bibliography=totoc]{scrbook}
\renewcommand\headfont{\small\itshape}
\renewcommand*\sectfont{\normalcolor\bfseries}
\DeclareOption{MsThesis}{\AtEndOfPackage{\def\@fordegree{\if@Latin M.Sc. Thesis\else پایان‌نامه کارشناسی ارشد\fi}}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}}
\ProcessOptions
\RequirePackage{amsmath,amsthm}
\newlength\OddM@rg
\if@twoside\def\sw@pmargs{\oddsidemargin\evensidemargin}\else
\def\sw@pmargs{
  \OddM@rg\paperwidth \addtolength\OddM@rg{-\textwidth}
  \addtolength\OddM@rg{-\oddsidemargin} \addtolength\OddM@rg{-2\hoffset} \addtolength\OddM@rg{-2in} \oddsidemargin\OddM@rg}
\sw@pmargs \fi

\sloppy\parindent1.5em
%در انتها بایستی فراخوانی شود
\def\PrepareForBiblio{\cleardoubleemptypage\pagestyle{plain}\backmatter\baselineskip0.8\baselineskip}
\def\PrepareForLatinPages{\cleardoubleemptypage\pagestyle{empty}\sw@pmargs\latin}
%صفحات چکیده و قدردانی
\newenvironment{abstract}[1]
{\def\@pkeywds{#1}\cleardoubleemptypage
%\begin{center}\Large\bfseries\st@title\end{center}
\subsection*{\if@Latin Abstract\else چکیده\fi}\normalsize\singlespace}
{\paragraph*{\if@Latin Keywords\else کلمات کلیدی\fi:}{\@pkeywds.}\cleardoubleemptypage}
\newenvironment{قدردانی}{\cleardoubleemptypage\centerline{\Large\bfseries قدردانی}\begin{quote}}{\end{quote}\cleardoubleemptypage}
%صفحه تصویب
\newenvironment{تصویب}{\def\BSkp{\par\vskip3\bigskipamount} \def\SSkp{\par\vskip\bigskipamount}
\def\signat{امضاء: . . . . . . . . . . .\\[1cm]}
\def\داور%
##1##2{##1: & {\large##2} & \signat}
  \cleardoubleemptypage\begin{center}\large\bfseries به نام او\SSkp\st@university\end{center}
  \BSkp{\large\@fordegree}\SSkp
  \begin{tabular}{rp{11.5cm}} عنوان: & {\large\st@title} \\[\medskipamount] \@by: & {\large\st@author} \end{tabular}
  \BSkp{\large کمیته داوران}\SSkp
  \begin{center}\begin{tabular*}{.9\textwidth}{r r @{\extracolsep{\fill}} l}
    \@undersup: & {\large\st@supervisor} & \signat
    \ifdefined\st@consult \@undercons: & {\large\st@consult} & \signat\fi
}{

&& تاریخ: . . . . . . . . .
\end{tabular*}\end{center}}
%مشخصات پایان‌نامه
\let\origin@lmaketitle\maketitle
\def\makethesistitle{
  \def\@titlehead{\centering\st@logo\\\smallskip\large\st@university}
  \def\@title{\LARGE\st@title}
  \def\@subject{\@fordegree\\\st@subject}
  \def\@author{{\normalsize\@by}\\{\large\textbf{\st@author}} \\[1\bigskipamount]%
    {\normalsize\@undersup}\\{\large\textbf{\st@supervisor}}%
    \ifdefined\st@consult\\[1\bigskipamount]{\normalsize\@undercons}\\{\large\textbf{\st@consult}}\fi
    \\[6\bigskipamount]}
  \def\@date{\ifdefined\st@date\large\st@date\else\if@Latin\latintoday\else\today\fi\fi}
  \origin@lmaketitle
  \newcommand\date[1]{\def\st@date{##1}}
  \newcommand\title[1]{\def\st@title{##1}}
  \newcommand\author[1]{\def\st@author{##1}}
  \newcommand\subject[1]{\def\st@subject{##1}}}
\renewcommand\date[1]{\def\st@date{#1}}
\renewcommand\title[1]{\def\st@title{#1}}
\renewcommand\author[1]{\def\st@author{#1}}
\renewcommand\subject[1]{\def\st@subject{#1}}
\newcommand\logo[1]{\def\st@logo{#1}}
\newcommand\university[1]{\def\st@university{#1}}
\newcommand\supervisor[1]{\def\st@supervisor{#1}}
\newcommand\consult[1]{\def\st@consult{#1}}
\def\@undersup{\if@Latin Supervisor\else استاد راهنما\fi}
\def\@undercons{\if@Latin Under consult of\else استاد مشاور\fi}
\def\@by{\if@Latin By\else نگارش\fi}
\def\@fordegree{\if@Latin PhD Thesis\else پایان‌نامه دکتری\fi}

\newtheorem{theorem}{قضیه}[chapter]
\renewcommand\thetheorem{\thechapter\@SepMark\arabic{theorem}}
\newtheorem{definition}[theorem]{تعریف}
\newtheorem{notation}[theorem]{قرارداد}
\newtheorem{proposition}[theorem]{گزاره}
\newtheorem{lemma}[theorem]{لم}
\newtheorem{remark}[theorem]{تذکر}
\newtheorem{example}[theorem]{مثال}

\def\localisecommands{
\eqcommand{دانشگاه}{university}
\eqcommand{موضوع}{subject}
\eqcommand{استادراهنما}{supervisor}
\eqcommand{استادمشاور}{consult}
\eqcommand{آرم}{logo}
\eqcommand{تقدیم}{dedication}
\eqenvironment{اثبات}{proof}
\eqenvironment{لم}{lemma}
\eqenvironment{قضیه}{theorem}
\eqenvironment{تذکر}{remark}
\eqenvironment{گزاره}{proposition}
\eqenvironment{قرارداد}{notation}
\eqenvironment{تعریف}{definition}
\eqenvironment{مثال}{example}}