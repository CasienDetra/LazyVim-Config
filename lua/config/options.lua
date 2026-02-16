-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- vim.g.lazyvim_cmp = "blink.cmp"
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
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true

-- vim.opt.number =
-- vim.opt.relativenumber = false
vim.diagnostic.config({
  virtual_lines = true,
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

  vim.g.neovide_title_text_color = "pink"
end
