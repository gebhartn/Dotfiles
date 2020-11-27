syntax enable

filetype plugin indent on

set nocompatible

set autowrite

set encoding=utf8

set hidden

set cmdheight=2

set updatetime=300

set shortmess+=c

set noshowmode

set autoread

set ruler

set magic

set signcolumn=no

set hlsearch

set tabstop=2

set softtabstop=2

set noexpandtab

set shiftwidth=2

set autoindent

set nonumber

set lazyredraw

set ffs=unix,dos,mac

set wrap

set pumheight=10

set nobackup

set nowritebackup

set noswapfile

set maxmempattern=20000

set completeopt-=preview

set list

set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

set fillchars+=eob:\ ,

set fillchars+=vert:\ ,

set clipboard+=unnamedplus

:command W w

:command Q q

:command Wq wq

:command WQ wq

inoremap jk <ESC>

tnoremap <Esc> <C-\><C-n>

nnoremap ; :

nnoremap <C-p> :GFiles<CR>

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

nmap <silent> gd <Plug>(coc-definition)

nmap <silent> gy <Plug>(coc-type-definition)

nmap <silent> gi <Plug>(coc-implementation)

nmap <silent> gr <Plug>(coc-references)

nmap <leader>qf <Plug>(coc-fix-current)

map <C-n> :NERDTreeToggle<CR>

nmap <silent> <C-b> :TestNearest<CR>

nmap <silent> <C-a> :TestFile<CR>

nmap <silent> <C-s> :!%:p<CR>

xmap <C-f>  <Plug>(coc-format-selected)

nmap <C-f>  <Plug>(coc-format-selected)

autocmd BufWritePre * %s/\s\+$//e

autocmd StdinReadPre * let s:std_in=1

autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

augroup filespecific
  autocmd!
  au BufRead,BufNewFile *.js setlocal filetype=typescript

  au BufRead,BufNewFile *.jsx setlocal filetype=typescript.tsx

  au BufRead,BufNewFile *.ts set ft=typescript

  au FileType go set noet nolist

  au FileType python setl ts=4
augroup END

colorscheme cs

hi MatchParen cterm=bold ctermbg=none ctermfg=none

hi link CocFloating markdown

let g:go_def_mapping_enabled = 0

let g:NERDTreeMinimalUI = 1

let g:NERDTreeShowHidden = 1

let g:NERDTreeShowLineNumbers = 0

let g:NERDTreeCascadeSingleChildDir = 0

let g:NERDTreeDirArrowExpandable = "•"

let g:NERDTreeDirArrowCollapsible = "•"

let g:NERDTreeHighlightCursorline = 0

let g:NERDTreeWinSize = 31

let g:test#javascript#runner = 'jest'

luafile ~/.config/nvim/nvim-treesitter.lua

source ~/.config/nvim/functions.vim
