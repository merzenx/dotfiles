return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
	dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
	branch = "main",
        config = function()
            local configs = require("nvim-treesitter.config")
            configs.setup({
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                        },
                    },
                },
                highlight = {
                    enable = true,
                },
                indent = { enable = true },
                autotag = { enable = true },
                ensure_installed = {
                    "json",
                    "python",
                    "ron",
                    "javascript",
                    "haskell",
                    "typescript",
                    "tsx",
                    "rust",
                    "zig",
                    "yaml",
                    "html",
                    "css",
                    "markdown",
                    "markdown_inline",
                    "bash",
                    "lua",
                    "vim",
                    "vimdoc",
                    "c",
                    "dockerfile",
                    "gitignore",
                    "astro",
                },
                auto_install = false,
            })
        end
    }
}
