-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
local api = vim.api
-- do not auto comment on new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- hightlight on yank
api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.hl.on_yank()
  end,
})
vim.cmd("let g:netrw_banner = 0")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
vim.api.nvim_set_hl(0, "Terminal", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "#f4f4f4", bg = "none" })
vim.api.nvim_set_hl(0, "FoldColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "#89b4fa" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
-- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#f2cdcd" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#888888", bg = "#222222" })
vim.api.nvim_set_hl(0, "LineNrbove", { fg = "#888888", bg = "#222222" })
vim.api.nvim_set_hl(0, "CmpBorder", {
  fg = "#11111b",
  bg = "#11111b",
})
-- yank hightlight thingy
-- work only on lua file
-- local yank_colors = {
--   YankKeyword = { bg = "#f38ba8", fg = "#1e1e2e" },
--   YankVariable = { bg = "#a6e3a1", fg = "#1e1e2e" },
--   YankFunction = { bg = "#cba6f7", fg = "#1e1e2e" },
--   YankType = { bg = "#94e2d5", fg = "#1e1e2e" },
--   YankString = { bg = "#fab387", fg = "#1e1e2e" },
--   YankNumber = { bg = "#f9e2af", fg = "#1e1e2e" },
--   YankOperator = { bg = "#89b4fa", fg = "#1e1e2e" },
--   YankComment = { bg = "#6c7086", fg = "#1e1e2e", italic = true },
--   YankDelimiter = { bg = "#74c7ec", fg = "#1e1e2e" },
--   YankParameter = { bg = "#eba0ac", fg = "#1e1e2e" },
--   YankField = { bg = "#b4befe", fg = "#1e1e2e" },
--   YankControl = { bg = "#f38ba8", fg = "#1e1e2e", bold = true },
--   YankReturn = { bg = "#fab387", fg = "#1e1e2e", bold = true },
--   YankDanger = { bg = "#ff0000", fg = "#ffffff", bold = true },
-- }
--
-- for group, opts in pairs(yank_colors) do
--   vim.api.nvim_set_hl(0, group, opts)
-- end
--
-- local yank_ns = vim.api.nvim_create_namespace("semantic_yank")
--
-- local function yank_hl_for_node(node)
--   local t = node:type()
--
--   if t == "string" then
--     return "YankString"
--   elseif t == "identifier" then
--     return "YankVariable"
--   elseif t == "local" or t:match("keyword") then
--     return "YankKeyword"
--   elseif t:match("operator") or t == "=" then
--     return "YankOperator"
--   end
--
--   return nil
-- end
--
-- vim.api.nvim_create_autocmd("TextYankPost", {
--   callback = function()
--     if vim.v.event.operator ~= "y" then
--       return
--     end
--
--     local bufnr = vim.api.nvim_get_current_buf()
--     local start_row, start_col = unpack(vim.api.nvim_buf_get_mark(bufnr, "["))
--     local end_row, end_col = unpack(vim.api.nvim_buf_get_mark(bufnr, "]"))
--
--     local parser = vim.treesitter.get_parser(bufnr)
--     local tree = parser:parse()[1]
--     local root = tree:root()
--
--     local function visit(node)
--       local sr, sc, er, ec = node:range()
--
--       -- outside yank range → skip
--       if er < start_row or sr > end_row then
--         return
--       end
--
--       local hl = yank_hl_for_node(node)
--       if hl then
--         vim.api.nvim_buf_add_highlight(bufnr, yank_ns, hl, sr, sc, ec)
--       end
--
--       for child in node:iter_children() do
--         visit(child)
--       end
--     end
--
--     visit(root)
--
--     vim.defer_fn(function()
--       vim.api.nvim_buf_clear_namespace(bufnr, yank_ns, 0, -1)
--     end, 250)
--   end,
-- })
