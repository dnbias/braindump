;;; .dir_locals.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2022 Daniel Biasiotto
;;
;; Author: Daniel Biasiotto <daniel.biasiotto@edu.unito.it>
;; Maintainer: Daniel Biasiotto <daniel.biasiotto@edu.unito.it>
;; Created: April 06, 2022
;; Modified: April 06, 2022
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex tools unix vc wp
;; Homepage: https://github.com/dnbias/.dir_locals
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:
; see https://emacs.stackexchange.com/questions/59578/how-to-turn-off-automatic-indenting-for-org-files-in-a-specific-folder
((org-mode . ((eval . (org-indent-mode -1)))))

(provide '.dir_locals)
;;; .dir_locals.el ends here
