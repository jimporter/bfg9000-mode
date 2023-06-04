;;; bfg9000-keywords.el --- bfg9000 keywords -*- lexical-binding: t -*-

;; Copyright (C) 2021-2023 Jim Porter

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

;; WARNING: This file is auto-generated!
;; Use "make bfg9000-keywords.el" to regenerate it.

;;; Code:

(defvar bfg9000--function-keywords
  '("alias" "auto_file" "bfg9000_required_version" "boost_package" "build_step"
    "command" "copy_file" "copy_files" "debug" "default" "directory"
    "executable" "export" "extra_dist" "filter_by_platform" "find_files"
    "find_paths" "framework" "generated_source" "generated_sources"
    "generic_file" "global_link_options" "global_options" "header_directory"
    "header_file" "info" "install" "library" "man_page" "module_def_file"
    "object_file" "object_files" "package" "path_exists" "pkg_config"
    "precompiled_header" "project" "relpath" "safe_format" "safe_str"
    "shared_library" "source_file" "static_library" "submodule"
    "system_executable" "test" "test_deps" "test_driver" "warning"
    "whole_archive")
  "List of built-in function names for `bfg9000-mode'.")

(defvar bfg9000--value-keywords
  '("__bfg9000__" "argv" "bfg9000_version" "env" "opts")
  "List of built-in value names for `bfg9000-mode'.")

(defvar bfg9000--enum-keywords
  '("FindResult" "InstallRoot" "Root")
  "List of built-in enum names for `bfg9000-mode'.")

(defvar bfg9000--exception-keywords
  '("CalledProcessError" "NonGlobError" "PackageResolutionError"
    "PackageVersionError" "ToolNotFoundError" "VersionError")
  "List of built-in exception names for `bfg9000-mode'.")

(defvar bfg9000--type-keywords
  '("Path")
  "List of built-in type names for `bfg9000-mode'.")

(defvar bfg9000-options--function-keywords
  '("argument" "bfg9000_required_version" "debug" "export" "info" "path_exists"
    "relpath" "safe_format" "safe_str" "submodule" "warning")
  "List of built-in function names for `bfg9000-options-mode'.")

(defvar bfg9000-options--value-keywords
  '("__bfg9000__" "bfg9000_version" "env")
  "List of built-in value names for `bfg9000-options-mode'.")

(defvar bfg9000-options--enum-keywords
  '("InstallRoot" "Root")
  "List of built-in enum names for `bfg9000-options-mode'.")

(defvar bfg9000-options--exception-keywords
  '("CalledProcessError" "NonGlobError" "PackageResolutionError"
    "PackageVersionError" "ToolNotFoundError" "VersionError")
  "List of built-in exception names for `bfg9000-options-mode'.")

(defvar bfg9000-options--type-keywords
  '("Path")
  "List of built-in type names for `bfg9000-options-mode'.")

(provide 'bfg9000-keywords)
;;; bfg9000-keywords.el ends here
