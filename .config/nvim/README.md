## General

This is _highly_ opinionated as the built in LSP requires quite a bit of integration with both your options and keybindings to imitate the out-of-the-box experience you'd get using something like coc.nvim or yvm.

A list of installed language servers and their associated configurations are present inside the plugins directory, along with some formatting/linting rules for the tsserver.

In addition to the globally installed language servers (all of which are present in the lsp/ directory), I am using `eslint_d` and `prettier_d` to get faster linting in typescript.

## Plugins

All of my plugins are managed by the native neovim package manager, but at the time of writing I am using the following:

- completion-nvim
- fzf (and fzf.nvim)
- lsp-status.nvim
- nvim-lspconfig
- nvim-treesitter
- vim-commentary
- vim-surround
- vim-noctu (colorscheme)
