-- vim.g.lazyvim_cmp = "blink.cmp"
vim.opt.guicursor = "n-v-i-c:block-Cursor"
vim.o.pumblend = 0
vim.o.winblend = 0
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = "menuone,noinsert" -- Completion options
vim.opt.autoindent = true
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true -- Case sensitive if uppercase in search
vim.opt.smartindent = true -- Case sensitive if uppercase in search
vim.opt.hlsearch = true -- Don't highlight search results
vim.opt.shortmess:append("c")
vim.opt.cmdheight = 0
vim.opt.fillchars = {
  eob = "~",
}
vim.o.list = false
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.expandtab = true

vim.diagnostic.config({
  virtual_lines = false,
})
vim.opt.fillchars =
  { vert = " ", horiz = " ", horizup = " ", horizdown = " ", vertleft = " ", vertright = " ", verthoriz = " " }

--neovide
if vim.g.neovide then
  vim.o.guifont = "IosevkaTerm Nerd Font:h18" -- text below applies for VimScript
  vim.g.neovide_window_blurred = true
  vim.g.neovide_opacity = 0.8
  vim.g.neovide_normal_opacity = 0.8
  vim.g.neovide_title_background_color =
    string.format("%x", vim.api.nvim_get_hl(0, { id = vim.api.nvim_get_hl_id_by_name("Normal") }).bg)
end
