-- Yank highlight
vim.cmd [[augroup yank_hl]]
vim.cmd [[au!]]
vim.cmd [[au TextYankPost * silent! lua vim.highlight.on_yank { higroup = 'Search', timeout = 300 }]]
vim.cmd [[augroup END]]

-- Trim hanging whitespace
vim.cmd [[au BufWritePre * %s/\s\+$//e]]

-- Start NERDTree when vim is started without file arguments
vim.cmd [[autocmd StdinReadPre * lua vim.s.std_in = 1]]
vim.cmd [[autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif]]
