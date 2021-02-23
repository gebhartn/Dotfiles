## General

This is _highly_ opinionated as the built in LSP requires quite a bit of integration with both your options and keybindings to imitate the out-of-the-box experience you'd get using something like [CoC][coc] or [YCM][ycm].

Despite what seems like a lot of configuration, I'd consider this to be a pretty minimalist working environment for software development. There is no _bespoke_ compiler integration, no git integration, no testing suite, and no diff tool (aside from the native vim diff). These things (particularly testing/diffing) might be implemented at a later date.

A list of installed language servers and their associated configurations are required in the lsp/ directory, along with some formatting/linting configurations for the associated filetypes.

In addition to the globally installed language servers you will need to install several binaries to execute format actions on a given filetype.

## Plugins

All of my plugins are managed by the native neovim package manager, and aside from the plugins that have explicit configuration files, the additional plugins I am using are not immediately obvious.

At the time of writing, I am using the following:

- completion-nvim [code completion]
- telescope.nvim (plenary and popup are dependencies) [fuzzyfinder]
- lsp-status.nvim [status line integration]
- nvim-lspconfig [lsp core configurations]
- nvim-treesitter [syntax highlighting]
- vim-commentary [filetype specific commenting rules]
- vim-surround [wrap things in quotes, tags, etc.]
- vim-noctu [colorscheme]

### How to manage plugins this way

You can read more about this with `:h packages`

I use some bash scripts to manage my plugins, define a $PLUG variable in your shrc and use git submodules to manage the installation and updates of various plugins. These can be found in the [bin][bin] directory.

An example $PLUG variable:

in your ~/.[bash/zsh/sh]rc:
```bash
export PLUG='~/.local/share/nvim/site/pack/'
```

You'll have to initialize a git repository in the $PLUG directory before these scripts will work.

## TODO
- Extend the tabline to multiplex terminal instances
- Hardly using lsp-status diagnostics, might be a better way to get this info.

[coc]: https://github.com/neoclide/coc.nvim
[ycm]: https://github.com/ycm-core/YouCompleteMe
[bin]: ./bin
