+++
title = "How to switch, customize, or write themes"
author = ["Daniel Biasiotto"]
date = 2022-12-30T01:49:00+01:00
tags = ["article", "til"]
draft = false
+++

-   Source: <https://discourse.doomemacs.org/t/how-to-switch-customize-or-write-themes/37>
-   Author: gagbo
-   Related: [Emacs]({{< relref "20200530210833-emacs.md" >}})


## Notes {#notes}

Setting themes:

```elisp
;;; add to $DOOMDIR/config.el
(setq doom-theme 'theme-name)
;; or
(load-theme 'theme-name t)
```

Tweaking the current theme:

```elisp
(custom-set-faces!
  '(cursor :background "#FF0000"))

(custom-set-faces!
  `(markdown-code-face :background ,(doom-color 'bg-alt))
  `(markdown-markup-face :foreground ,(doom-color 'blue)))
```

To see the palette variables of the theme check the theme's source code

-   [doom-one](https://github.com/hlissner/emacs-doom-themes/blob/master/themes/doom-one-theme.el#L36-L106)

Looking up faces:

-   `M-x describe-char`
-   `SPC h '`
-   `C-h '`

To see preview of known faces:

-   `M-x describe-faces`
-   `SPC h F`
-   `C-h F`

To write a custom theme base it on a Doom theme to use the `doomemacs/themes` API and place it in `$DOOMDIR/themes/`..
