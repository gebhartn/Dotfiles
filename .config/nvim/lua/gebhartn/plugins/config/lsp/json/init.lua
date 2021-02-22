local lsp = require 'lspconfig'

local M = {}

function M.setup(lsp_opts)
    lsp.jsonls.setup {
        on_attach = lsp_opts.on_attach,
        capabilities = lsp_opts.capabilities,
    }
end

return M
