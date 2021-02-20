-- Yank highlight
vim.cmd 'augroup yank_hl'
vim.cmd 'au!'
vim.cmd [[au TextYankPost * silent! lua vim.highlight.on_yank { higroup = 'Search', timeout = 500 }]]
vim.cmd 'augroup END'
