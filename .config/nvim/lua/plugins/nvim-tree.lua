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
                            unstaged = icons.git.change,
                            staged = icons.git.add,
                            unmerged = icons.git.changedelete,
                            renamed = icons.git.changedelete,
                            untracked = icons.git.untracked,
                            deleted = icons.git.delete,
                            ignored = icons.git.changedelete,
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
