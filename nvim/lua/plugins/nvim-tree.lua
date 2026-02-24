return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local icons = require('config.icon')
        require("nvim-tree").setup({
            view = {
                width = 35,
                side = "left",
            },
            renderer = {
                icons = {
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                        git = true,
                    },
                    glyphs = {
                    git = {
                        unstaged = '',
                        staged = '',
                        unmerged = '',
                        renamed = '➜',
                        untracked = '',
                        deleted = '',
                        ignored = '',
                    },
                    },
                },
            },
            git = {
                enable = true,
                ignore = false,
            },
            filters = {
                dotfiles = false,
                git_ignored = false,
                custom = { "^.git$" },
            },
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
        })

        -- Keymaps
        vim.keymap.set('n', '<leader>cd', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })
        vim.keymap.set('n', '<leader>ef', ':NvimTreeFindFile<CR>', { desc = 'Find file in NvimTree' })
    end,
}
