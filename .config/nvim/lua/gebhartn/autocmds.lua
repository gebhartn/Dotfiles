-- Trim hanging whitespace
vim.cmd [[au BufWritePre * %s/\s\+$//e]]

-- Start NERDTree when vim is started without file arguments
vim.cmd [[autocmd StdinReadPre * lua vim.s.std_in = 1]]
vim.cmd [[autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif]]
