-- do not auto comment on new line
local api, cmd = vim.api, vim.cmd
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- hightlight on yank
api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.hl.on_yank()
    end,
})
cmd("let g:netrw_banner = 0")
api.nvim_set_hl(0, "Normal", { bg = "none" })
api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
api.nvim_set_hl(0, "Pmenu", { bg = "none" })
api.nvim_set_hl(0, "Terminal", { bg = "none" })
api.nvim_set_hl(0, "EndOfBuffer", { fg = "#f4f4f4", bg = "none" })
api.nvim_set_hl(0, "FoldColumn", { bg = "none" })
api.nvim_set_hl(0, "Folded", { bg = "none" })
api.nvim_set_hl(0, "SignColumn", { bg = "#89b4fa" })
api.nvim_set_hl(0, "NormalNC", { bg = "none" })
api.nvim_set_hl(0, "WhichKeyFloat", { bg = "none" })
api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
-- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#f2cdcd" })
api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
api.nvim_set_hl(0, "TelescopePromptTitle", { bg = "none" })
-- api.nvim_set_hl(0, "LineNrAbove", { fg = "#888888", bg = "#222222" })
-- api.nvim_set_hl(0, "LineNrbove", { fg = "#888888", bg = "#222222" })
api.nvim_set_hl(0, "CmpBorder", {
    fg = "#11111b",
    bg = "#11111b",
})
-- use forebackground color for visual mode highlight
-- Visual highlight
api.nvim_set_hl(0, "Visual", {
    fg = "NONE",
    bg = "#666666",
    reverse = true,
})

-- VisualNOS highlight
api.nvim_set_hl(0, "VisualNOS", {
    fg = "NONE",
    bg = "#000000",
    bold = true,
    underline = true,
})

-- Example of overriding Visual to darkgrey background
api.nvim_set_hl(0, "Visual", {
    fg = "NONE",
    bg = "darkgrey",
    reverse = true,
})

-- Example of overriding VisualNOS to underline on black background
api.nvim_set_hl(0, "VisualNOS", {
    fg = "NONE",
    bg = "black",
    underline = true,
})

-- Another variant: Visual with no background
api.nvim_set_hl(0, "Visual", {
    fg = "NONE",
    bg = "NONE",
    reverse = true,
})

api.nvim_set_hl(0, "VisualNOS", {
    fg = "NONE",
    bg = "black",
    underline = true,
})
-- since it does not apply again after change colorscheme we need this
api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        api.nvim_set_hl(0, "Visual", { reverse = true })
    end,
})
