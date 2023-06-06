;;; bfg9000-mode.el --- Major modes for bfg9000 files -*- lexical-binding: t -*-

;; Copyright (C) 2021-2023 Jim Porter

;; Author: Jim Porter
;; URL: https://github.com/jimporter/bfg9000-mode
;; Version: 0.1-git
;; Keywords:

;; This program is free software; you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by the Free
;; Software Foundation, either version 3 of the License, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful, but WITHOUT
;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
;; FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
;; more details.

;; You should have received a copy of the GNU General Public License along with
;; this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Major modes for editing bfg9000 files.

;;; Code:

(require 'bfg9000-keywords)
(require 'python)

(defmacro bfg9000--symbol (&rest lists)
  "Make a regexp to match any symbol contained in LISTS."
  `(rx symbol-start
       (eval (append '(or) ,@lists))
       symbol-end))


;; bfg9000-mode

(defvar bfg9000-font-lock-keywords-level-1
  python-font-lock-keywords-level-1
  "Font lock keywords to use in `bfg9000-mode' for level 1 decoration.

This is the minimum decoration level, equivalent to
`python-font-lock-keywords-level-1'.")

(defvar bfg9000-font-lock-keywords-level-2
  `(,@python-font-lock-keywords-level-2
    (,(bfg9000--symbol bfg9000--function-keywords
                       bfg9000--value-keywords)
     . font-lock-builtin-face))
  "Font lock keywords to use in `bfg9000-mode' for level 2 decoration.

This is the medium decoration level, equivalent to
`python-font-lock-keywords-level-2', plus bfg9000-specific builtin
functions and values.")

(defvar bfg9000-font-lock-keywords-maximum-decoration
  `(,@python-font-lock-keywords-maximum-decoration
    (,(bfg9000--symbol bfg9000--function-keywords
                       bfg9000--value-keywords)
     . font-lock-builtin-face)
    (,(bfg9000--symbol bfg9000--enum-keywords)
     . font-lock-constant-face)
    (,(bfg9000--symbol bfg9000--exception-keywords
                       bfg9000--type-keywords)
     . font-lock-type-face))
  "Font lock keywords to use in `bfg9000-mode' for maximum decoration.

This decoration level is equivalent to
`python-font-lock-keywords-maximum-decoration', plus bfg9000-specific
functions, values, enums, exceptions, and types.")

(defvar bfg9000-font-lock-keywords
  '(bfg9000-font-lock-keywords-level-1
    bfg9000-font-lock-keywords-level-1
    bfg9000-font-lock-keywords-level-2
    bfg9000-font-lock-keywords-maximum-decoration)
  "List of font lock keyword specifications to use in `bfg9000-mode'.

Which one will be chosen depends on the value of
`font-lock-maximum-decoration'.")

;;;###autoload
(define-derived-mode bfg9000-mode python-mode "bfg9000"
  "Major mode for editing bfg9000 files."
  (setq-local font-lock-defaults
              `(,bfg9000-font-lock-keywords
                nil nil nil nil
                (font-lock-syntactic-face-function
                 . python-font-lock-syntactic-face-function))))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.bfg\\'" . bfg9000-mode))


;; bfg9000-options-mode

(defvar bfg9000-options-font-lock-keywords-level-1
  python-font-lock-keywords-level-1
  "Font lock keywords to use in `bfg9000-options-mode' for level 1 decoration.

This is the minimum decoration level, equivalent to
`python-font-lock-keywords-level-1'.")

(defvar bfg9000-options-font-lock-keywords-level-2
  `(,@python-font-lock-keywords-level-2
    (,(bfg9000--symbol bfg9000-options--function-keywords
                       bfg9000-options--value-keywords)
     . font-lock-builtin-face))
  "Font lock keywords to use in `bfg9000-options-mode' for level 2 decoration.

This is the medium decoration level, equivalent to
`python-font-lock-keywords-level-2', plus bfg9000-specific builtin
functions and values.")

(defvar bfg9000-options-font-lock-keywords-maximum-decoration
  `(,@python-font-lock-keywords-maximum-decoration
    (,(bfg9000--symbol bfg9000-options--function-keywords
                       bfg9000-options--value-keywords)
     . font-lock-builtin-face)
    (,(bfg9000--symbol bfg9000-options--enum-keywords)
     . font-lock-constant-face)
    (,(bfg9000--symbol bfg9000-options--exception-keywords
                       bfg9000-options--type-keywords)
     . font-lock-type-face))
  "Font lock keywords to use in `bfg9000-options-mode' for maximum decoration.

This decoration level is equivalent to
`python-font-lock-keywords-maximum-decoration', plus bfg9000-specific
functions, values, enums, exceptions, and types.")

(defvar bfg9000-options-font-lock-keywords
  '(bfg9000-options-font-lock-keywords-level-1
    bfg9000-options-font-lock-keywords-level-1
    bfg9000-options-font-lock-keywords-level-2
    bfg9000-options-font-lock-keywords-maximum-decoration)
  "List of font lock keyword specifications to use in `bfg9000-options-mode'.

Which one will be chosen depends on the value of
`font-lock-maximum-decoration'.")

;;;###autoload
(define-derived-mode bfg9000-options-mode python-mode "bfg9000[opts]"
  "Major mode for editing bfg9000 options files."
  (setq-local font-lock-defaults
              `(,bfg9000-options-font-lock-keywords
                nil nil nil nil
                (font-lock-syntactic-face-function
                 . python-font-lock-syntactic-face-function))))

;;;###autoload
(add-to-list 'auto-mode-alist '("options\\.bfg\\'" . bfg9000-options-mode))

(provide 'bfg9000-mode)
;;; bfg9000-mode.el ends here
