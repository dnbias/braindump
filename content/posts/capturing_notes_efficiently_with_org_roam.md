+++
title = "Capturing Notes Efficiently with Org Roam"
author = ["Daniel Biasiotto"]
date = 2021-12-19T20:04:00+01:00
tags = ["article"]
draft = false
+++

-   Source: <https://systemcrafters.net/build-a-second-brain-in-emacs/capturing-notes-efficiently/>
-   Author: [System Crafters]({{< relref "system_crafters.md" >}})
-   Related: [Emacs]({{< relref "20200530210833-emacs.md" >}})

-   [org-roam]({{< relref "20210604135308-org_roam.md" >}}) uses the same system as [org-capture]({{< relref "20200528222132-org_capture.md" >}})
-   pretty easy to set-up

<!--listend-->

```elisp
(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/RoamNotes")
  (org-roam-completion-everywhere t)
  (org-roam-capture-templates
   '(("d" "default" plain
      "%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         :map org-mode-map
         ("C-M-i" . completion-at-point))
  :config
  (org-roam-setup))
```