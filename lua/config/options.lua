-- vim.g.lazyvim_cmp = "blink.cmp"

-- blink cursor
vim.opt.guicursor = {
    "n-sm:block",
    "v:hor50",
    "c-ci-cr-i-ve:ver10",
    "o-r:hor10",
    "a:Cursor/Cursor-blinkwait1-blinkon1-blinkoff1",
}

vim.o.breakindent = true
vim.o.breakindentopt = "list:-1"
vim.o.cindent = true
vim.o.pumblend = 0
vim.o.list = true
vim.o.winblend = 0
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = "menuone,noinsert" -- Completion options
vim.opt.autoindent = true
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true -- Case sensitive if uppercase in search
vim.opt.smartindent = true -- Case sensitive if uppercase in search
vim.opt.hlsearch = true -- Don't highlight search results
vim.opt.shortmess:append("c")
vim.opt.cmdheight = 1
vim.opt.showmode = true
vim.opt.fillchars = {
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

vim.opt.colorcolumn = "+0"
vim.opt.listchars = "tab:¬·,trail:·,extends:►,space:·,precedes:◄,nbsp:␣"
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.formatlistpat = table.concat({
    [[^\s*\d\+[\]:.)}\t ]\s*]],
    [[^\s*\w\+[\]:.)}\t ]\s\+]],
    [[^\s*>\s]],
}, [[\|]])

vim.o.expandtab = true

vim.diagnostic.config({
    virtual_lines = false,
})

--neovide
if vim.g.neovide then
    vim.o.guifont = "IosevkaTerm Nerd Font:h18" -- text below applies for VimScript
    vim.g.neovide_window_blurred = true
    vim.g.neovide_opacity = 0.8
    vim.g.neovide_normal_opacity = 0.8
    vim.g.neovide_title_background_color =
        string.format("%x", vim.api.nvim_get_hl(0, { id = vim.api.nvim_get_hl_id_by_name("Normal") }).bg)
end
