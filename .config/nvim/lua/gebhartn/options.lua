vim.cmd "filetype plugin indent on"

-- Completion
vim.o.completeopt = "menuone,noinsert"
vim.o.shortmess = vim.o.shortmess .. "c"

-- Search
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Indents
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.tabstop = 4
vim.bo.expandtab = true
vim.bo.autoindent = true

-- Line options
vim.o.showmatch = true

-- Lazy
vim.o.lazyredraw = true

-- Status line
vim.o.ruler = true
vim.o.showmode = false
vim.o.laststatus = 2
vim.o.statusline = [[%!luaeval("require'gebhartn.statusline'.render()")]]

-- Better display
vim.wo.signcolumn = "no"
vim.o.cmdheight = 2
vim.o.hidden = true
vim.o.pumheight = 10

-- File types
vim.o.encoding = "utf8"
vim.o.ffs = "unix,dos,mac"

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
vim.wo.list = true
vim.o.listchars = string.format("tab:» ,extends:›,precedes:‹,nbsp:·,trail:·")
vim.o.fillchars = vim.o.fillchars .. string.format("vert: ,eob: ")

-- System clipboard
vim.o.clipboard = vim.o.clipboard .. "unnamedplus"

-- Misc
vim.wo.wrap = false
vim.o.spell = false
vim.wo.number = true
