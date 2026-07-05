-- vim.g.lazyvim_cmp = "blink.cmp"
-- ref : https://github.com/mcauley-penney/nvim/blob/main/lua/options.lua
local o, opt, g = vim.o, vim.opt, vim.g
-- blink cursor
opt.guicursor = {
    "n-sm:block",
    "v:hor50",
    "c-ci-cr-i-ve:ver10",
    "o-r:hor10",
    "a:Cursor/Cursor-blinkwait1-blinkon1-blinkoff1",
}

o.breakindent = true
o.breakindentopt = "list:-1"
o.cindent = true
o.pumblend = 0
o.list = true
o.winblend = 0
opt.clipboard = "unnamedplus"
opt.completeopt = "menuone,noinsert" -- Completion options
opt.autoindent = true
opt.ignorecase = true -- Case insensitive search
opt.smartcase = true -- Case sensitive if uppercase in search
opt.smartindent = true -- Case sensitive if uppercase in search
opt.hlsearch = true -- Don't highlight search results
opt.shortmess:append("c")
opt.cmdheight = 1
opt.showmode = true
opt.fillchars = {
    eob = "~",
    diff = "╱",
    fold = " ",
    foldsep = " ",
    msgsep = "━",
    horiz = "━",
    horizup = "┻",
    horizdown = "┳",
    vert = "┃",
    vertleft = "┫",
    vertright = "┣",
    verthoriz = "╋",
}

opt.colorcolumn = "+0"
opt.listchars = "tab:¬·,trail:·,extends:►,space:·,precedes:◄,nbsp:␣"
o.shiftwidth = 4
o.tabstop = 4
opt.softtabstop = 4
opt.formatlistpat = table.concat({
    [[^\s*\d\+[\]:.)}\t ]\s*]],
    [[^\s*\w\+[\]:.)}\t ]\s\+]],
    [[^\s*>\s]],
}, [[\|]])

o.expandtab = true

--neovide
if g.neovide then
    o.guifont = "IosevkaTerm Nerd Font:h18" -- text below applies for VimScript
    g.neovide_window_blurred = true
    g.neovide_opacity = 0.8
    g.neovide_normal_opacity = 0.8
    g.neovide_title_background_color =
        string.format("%x", vim.api.nvim_get_hl(0, { id = vim.api.nvim_get_hl_id_by_name("Normal") }).bg)
end
