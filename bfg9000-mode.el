;;; bfg9000-mode.el --- Major mode for bfg9000 files -*- lexical-binding: t -*-

;; Copyright (C) 2021 Jim Porter

;; Author: Jim Porter
;; URL: https://github.com/jimporter/bfg9000-mode
;; Version: 0.1-dev
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

;; Major mode for editing bfg9000 files.

;;; Code:

(require 'python)

;;;###autoload
(add-to-list 'auto-mode-alist (cons (purecopy "\\.bfg\\'") 'bfg9000-mode))

(defvar bfg9000-font-lock-keywords-level-1
  python-font-lock-keywords-level-1
  "Font lock keywords to use in `bfg9000-mode' for level 1 decoration.

This is the minimum decoration level, equivalent to
`python-font-lock-keywords-level-1'.")

(defvar bfg9000--font-lock-extra-keywords-level-2
  `((,(rx symbol-start
          (or
           ;; Functions
           "alias" "argument" "auto_file" "bfg9000_required_version"
           "boost_package" "build_step" "command" "compile_options" "compiler"
           "copy_file" "copy_files" "debug" "default" "directory" "executable"
           "export" "extra_dist" "filter_by_platform" "find_files" "find_paths"
           "framework" "generated_source" "generated_sources" "generic_file"
           "global_link_options" "global_options" "header_directory"
           "header_file" "info" "install" "install_dirs" "lib_options" "library"
           "link_options" "linker" "man_page" "module_def_file" "object_file"
           "object_files" "package" "path_exists" "pkg_config"
           "precompiled_header" "project" "relpath" "runner" "safe_format"
           "safe_str" "shared_library" "source_file" "static_library"
           "submodule" "system_executable" "target_platform" "test" "test_deps"
           "test_driver" "warning" "which" "whole_archive"
           ;; Values
           "__bfg9000__" "argv" "bfg9000_version" "env" "environ" "opts"
           "srcdir")
          symbol-end)
     . font-lock-builtin-face))
  "Extra font lock keywords to use in `bfg9000-mode' for level 2 decoration.

Only builtin functions and values are included here.")

(defvar bfg9000-font-lock-keywords-level-2
  `(,@python-font-lock-keywords-level-2
    ,@bfg9000--font-lock-extra-keywords-level-2)
  "Font lock keywords to use in `bfg9000-mode' for level 2 decoration.

This is the medium decoration level, equivalent to
`python-font-lock-keywords-level-2', plus bfg9000-specific builtin
functions and values.")

(defvar bfg9000--font-lock-extra-keywords-maximum-decoration
  `((,(rx symbol-start
          (or
           ;; Enums
           "FindResult" "InstallRoot" "Root")
          symbol-end)
     . font-lock-constant-face)
    (,(rx symbol-start
          (or
           ;; Exceptions
           "CalledProcessError" "NonGlobError" "PackageResolutionError"
           "PackageVersionError" "ToolNotFoundError" "VersionError"
           ;; Types
           "Path")
          symbol-end)
     . font-lock-type-face))
  "Extra font lock keywords to use in `bfg9000-mode' for maximum decoration.

Builtin enums, exceptions, and types are included here.")

(defvar bfg9000-font-lock-keywords-maximum-decoration
  `(,@python-font-lock-keywords-maximum-decoration
    ,@bfg9000--font-lock-extra-keywords-level-2
    ,@bfg9000--font-lock-extra-keywords-maximum-decoration)
  "Font lock keywords to use in `bfg9000-mode' for maximum decoration.

This decoration level is equivalent to
`python-font-lock-keywords-maximum-decoration', plus bfg9000-specific
enums, exceptions, and types.")

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

(provide 'bfg9000-mode)
;;; bfg9000-mode.el ends here
