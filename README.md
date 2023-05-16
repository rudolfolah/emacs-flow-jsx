# emacs-flow-jsx

Emacs mode for handling JavaScript that uses Flow type annotations and
has some React JSX syntax in it.

It is a *major* mode that is a replacement for js2-mode and js-mode.

# Installation and Setup

Load the emacs file:

    (load-file "/path/to/emacs-flow-jsx/emacs-flow-jsx-mode.el")

Add a hook for javascript:

    ;; TODO

There are functions for checking whether a file uses the flow type annotations or the flow type checker and whether it uses the react JSX syntax.

## Testing

The provided tests for `emacs-flow-jsx-mode` are basic and only cover a small part of the mode's functionality.

To run the tests, follow the steps below:

### Running Tests within Emacs

1. Open Emacs.
2. Run the command `M-x ert`.
3. When prompted, enter `t` to run all tests.

### Running Tests from the Command Line

1. Open a terminal.
2. Navigate to the package directory
3. Run the following command: `emacs -batch -l ert -l tests.el -f ert-run-tests-batch-and-exit`

# License and Copyright

Licensed under the GNU GPL version 3 or later, see [LICENSE](./LICENSE)

Copyright (C) 2023 Rudolf Olah
