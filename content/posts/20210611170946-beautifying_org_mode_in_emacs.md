+++
title = "Beautifying Org Mode in Emacs"
author = ["Daniel Biasiotto"]
tags = ["article"]
draft = false
+++

-   Author: [Zzamboni]({{< relref "20210611171032-zzamboni.md" >}})
-   Source: <https://zzamboni.org/post/beautifying-org-mode-in-emacs/>
-   Tags: [Emacs]({{< relref "20200530210833-emacs.md" >}}), [Typography]({{< relref "20210611164917-typography.md" >}})
-   References: [Org as a Word Processor]({{< relref "20210611171249-org_as_a_word_processor.md" >}})

-   headlines and lists
    -   `emphasis-markers`
    -   `font-lock`
    -   `org-bullets`
-   proportional fonts

    <div class="code">

    (let\* ((variable-tuple
        (cond ((x-list-fonts "ETBembo")         '(:font "ETBembo"))
              ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
              ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
              ((x-list-fonts "Verdana")         '(:font "Verdana"))
              ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
              (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
       (base-font-color     (face-foreground 'default nil 'default))
       (headline           \`(:inherit default :weight bold :foreground ,base-font-color)))

    (custom-theme-set-faces
     'user
     \`(org-level-8 ((t (,@headline ,@variable-tuple))))
     \`(org-level-7 ((t (,@headline ,@variable-tuple))))
     \`(org-level-6 ((t (,@headline ,@variable-tuple))))
     \`(org-level-5 ((t (,@headline ,@variable-tuple))))
     \`(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
     \`(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
     \`(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
     \`(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
     \`(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))

    </div>

-   Emacs supports `variable-pitch-mode`

    <div class="code">

    (custom-theme-set-faces
     'user
     '(variable-pitch ((t (:family "ETBembo" :height 180 :weight thin))))
     '(fixed-pitch ((t ( :family "Fira Code Retina" :height 160)))))

    </div>

-   long lines and `visual-line-mode`
    -   `fill-paragraph` only works with fixed-width fonts
    -   `visual-line-mode` adjusts the line to the width of the window

-   other elements

    -   `C-u C-x` runs `what-cursor-position`

    <div class="code">

    (custom-theme-set-faces
     'user
     '(org-block ((t (:inherit fixed-pitch))))
     '(org-code ((t (:inherit (shadow fixed-pitch)))))
     '(org-document-info ((t (:foreground "dark orange"))))
     '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
     '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
     '(org-link ((t (:foreground "royal blue" :underline t))))
     '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
     '(org-property-value ((t (:inherit fixed-pitch))) t)
     '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
     '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
     '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
     '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))

    </div>
