return {
    {
        "navarasu/onedark.nvim",
        config = function()
            require('onedark').setup {
                style = 'dark'
            }
            require('onedark').load()
            vim.api.nvim_set_hl(0,"Normal",{bg = "none"})

            local lualine = require("lualine")
            if lualine then
                lualine.setup({ theme = "onedark" })
            end
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "navarasu/onedark.nvim",
        },
    }
}
