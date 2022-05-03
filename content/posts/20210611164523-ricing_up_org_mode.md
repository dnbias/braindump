+++
title = "Ricing up Org Mode"
author = ["Daniel Biasiotto"]
draft = false
+++

Author: [lepisma]({{< relref "20210611164743-lepisma.md" >}})
Source: <https://lepisma.xyz/2017/10/28/ricing-org-mode/index.html>
Tags: [Emacs]({{< relref "20200530210833-emacs.md" >}}), [Typography]({{< relref "20210611164917-typography.md" >}})

-   Look inspired by the style used by Edwand Tufte in his books
    -   font: <https://github.com/edwardtufte/et-book>

-   the config is [here](https://github.com/lepisma/rogue/blob/75ab1c3422b409f41daa4c003b931e869eed0914/config.el#L205)

-   `variable-pitch`
    -   `EtBembo`
        -   serif

-   `org-indent`
    -   `(:inherit (org-hide fixed-pitch))`
    -   alligment of text under Org heading in a non-monospace font

-   padding
    -   `line-spacing`
    -   `header-line`
    -   `left-margin-width`
    -   `right-margin-width`

<div class="code">

(lambda () (progn
  (setq left-margin-width 2)
  (setq right-margin-width 2)
  (set-window-buffer nil (current-buffer))))

</div>

-   tweaks

    <div class="code">

    (setq org-startup-indented t
        org-bullets-bullet-list '(" ") ;; no bullets, needs org-bullets package
        org-ellipsis "  " ;; folding symbol
        org-pretty-entities t
        org-hide-emphasis-markers t
        ;; show actually italicized text instead of _italicized text_
        org-agenda-block-separator ""
        org-fontify-whole-heading-line t
        org-fontify-done-headline t
        org-fontify-quote-and-verse-blocks t)

    </div>