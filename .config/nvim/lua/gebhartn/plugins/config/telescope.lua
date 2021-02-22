local telescope = require 'telescope'
local telescope_builtin = require 'telescope.builtin'
local telescope_actions = require 'telescope.actions'
local M = {}

telescope.setup {
    defaults = {
        layout_strategy = 'vertical',
        use_less = false,
        mappings = {
            i = {
                ['<C-k>'] = telescope_actions.move_selection_previous,
                ['<C-j>'] = telescope_actions.move_selection_next
            }
        }
    }
}

-- I only use this to fuzzyfind in my vim config
function M.find_files()
    local config_dir = os.getenv('HOME') .. '/.config/nvim'
    telescope_builtin.find_files {
        prompt_position = 'bottom',
        find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden', '.', config_dir },
        previewer = false
    }
end

-- Use this for projet traversal
function M.git_files()
    telescope_builtin.git_files {
        prompt_position = 'bottom',
        previewer = false
    }
end

function M.live_grep()
    telescope_builtin.live_grep {
        prompt_position = 'bottom',
    }
end

return M
