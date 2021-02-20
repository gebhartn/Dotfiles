local utils = require 'gebhartn.utils'

vim.cmd 'filetype plugin indent on'

-- Completion
vim.o.completeopt = 'menuone,noinsert'
vim.o.shortmess = vim.o.shortmess .. 'c'

-- Search
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Indents
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true

-- Line options
vim.o.showmatch = true

-- Lazy
vim.o.lazyredraw = true

-- Status line
vim.o.ruler = true
vim.o.showmode = false
vim.o.laststatus = 2

-- Better display
vim.wo.signcolumn = 'no'
vim.o.cmdheight = 2
vim.o.hidden = true
vim.o.pumheight = 10

-- File types
vim.o.encoding = 'utf8'
vim.o.ffs = 'unix,dos,mac'

-- Hover update debouncer
vim.o.updatetime = 300

-- File changes
vim.o.autowrite = true
vim.o.autoread = true
vim.o.backup = false
vim.o.writebackup = false
vim.bo.swapfile = false

-- Pattern matching
vim.o.maxmempattern = 20000
vim.o.magic = true

-- List characters
vim.o.list = true
vim.o.listchars = 'tab:»\\ ,extends:›,precedes:‹,nbsp:·,trail:·'
vim.o.fillchars = vim.o.fillchars .. string.format('vert:%s', utils.tt' ,')
vim.o.fillchars = vim.o.fillchars .. string.format('eob:%s', utils.tt' ,')

-- System clipboard
vim.o.clipboard = vim.o.clipboard .. 'unnamedplus'

vim.o.wrap = false
vim.o.spell = false
