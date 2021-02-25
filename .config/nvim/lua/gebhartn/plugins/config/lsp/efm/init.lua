local current_path = (...):gsub("%.init$", "")

local eslint = require(current_path .. ".linters.eslint")
local golint = require(current_path .. ".linters.golint")
local goimports = require(current_path .. ".linters.goimports")
local rustfmt = require(current_path .. ".linters.rustfmt")

local prettier = require(current_path .. ".formatters.prettier")
local luafmt = require(current_path .. ".formatters.lua_format")
local clangfmt = require(current_path .. ".formatters.clang_format")
local lsp = require "lspconfig"

local format_options_prettier = {
    tabWidth = 4,
    singleQuote = true,
    trailingComma = "all",
    arrowParens = "avoid",
    configPrecedence = "prefer-file"
}

vim.g.format_options_typescript = format_options_prettier
vim.g.format_options_javascript = format_options_prettier
vim.g.format_options_typescriptreact = format_options_prettier
vim.g.format_options_javascriptreact = format_options_prettier
vim.g.json = format_options_prettier

local M = {}

function M.setup(lsp_opts)
    lsp.efm.setup {
        capabilities = lsp_opts.capabilities,
        on_attach = function(client)
            client.resolved_capabilities.document_formatting = true
            lsp_opts.on_attach(client)
        end,
        init_options = {documentFormatting = true},
        settings = {
            rootMarkers = {".git/"},
            languages = {
                rust = {rustfmt},
                proto = {clangfmt},
                go = {golint, goimports},
                lua = {luafmt},
                json = {prettier},
                typescript = {prettier, eslint},
                javascript = {prettier, eslint},
                typescriptreact = {prettier, eslint},
                javascriptreact = {prettier, eslint},
                ["javascript.jsx"] = {prettier, eslint},
                ["typescript.tsx"] = {prettier, eslint}
            }
        }
    }
end

return M
