local lsp = require "lspconfig"

local M = {}

function M.setup(lsp_opts)
    lsp.gopls.setup {
        capabilities = lsp_opts.capabilities,
        on_attach = function(client)
            lsp_opts.on_attach(client)
            vim.wo.list = false

            client.resolved_capabilities.document_formatting = false
        end,
        cmd = {"gopls", "serve"},
        settings = {
            hoverKind = "FullDocumentation",
            gopls = {
                analyses = {
                    unusedparams = true
                },
                staticcheck = true
            }
        }
    }
end

return M
