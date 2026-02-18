-- KEYBINDS
vim.g.mapleader = " "
vim.g.maplocalleader = " "


vim.keymap.set("n", "<leader>rl", "<cmd>source ~/.config/nvim/init.lua<cr>")

vim.keymap.set("n", "<leader>va", "ggVGY")
vim.keymap.set("n", "<leader>yi", "yiw")
vim.keymap.set("n", "<leader>ci", "diw")
vim.keymap.set("n", "<leader>ee", "$")
vim.keymap.set("n", "<leader>ww", "^")
vim.keymap.set("n", "<leader>s", "<cmd>write<CR>")

vim.g.clipboard = {
  name = 'wl-clipboard',
  copy = {
    ['+'] = 'wl-copy',
    ['*'] = 'wl-copy',
  },
  paste = {
    ['+'] = 'wl-paste',
    ['*'] = 'wl-paste',
  },
  cache_enabled = 0,
}
vim.o.clipboard = 'unnamedplus'
