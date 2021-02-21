local current_path = (...):gsub('%.init$', '')

local completion = require 'completion'
local lsp = require 'lspconfig'
local lsp_status = require 'lsp-status'
local utils = require 'gebhartn.utils'

_G.formatting = function()
    if not vim.g[string.format("format_disabled_%s", vim.bo.filetype)] then
        vim.lsp.buf.formatting(vim.g[string.format("format_options_%s", vim.bo.filetype)] or {})
    end
end

-- Shared on_attach configuration
local on_attach = function(client)
    print('Attached to ' .. client.name)

    completion.on_attach(client)
    lsp_status.on_attach(client)

    if client.resolved_capabilities.document_formatting then
        vim.cmd [[augroup Format]]
        vim.cmd [[autocmd! * <buffer>]]
        vim.cmd [[autocmd BufWritePost <buffer> lua formatting()]]
        vim.cmd [[augroup END]]
    end

    vim.cmd [[augroup HoverDiagnostics']]
    vim.cmd [[au!]]
    vim.cmd [[au CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()]]
    vim.cmd [[augroup END]]
end

-- Diagnostics
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        update_in_insert = true,
    }
)

-- Typescript
require (current_path .. '.tsserver').setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities,
}

-- Rust
require (current_path .. '.rust').setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities,
}

-- Golang
require (current_path .. '.go').setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities,
}

-- GraphQL
require (current_path .. '.graphql').setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities,
}

-- Linting
require (current_path .. '.efm').setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities,
}
