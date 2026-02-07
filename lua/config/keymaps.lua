-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jj", "<ESC>")
vim.keymap.set("i", "kk", "<ESC>")

-- Indents
vim.keymap.set("n", "<C-.>", ">>")
vim.keymap.set("n", "<C-,>", "<<")
vim.keymap.set("i", "<C-.>", "<esc>>>i")
vim.keymap.set("i", "<C-,>", "<esc><<i")
vim.keymap.set("v", "<C-.>", ">")
vim.keymap.set("v", "<C-,>", "<")

-- move line
vim.keymap.set("n", "<M-down>", "ddp")
vim.keymap.set("n", "<M-up>", "ddkP")
vim.keymap.set("v", "<M-up>", "xkP`[V`]")
vim.keymap.set("v", "<M-down>", "xk`[V`]`")

-- explorer
vim.keymap.set("n", "<leader>-", function()
  vim.cmd("Ex")
end)
