;;; tests.el --- Test suite for emacs-flow-jsx-mode

(require 'ert)
(require 'flow-jsx-mode)

(ert-deftest test-flow-jsx-buffer-uses-flow-p ()
  "Test that `flow-jsx-buffer-uses-flow-p' correctly identifies Flow buffers."
  ;; Setup a test buffer and insert text
  (with-temp-buffer
    (insert "// @flow")
    ;; Run the function under test
    (should (flow-jsx-buffer-uses-flow-p (current-buffer)))
    ;; Test that it returns nil for non-Flow buffers
    (erase-buffer)
    (insert "// not a flow file")
    (should-not (flow-jsx-buffer-uses-flow-p (current-buffer)))))

(ert-deftest test-flow-jsx-mode-keyword-highlighting ()
  "Test that keywords are highlighted in `flow-jsx-mode'."
  ;; Setup a test buffer, switch to flow-jsx-mode, and insert a keyword
  (with-temp-buffer
    (flow-jsx-mode)
    (insert "const")
    ;; Run font-lock to apply syntax highlighting
    (font-lock-ensure)
    ;; Check that the keyword was highlighted
    (should (eq (get-text-property 1 'face) 'font-lock-keyword-face))))

;;; tests.el ends here
