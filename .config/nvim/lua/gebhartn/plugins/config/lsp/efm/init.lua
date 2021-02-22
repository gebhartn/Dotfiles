local current_path = (...):gsub("%.init$", "")

local eslint = require(current_path .. ".linters.eslint")
local prettier = require(current_path .. ".formatters.prettier")
local luafmt = require(current_path .. ".formatters.lua_format")
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

local function eslint_config_exists()
    local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)

    if not vim.tbl_isempty(eslintrc) then
        return true
    end

    if vim.fn.filereadable("package.json") == 1 then
        if vim.fn.json_decode(vim.fn.readfile("package.json"))["eslintConfig"] then
            return true
        end
    end

    return false
end

function M.setup(lsp_opts)
    lsp.efm.setup {
        capabilities = lsp_opts.capabilities,
        on_attach = function(client)
            client.resolved_capabilities.document_formatting = true
            lsp_opts.on_attach(client)
        end,
        init_options = {documentFormatting = true},
        rootMarkers = {".git/"},
        root_dir = function()
            if not eslint_config_exists() then
                return nil
            end
            return vim.fn.getcwd()
        end,
        settings = {
            languages = {
                json = {prettier},
                typescript = {prettier, eslint},
                javascript = {prettier, eslint},
                typescriptreact = {prettier, eslint},
                javascriptreact = {prettier, eslint},
                ["javascript.jsx"] = {prettier, eslint},
                ["typescript.tsx"] = {prettier, eslint},
                lua = {luafmt}
            }
        }
    }
end

return M
