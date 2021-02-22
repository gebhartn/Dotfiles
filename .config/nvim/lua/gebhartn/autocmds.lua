-- Yank highlight
vim.cmd [[augroup yank_hl]]
vim.cmd [[au!]]
vim.cmd [[au TextYankPost * silent! lua vim.highlight.on_yank { higroup = 'Search', timeout = 300 }]]
vim.cmd [[augroup END]]


-- Trim hanging whitespace
vim.cmd [[augroup trim_whitespace]]
vim.cmd [[au!]]
vim.cmd [[au BufWritePre * %s/\s\+$//e]]
vim.cmd [[augroup END]]
