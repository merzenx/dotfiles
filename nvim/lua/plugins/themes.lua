 return {
    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     priority = 1000,
    --     config = function()
    --         require("catppuccin").setup({
    --             flavour = "mocha",
    --             transparent_background = true,
    --             -- background = { 
    --             --     light = "latte",
    --             --     dark = "mocha",
    --             -- },
    --             show_end_of_buffer = false,
    --             term_colors = false,
    --             dim_inactive = {
    --                 enabled = false, 
    --                 shade = "dark",
    --                 percentage = 0.15,
    --             },
    --             no_italic = false,
    --             no_bold = false, 
    --             no_underline = false,
    --             styles = { 
    --                 comments = { "italic" }, 
    --                 conditionals = { "italic" },
    --                 loops = {},
    --                 functions = {},
    --                 keywords = {},
    --                 strings = {},
    --                 variables = {},
    --                 numbers = {},
    --                 booleans = {},
    --                 properties = {},
    --                 types = {},
    --                 operators = {},
    --             },
    --             color_overrides = {},
    --             custom_highlights = {},
    --             integrations = {
    --                 cmp = true,
    --                 gitsigns = true,
    --                 nvimtree = true,
    --                 treesitter = true,
    --                 notify = false,
    --                 mini = {
    --                     enabled = true,
    --                     indentscope_color = "",
    --                 },
    --             },
    --         })
    --
    --         vim.cmd.colorscheme "catppuccin"
    --
    --         local lualine = require("lualine")
    --         if lualine then
    --             lualine.setup({ theme = "gruvbox" })
    --         end
    --     end
    -- },
    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                terminal_colors = true,
                undercurl = true,
                underline = true,
                bold = true,
                italic = {
                    strings = true,
                    emphasis = true,
                    comments = true,
                    operators = false,
                    folds = true,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true,
                contrast = "",
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = false,
            })
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
             -- "catppuccin/nvim",
            "ellisonleao/gruvbox.nvim",
        },
    }
}
