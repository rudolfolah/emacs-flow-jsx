;;; emacs-flow-jsx-mode.el --- Major mode for Flow/JSX

;; Copyright (C) 2016 Rudolf Olah

;; Author: Rudolf Olah <omouse@gmail.com>

;; This file is not part of GNU Emacs.

;; URL: https://gitlab.com/rudolfo/emacs-flow-jsx
;; Keywords: languages javascript react flow

;;;; Commentary:

;; Emacs Flow JSX Mode is based on Java mode. It adds keyword
;; highlighting for flow type annotiations and react's JSX syntax.

;;; License:

;; This program is free software: you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation, either version 3 of the
;; License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this file. If not, see <http://www.gnu.org/licenses/>.

;;; Code:

(defgroup flow-jsx nil
  "Major mode for Flow and JSX (JavaScript)."
  :prefix "flow-jsx-"
  :group 'languages
  :link '(url-link :tag "Gitlab" "https://gitlab.com/rudolfo/emacs-flow-jsx")
  :link '(emacs-commentary-link :tag "Commentary" "flow-jsx-mode"))

(defface flow-jsx-jsx
  '((t (:foreground "goldenrod")))
  "Face for JSX syntax.")

(defface flow-jsx-flow-type-annotation
  '((t (:box "goldenrod")))
  "Face for Flow Type Annotations syntax.")

(defun flow-jsx-buffer-uses-flow-p (buffer)
  "Returns T if the `BUFFER' is using the Flow type
checker. Otherwise returns NIL."
  (save-excursion
    (goto-char (point-min))
    (not (null (search-forward "@flow" nil t)))))

;; Using it for the current buffer:
;;   (flow-jsx-buffer-uses-flow-p (current-buffer))

(setq flow-jsx-keyword-list
      '("const"
        "import"
        "from"
        "type"
        "export"
        "export default"
        "class"
        "extends"
        "this"
        "if"
        "else"
        "for"
        "while"
        "let"
        "=>"
        "return"
        "function"
        "static"
        ))

(setq flow-jsx-font-lock-list
      '(
        ("import {?\\(.+?\\)}? from" 1 font-lock-variable-name-face)
        ("import .* from \\(.*\\);" 1 font-lock-string-face)
        ("import \\('.+'\\);" 1 font-lock-string-face)
        ("undefined" 0 font-lock-constant-face)
        ("null" 0 font-lock-constant-face)
        ("window" 0 font-lock-constant-face)
        ("false" 0 font-lock-constant-face)
        ("true" 0 font-lock-constant-face)
        ("const \\(.+?\\) =" 1 font-lock-variable-name-face)
        ("type \\(.+?\\) =" 1 font-lock-variable-name-face)
        ;; Strings
        ("`.*`" 0 font-lock-string-face)
        ("'.*'" 0 font-lock-string-face)
        ("\".*\"" 0 font-lock-string-face)
        ;; Classes
        ("class" (0 font-lock-keyword-face)
         ("\\(.*\\) extends" nil nil (1 font-lock-variable-name-face))
         )
        ;; Methods
        ("\\(.*\\)(.*{" 1 font-lock-variable-name-face)
        ;; Flow Type Annotations
        ("(.*:\\W*\\(.*\\))" 1 'flow-jsx-flow-type-annotation)
        ("[[:alpha:]][[:alnum:]]+<.+?>" 0 'flow-jsx-flow-type-annotation)
        ("("
         (": \\(\\?\\w+\\)" nil nil 1 'flow-jsx-flow-type-annotation)
         (": \\({.*}\\)" nil nil 1 'flow-jsx-flow-type-annotation)
         (": \\([[:alpha:]][[:alnum:]]+\\)[,;]" nil nil 1 'flow-jsx-flow-type-annotation)
         ("):\\s*\\(.*\\) {" nil nil 1 'flow-jsx-flow-type-annotation)
         )
        ;; JSX
        ("\\S+<\\w+" (0 'flow-jsx-jsx)
         (">" nil nil (0 'flow-jsx-jsx))
         )
        ("/>" 0 'flow-jsx-jsx)
        ("</\\w+>" 0 'flow-jsx-jsx)
        ("\\(\\w+\\)="  1 'flow-jsx-jsx)
        ))

;;;###autoload
(define-generic-mode flow-jsx-mode
  '(("//" . nil)
    ("/*" . "*/"))
  flow-jsx-keyword-list
  flow-jsx-font-lock-list
  '()
  '()
  "Major mode for Flow and JSX (JavaScript).")

(provide 'flow-jsx-mode)
;;; emacs-flow-jsx-mode.el ends here
