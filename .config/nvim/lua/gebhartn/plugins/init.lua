local current_path = (...):gsub('%.init$', '')

-- Plugin config
require(current_path .. '.config.lsp')
require(current_path .. '.config.treesitter')
