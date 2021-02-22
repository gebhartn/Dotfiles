local lsp = require 'lspconfig'

local M = {}

local function get_lua_runtime()
    local result = {}
    for _, path in pairs(vim.api.nvim_list_runtime_paths()) do
        local lua_path = path .. '/lua'
        if vim.fn.isdirectory(lua_path) then
            result[lua_path] = true
        end
    end
    result[vim.fn.expand('$VIMRUNTIME/lua')] = true

    return result
end

function M.setup(lsp_opts)
    lsp.sumneko_lua.setup{
        -- on_attach = lsp_opts.on_attach,
        -- capabilities = lsp_opts.capabilities,
        -- version = 'LuaJIT',
        -- path = {
        --     '?.lua',
        --     '?/init.lua',
        -- },
    }
end

return M
