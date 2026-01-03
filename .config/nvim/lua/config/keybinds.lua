-- KEYBINDS
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
vim.keymap.set("n", "<leader>rl", "<cmd>source ~/.config/nvim/init.lua<cr>")

vim.keymap.set("n", "<leader>va", "ggVGY")
vim.keymap.set("n", "<leader>yi", "yiw")
vim.keymap.set("n", "<leader>ci", "diw")
