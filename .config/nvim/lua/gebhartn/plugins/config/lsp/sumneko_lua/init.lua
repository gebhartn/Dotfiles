local lsp = require 'lspconfig'

local M = {}

local sumneko_root_path = os.getenv('HOME') .. '/packages/lua-language-server/'
local sumneko_binary = sumneko_root_path .. 'bin/Linux/lua-language-server'

function M.setup(lsp_opts)
    lsp.sumneko_lua.setup{
        on_attach = lsp_opts.on_attach,
        capabilities = lsp_opts.capabilities,
        cmd = {sumneko_binary, '-E', sumneko_root_path .. '/main.lua'},
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT',
                    path = {
                        vim.split(package.path, ';'),
                        '?.lua',
                        '?/init.lua',
                    }
                },
                diagnostics = {
                    globals = {'vim'}
                },
                workspace = {
                    library = {
                        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                    },
                }
            }
        }
    }
end

return M
