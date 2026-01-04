return {
    {
        "folke/tokyonight.nvim",
        config = function()
            vim.cmd.colorschema = "tokyonight"
            vim.api.nvim_set_hl(0,"Normal",{bg = "none"})
        end
    },  
    {
        "nvim-lualine/lualine.nvim",
        dependendies = {
            "nvim-tree/nvim-web-devicons"
        },
        opts = {
            theme = "tokyonight"
        }
    }
}
