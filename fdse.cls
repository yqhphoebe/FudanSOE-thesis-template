%%
%% fdse.cls - 复旦大学经济学院研究生学位论文模板类
%% 基于《复旦大学经济学院博士、硕士研究生学位论文撰写规范（2019年10月修订版）》

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fdse}[2025/01/16 v1.0 Fudan School of Economics Thesis Class]

%% 1. 基础类设置
% 基于 ctexbook，A4纸，双面打印，正文小四号 (approx 12pt) 
\LoadClass[a4paper,12pt,twoside,openany]{ctexbook}

%% 2. 宏包加载
\RequirePackage{geometry}       % 页面设置
\RequirePackage{fontspec}       % 字体设置
\RequirePackage{fancyhdr}       % 页眉页脚
\RequirePackage{titletoc}       % 目录格式
\RequirePackage{amsmath, amssymb, amsfonts} % 数学公式
\RequirePackage{graphicx}       % 图片
\RequirePackage{float}          % 浮动体
\RequirePackage{booktabs}       % 三线表
\RequirePackage{caption}        % 图表标题
\RequirePackage{setspace}       % 行距
\RequirePackage{anyfontsize}    % 任意字号
\RequirePackage[hidelinks]{hyperref} % 超链接

%% 3. 页面布局 
% Word默认页边距: 上下左右均为 2.54cm
\geometry{top=2.54cm, bottom=2.54cm, left=2.54cm, right=2.54cm}

%% 4. 字体设置
\setmainfont{Times New Roman}

% 检测操作系统并设置中文字体
\ifdefstring{\OS}{mac}{%
    % macOS 设置
    \setCJKmainfont[AutoFakeBold=true]{Songti SC}
    \setCJKsansfont[AutoFakeBold=true]{Songti SC}
}{%
    % Windows 或其他 (尝试加载 Windows 字体)
    % 如果你在 Overleaf，请直接注释掉下面两行，依靠 ctex 默认设置
    %\setCJKmainfont[AutoFakeBold=true]{SimSun}
    %\setCJKsansfont[AutoFakeBold=true]{SimHei}
}


% 正文行距：固定20磅 
\setlength{\baselineskip}{20pt}

%% 5. 标题格式设置
% 章标题：阿拉伯数字，居中，宋体正文三号字，黑体加粗，每一章另起一页 
% 节标题：左对齐，宋体正文四号字，黑体加粗，空一行 
\ctexset{
    chapter = {
        format = {\centering\zihao{3}\songti\bfseries},
        beforeskip = {20pt},
        afterskip = {20pt},
        fixskip = true,
        break = {\clearpage},
        number = {\arabic{chapter}},
        name = {第,章}, % 或者根据需要设为 name = {},
    },
    section = {
        format = {\raggedright\zihao{4}\songti\bfseries},
        beforeskip = {1em},
        afterskip = {1em},
    },
    subsection = {
        format = {\raggedright\zihao{-4}\songti\bfseries},
        beforeskip = {0.5em},
        afterskip = {0.5em},
    }
}

