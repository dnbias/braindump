+++
title = "Doom Icons in Daemon"
author = ["Daniel Biasiotto"]
date = 2022-06-27T18:07:00+02:00
tags = ["til", "emacs"]
draft = false
+++

-   <http://sodaware.sdf.org/notes/emacs-daemon-doom-modeline-icons/>

<!--listend-->

```elisp
(defun enable-doom-modeline-icons (_frame)
  (setq doom-modeline-icon t))

(add-hook 'after-make-frame-functions
          #'enable-doom-modeline-icons)

```
