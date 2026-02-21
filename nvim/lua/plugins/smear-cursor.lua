return {
    "sphamba/smear-cursor.nvim",
    event = "BufEnter",
    config = function()
        require("smear_cursor").setup()
    end,
}
