-- Pack Path
vim.cmd 'set packpath^=~/.config/nvim'
vim.cmd 'set packpath+=~/.config/nvim/after'
vim.cmd 'set packpath^=~/.local/share/nvim/site'
vim.cmd 'set packpath+=~/.local/share/nvim/site/after'

-- Runtime Path
vim.cmd 'set runtimepath+=~/.config/nvim/after'
vim.cmd 'set runtimepath^=~/.config/nvim'
vim.cmd 'set runtimepath+=~/.local/share/nvim/site/after'
vim.cmd 'set runtimepath^=~/.local/share/nvim/site'

-- Theming and Looks
require 'gebhartn.colorscheme'

-- Plugins
require 'gebhartn.plugins'

-- Autocmds
require 'gebhartn.autocmds'

-- Options
require 'gebhartn.options'

-- Keybindings
require 'gebhartn.keybindings'

-- Commands
require 'gebhartn.commands'
