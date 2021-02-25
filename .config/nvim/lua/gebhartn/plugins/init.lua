local current_path = (...):gsub("%.init$", "")

-- Plugin config
require(current_path .. ".config.lsp")
require(current_path .. ".config.treesitter")
require(current_path .. ".config.telescope")
require(current_path .. ".config.nerdtree")
require(current_path .. ".config.tabulous")