%% 6. 页眉页脚设置 
% 页眉采用小五号字
% 左端为论文题目 (Running Head)
% 右端为章题目
% 页码在底端中间，阿拉伯数字
\pagestyle{fancy}
\fancyhf{}
\fancyhead[LE,RO]{\zihao{-5}\rightmark} % 章标题
\fancyhead[RE,LO]{\zihao{-5}\@thesistitle} % 论文题目
\fancyfoot[C]{\zihao{-5}\thepage}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\chaptermark}[1]{\markboth{#1}{#1}} % 仅显示标题文字

%% 7. 图表与公式设置 
% 图表标题：五号字，居中
% 表格注释：小五号字
\DeclareCaptionFont{wuhao}{\zihao{5}}
\captionsetup{font=wuhao, labelsep=quad}
\captionsetup[table]{position=top}
\captionsetup[figure]{position=bottom}

% 公式编号：按章排序 (2-1)，右对齐，公式居中 
\numberwithin{equation}{chapter}
\renewcommand{\theequation}{\thechapter-\arabic{equation}}

%% 8. 参考文献设置 (Biblatex)
% 满足：中文在前英文在后 + 文中Author-Year + 文末编号列表 
\RequirePackage[
    backend=biber,
    style=gb7714-2015,
    citestyle=gb7714-2015ay,
    sorting=nyt,
    defernumbers=true,
    url=false, doi=false, 
    isbn=false,           % (可选) 把 ISBN 也关掉
]{biblatex}

% 定义过滤器
\defbibcheck{chinese}{
    \iffieldequalstr{langid}{chinese}
        {}
        {\skipentry}
}

\defbibcheck{english}{
    \iffieldequalstr{langid}{chinese}
        {\skipentry}
        {}
}

% 强制文末列表显示编号
\defbibenvironment{bibliography}
  {\list
     {\printfield{labelnumber}}
     {\setlength{\labelwidth}{\labelnumberwidth}%
      \setlength{\leftmargin}{\labelwidth}%
      \setlength{\labelsep}{\biblabelsep}%
      \addtolength{\leftmargin}{\labelsep}%
      \setlength{\itemsep}{\bibitemsep}%
      \setlength{\parsep}{\bibparsep}}%
      \renewcommand*{\makelabel}[1]{\hss##1}}
  {\endlist}
  {\item}

%% 9. 信息录入命令定义
\newcommand{\schoolcode}[1]{\def\@schoolcode{#1}}
\newcommand{\studentID}[1]{\def\@studentID{#1}}
\newcommand{\thesistitle}[1]{\def\@thesistitle{#1}}
\newcommand{\englishtitle}[1]{\def\@englishtitle{#1}}
\newcommand{\degreetype}[1]{\def\@degreetype{#1}} % (学术学位) or (专业学位)
\newcommand{\major}[1]{\def\@major{#1}}
\newcommand{\authorname}[1]{\def\@authorname{#1}}
\newcommand{\supervisor}[1]{\def\@supervisor{#1}}
\newcommand{\completedate}[1]{\def\@completedate{#1}}
\newcommand{\degreecategory}[1]{\def\@degreecategory{#1}} % 硕士学位论文 or 博士学位论文

% 默认值
\schoolcode{10246} 
\completedate{\today}

%% 10. 封面生成命令 \makecover 
\newcommand{\makecover}{
    \begin{titlepage}
        \linespread{1.5}
        \zihao{-5}
        \noindent
        \hfill
        \begin{tabular}{ll}
            学校代码： & \@schoolcode \\
            学\phantom{空}号： & \@studentID
        \end{tabular}
        \hfill
        % 如需密级，可在此添加判断逻辑
        
        \vspace{2.5cm}
        \begin{center}
            \includegraphics[width=0.5\textwidth]{fudan.png}
            
            \vspace{1.5cm}
            {\zihao{2}\songti \@degreecategory}
            
            \vspace{0.5cm}
            {\zihao{-3}\songti\bfseries \@degreetype} % 

            \vspace{2cm}
            {\zihao{-2}\bfseries \@thesistitle} 

            \vspace{0.5cm}
            {\zihao{4}\bfseries \@englishtitle}

            \vfill

            \zihao{4}\songti
            \begin{tabular}{rc}
                院\hfill 系：& 经济学院 \\
                专\hfill 业：& \@major \\
                姓\hfill 名：& \@authorname \\
                指导教师：& \@supervisor \\
                完成日期：& \@completedate
            \end{tabular}
        \end{center}
        \vspace{2cm}
    \end{titlepage}
}

%% 11. 摘要环境 
% 摘要和目录页码用 I, II, III 
\newcommand{\frontmatterstyle}{
    \frontmatter
    \pagestyle{fancy}
    \pagenumbering{Roman} % I, II...
}

\newenvironment{cnabstract}[1]{
    \chapter*{摘\quad 要}
    \addcontentsline{toc}{chapter}{摘要}
    \zihao{-4}\songti
    \def\@cnkeywords{#1}
}{
    \par\vspace{1em}
    \noindent\textbf{关键词：} \@cnkeywords % 
}

\newenvironment{enabstract}[3]{
    \chapter*{Abstract}
    \addcontentsline{toc}{chapter}{Abstract}
    \zihao{-4}
    \def\@enkeywords{#1}
    \def\@jelcodes{#2}
}{
    \par\vspace{1em}
    \noindent\textbf{Keywords:} \@enkeywords 
    \par
    \noindent\textbf{JEL Classification:} \@jelcodes
}

\endinput
%% Author: 复旦经院21级博士颜千卉
%% Date: 2026/01/17