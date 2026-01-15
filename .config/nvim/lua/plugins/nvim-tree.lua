return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local icons = require('config.icon')
        require("nvim-tree").setup({
            view = {
                width = 30,
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
                            unstaged = 'M',
                            staged = 'A',
                            unmerged = 'U',
                            renamed = 'R',
                            untracked = '?',
                            deleted = 'D',
                            ignored = 'I',
                        },
                    },
                },
            },
            git = {
                enable = true,
                ignore = false,
            },
            actions = {
                open_file = {
                    -- Keep tree window
                    quit_on_open = false,
                },
            },
        })

        -- Keymaps
        vim.keymap.set('n', '<leader>cd', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })
        vim.keymap.set('n', '<leader>ef', ':NvimTreeFindFile<CR>', { desc = 'Find file in NvimTree' })
    end,
}
