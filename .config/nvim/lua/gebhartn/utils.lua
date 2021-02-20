local M = {}

local function map(type, input, output)
    vim.api.nvim_set_keymap(type, input, output, {})
end

local function noremap(type, input, output)
    vim.api.nvim_set_keymap(type, input, output, { noremap = true })
end

local function snoremap(type, input, output)
    vim.api.nvim_set_keymap(type, input, output, { silent = true })
end

function M.nnoremap(input, output) noremap('n', input, output) end

function M.inoremap(input, output) noremap('i', input, output) end

function M.vnoremap(input, output) noremap('v', input, output) end

function M.tnoremap(input, output) noremap('t', input, output) end


function M.nnoremaps(input, output) snoremap('n', input, output) end

function M.inoremaps(input, output) snoremap('i', input, output) end

function M.vnoremaps(input, output) snoremap('v', input, output) end

function M.tnoremaps(input, output) snoremap('t', input, output) end


function M.nmap(input, output) map('n', input, output) end

function M.imap(input, output) map('i', input, output) end

function M.vmap(input, output) map('v', input, output) end

function M.tmap(input, output) map('t', input, output) end


function M.reload_config()
    for k, v in pairs(package.loaded) do
        if string.match(k, "^creativenull") then
            package.loaded[k] = nil
        end
    end

    vim.cmd 'luafile $MYVIMRC'
end

function M.toggle_conceal()
    if vim.wo.conceallevel == 2 then
        vim.wo.conceallevel = 0
    else
        vim.wo.conceallevel = 2
    end
end

function M.tt(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

return M


