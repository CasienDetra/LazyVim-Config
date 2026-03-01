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
-- use - to explore
vim.keymap.set("n", "-", function()
  vim.cmd("Ex")
end)

-- use ALT + A when in insert mode to append
vim.keymap.set("i", "<M-a>", "<C-o>l", { noremap = true })

-- Resize splits window
vim.keymap.set("n", "<C-S-h>", "<C-w><")
vim.keymap.set("n", "<C-S-l>", "<C-w>>")
vim.keymap.set("n", "<C-S-k>", "<C-w>+")
vim.keymap.set("n", "<C-S-j>", "<C-w>-")

-- basically don't register text when use x
vim.keymap.set("n", "x", '"_x')
