## General

This is _highly_ opinionated as the built in LSP requires quite a bit of integration with both your options and keybindings to imitate the out-of-the-box experience you'd get using something like coc.nvim or yvm.

A list of installed language servers and their associated configurations are present inside the plugins directory, along with some formatting/linting rules for the tsserver.

In addition to the globally installed language servers (all of which are present in the lsp/ directory), I am using `eslint_d` and `prettier_d` to get faster linting in typescript.

## Plugins

All of my plugins are managed by the native neovim package manager so their inclusion is not so obvious, but at the time of writing I am using the following:

- completion-nvim [code completion]
- ~~fzf (and fzf.nvim)~~ telescope.nvim (plenary and popup are dependencies) [fuzzyfinder]
- lsp-status.nvim [status line integration]
- nvim-lspconfig [lsp core configurations]
- nvim-treesitter [syntax highlighting]
- vim-commentary [filetype specific commenting rules]
- vim-surround [wrap things in quotes, tags, etc.]
- vim-noctu [colorscheme]

### How to manage plugins this way

You can read more about this with `:h packages`

I use some bash scripts to manage my plugins, define a $PLUG variable in your shrc and use git submodules to manage your intall/updates

An example $PLUG variable:

in your ~/.[shell]rc:
```bash
export PLUG='~/.local/share/nvim/site/pack/'
```

To install a new plugin:
```bash
#!/bin/sh

#
# avp - add vim plugin
#

do_or_die() {
    cd "$PLUG" || exit 1
}

add_plugin() {
    (do_or_die; git submodule add "$1" plugins/start/"$2")
}

main() {
    [ -z "$PLUG" ] && {
        printf '%s\n' "PLUG is not set."
        exit 1
    }

    [ "$1" ] || {
        printf '%s\n' "No plugin repository specified"
        exit 1
    }

    [ "$2" ] || {
        printf '%s\n' "No plugin name specified"
        exit 1
    }

    add_plugin "$@"
}

main "$@"
```

To update:

```bash
#!/bin/sh

#
# plu - plug update
#

do_or_die() {
    cd "$PLUG" || exit 1
}

plug_update() {
    (
    do_or_die
    git submodule update --remote --merge
    git add .
    git commit -m "Bump @ $(date '+%Y/%m/%d %H:%M')"
    )
}


main() {
    [ -z "$PLUG" ] && {
        printf '%s\n "PLUG is not set."'
        exit 1
    }

    plug_update
}

main
```

You'll have to initialize a git repository in the $PLUG directory before these scripts will work


## TODO
- better tabline for all of my trillion terminal instances
    - maybe hotkeys for shit like storybook tab, log tab, etc.
- ~~sumneko's language server doesn't work but it's not like I care~~ it's working but formatting is busted
- lua format ain't it, chief -- this nightmare never ends
    - remove the hacky shell format keybind
- efm is basically just a glorified wrapper around eslint/prettier/(feat: json), should i even be using this?
    - as an aside, the ts language server is horrible and has cracked native linting/configuration defaults that need to be explicitly disabled
- hardly using the lsp-status diagnostics, might be a better way to get this info
- efm seems to hang when exiting typescript projects
