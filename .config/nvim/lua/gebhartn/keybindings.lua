local utils = require 'gebhartn.utils'

vim.g.mapleader = ' '

-- Unbind default bindings for arrow keys
utils.vnoremap('<up>',    '<nop>')
utils.vnoremap('<down>',  '<nop>')
utils.vnoremap('<left>',  '<nop>')
utils.vnoremap('<right>', '<nop>')

utils.inoremap('<up>',    '<nop>')
utils.inoremap('<down>',  '<nop>')
utils.inoremap('<left>',  '<nop>')
utils.inoremap('<right>', '<nop>')

-- Enter normal mode
utils.inoremap('jk', '<ESC>')

-- Map escape from terminal input to Normal mode
utils.tnoremap('<ESC>', [[<C-\><C-n>]])
utils.tnoremap('<C-[>', [[<C-\><C-n>]])

-- Hide highlights
utils.nnoremap('<leader><CR>', ':noh<CR>')

-- Reload file
utils.nnoremap('<leader>r', ':e!<CR>')

-- Reload config
utils.nnoremap('<leader>vs', '<cmd>ConfigReload<CR>')

-- LSP
utils.nnoremaps('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
utils.nnoremaps('gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
utils.nnoremaps('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
utils.nnoremaps('K', '<cmd>lua vim.lsp.buf.hover()<CR>')
utils.nnoremaps('qf', '<cmd>lua vim.lsp.buf.code_action()<CR>')
utils.nnoremaps('<leader>le', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
utils.nnoremaps('gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
