return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
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
                },
            },
            git = {
                enable = true,
                ignore = false,
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