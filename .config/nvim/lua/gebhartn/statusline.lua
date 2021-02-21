local lsp_status = require 'lsp-status'
local M = {}

local function cursor_mode()
    local mode_map = {
        ['n'] = 'normal',
        ['v'] = 'visual',
        ['V'] = 'visual',
        [''] = 'visual',
        ['i'] = 'insert',
        ['ic'] = 'insert',
        ['ix'] = 'insert',
        ['R'] = 'replace',
        ['Rv'] = 'replace',
        ['c'] = 'command',
    }
    local m = vim.api.nvim_get_mode()
    local current_mode = mode_map[m.mode]

    return string.format(' %s ', current_mode)
end

local function filename()
    local bufname = vim.fn.expand('%:t')

    if bufname == '' then
        return ''
    end

    return string.format('%s ', bufname)
end

local function lsp()
    local diagnostics = lsp_status.diagnostics()
    if diagnostics.errors > 0 or diagnostics.warnings > 0 then
        return string.format('LSP %d %d ', diagnostics.errors, diagnostics.warnings)
    else
        return 'LSP '
    end
end

-- Render the statusline
function M.render()
    local status = ''

    -- left side
    status = status .. '%1*'
    status = status .. cursor_mode()
    status = status .. '%7*'
    status = status .. filename()
    status = status .. '%8*' .. ' '
    status = status .. '%*%-m %-r'

    -- right side
    status = status .. '%='
    status = status .. ' %l/%L '
    status = status .. '%9*'
    status = status .. '%3* '
    status = status .. lsp() .. '%*'

    return status
end

return M
