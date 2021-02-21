local lsp = require 'lspconfig'

local M = {}

function goimports(timeoutms)
    local context = { source = { organizeImports = true } }
    vim.validate { context = { context, "t", true } }
    local params = vim.lsp.util.make_range_params()
    params.context = context

    local method = "textDocument/codeAction"
    local resp = vim.lsp.buf_request_sync(0, method, params, timeoutms)
    if resp and resp[1] then
        local result = resp[1].result
        if result and result[1] then
            local edit = result[1].edit
            vim.lsp.util.apply_workspace_edit(edit)
        end
    end

    vim.lsp.buf.formatting()
end

function M.setup(lsp_opts)
	lsp.gopls.setup { 
		capabilities = lsp_opts.capabilities,
		on_attach = function(client)
		vim.cmd[[autocmd BufWritePre *.go lua goimports(1000)]]
		lsp_opts.on_attach(client)
	    end,
	    cmd = {"gopls", "serve"},
	    settings = {
		hoverKind = "FullDocumentation",
		gopls = {
		    analyses = {
			unusedparams = true,
		    },
		    staticcheck = true,
		},
	    }
	}
end

return M
