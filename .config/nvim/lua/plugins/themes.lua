return {
    {
        "navarasu/onedark.nvim",
        config = function()
            require('onedark').setup {
                style = 'dark'
            }
            require('onedark').load()

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
