local lsp = require 'lspconfig'

local M = {}

function M.setup(lsp_opts)
	lsp.rust_analyzer.setup({
	    on_attach = lsp_opts.on_attach,
	    settings = {
		["rust-analyzer"] = {
		    assist = {
			importMergeBehavior = "last",
			importPrefix = "by_self"
		    },
		    cargo = {
			loadOutFirsFromCheck = true
		    },
		    procMacro = {
			enable = true
		    },
		}
	    }
	})
end

return M
