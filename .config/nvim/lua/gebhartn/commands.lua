-- Quickly check configuration
vim.cmd 'command! Config edit $MYVIMRC'
vim.cmd [[command! ConfigReload lua require'gebhartn.utils'.reload_config()]]

-- 200 WPM config
vim.cmd "command! -nargs=* W w"
vim.cmd "command! -nargs=* Wq wq"
vim.cmd "command! -nargs=* Q q"

-- Toggle Markdown/JSON quotes
vim.cmd [[command! ToggleConceal lua require'gebhartn.utils'.toggle_conceal()]]
