local lsp = require 'lspconfig'

local M = {}

function M.setup(lsp_opts)
	lsp.tsserver.setup {
	    capabilities = lsp_opts.capabilities,
	    on_attach = function(client)
		if client.config.flags then
		    client.config.flags.allow_incremental_sync = true
		end
		client.resolved_capabilities.document_formatting = false
		lsp_opts.on_attach(client)
	    end
	}
end

return M
