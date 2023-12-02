+++
title = "Writing Academic Papers w/ Emacs"
date = 2022-05-31T16:32:00+02:00
draft = false
+++

-   Source: [Jonathan Bennett's Blog](https://jonathanabennett.github.io/blog/2019/05/29/writing-academic-papers-with-org-mode/)


## Premable in org-mode {#premable-in-org-mode}

```text
#+TITLE: <Insert Title Here>
#+AUTHOR: <Your Name Here
#+BIBLIOGRAPHY: library.bib
#+LaTeX_class: apa6
#+LaTeX_CLASS_OPTIONS: [a4paper]
#+LaTeX_HEADER: \affiliation{<Your school, think tank, etc>}
#+LaTeX_HEADER: \shorttitle{<A short version of the long title for page headers>}
#+LaTeX_HEADER: \usepackage{breakcites}
#+LaTeX_HEADER: \usepackage{apacite}
#+LaTeX_HEADER: \usepackage{paralist}
#+LaTeX_HEADER: \let\itemize\compactitem
#+LaTeX_HEADER: \let\description\compactdesc
#+LaTeX_HEADER: \let\enumerate\compactenum

#+BEGIN_ABSTRACT

*Abstract*

You cannot use an org-mode header here.
If you do, it trashes the table of contents for the apa6 document class.
That's why Abstract is bolded manually.

As you can see, I write my documents 1 sentence to a line.
This is because I keep these documents under version control.
A single English sentence is similar to a single line of code.
You wouldn't run lines of code together in a production codebase, so don't run sentences together in a VC'ed text document.

Latex and org-mode both interpret a single empty line as a paragraph break, so the fact that your source document is 1 sentence per line will not be visible to anybody other than you.
#+END_ABSTRACT
#+LaTeX: \tableofcontents
```


## Bib settings {#bib-settings}

```elisp
(use-package helm-bibtex
    :custom
    (helm-bibtex-bibliography '("~/zotero.bib"))
    (reftex-default-bibliography '("~/zotero.bib"))
    (bibtex-completion-pdf-field "file")
    :hook (Tex . (lambda () (define-key Tex-mode-map "\C-ch" 'helm-bibtex))))

(use-package org-ref
    :custom
    (org-ref-default-bibliography "~/zotero.bib"))
```


## LaTeX settings &amp; APA6 {#latex-settings-and-apa6}

```elisp
(defun org-export-latex-no-toc (depth)
    (when depth
      (format "%% Org-mode is exporting headings to %s levels.\n"
              depth)))
(setq org-export-latex-format-toc-function 'org-export-latex-no-toc)

(add-to-list 'org-latex-classes
               '("apa6"
                 "\\documentclass{apa6}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(setq org-latex-pdf-process
    '("latexmk -pdflatex='pdflatex -interaction nonstopmode' -pdf -bibtex -f %f"))
```


## Packages {#packages}

To run on linux:

```text
$ sudo apt install libpng-dev zlib1g-dev
$ sudo apt install lib-poppler-glib-dev
$ sudo apt install libpoppler-private-dev
$ sudo apt install imagemagick
```
