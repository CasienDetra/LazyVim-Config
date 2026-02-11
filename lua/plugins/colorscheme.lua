return {
  {
    "folke/tokyonight.nvim",
    name = "folkeTokyonight",
    priority = 1000,
    config = function()
      local transparent = true
      -- local bg = "#011628"
      local bg_dark = "#011423"
      -- local bg_highlight = "#143652"
      -- local bg_search = "#0A64AC"
      -- local bg_visual = "#275378"
      -- local fg = "#CBE0F0"
      -- local fg_dark = "#B4D0E9"
      -- local fg_gutter = "#627E97"
      -- local border = "#547998"

      require("tokyonight").setup({
        style = "night",
        transparent = transparent,

        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          sidebars = transparent and "transparent" or "dark",
          floats = transparent and "transparent" or "dark",
        },
        on_colors = function(colors)
          --     colors.bg = transparent and colors.none or bg
          --     colors.bg_dark = transparent and colors.none or bg_dark
          --     colors.bg_float = transparent and colors.none or bg_dark
          --     colors.bg_highlight = bg_highlight
          --     colors.bg_popup = bg_dark
          --     colors.bg_search = bg_search
          --     colors.bg_sidebar = transparent and colors.none or bg_dark
          colors.bg_statusline = transparent and colors.none or bg_dark
          --     colors.bg_visual = bg_visual
          --     colors.border = border
          --     colors.fg = fg
          --     colors.fg_dark = fg_dark
          --     colors.fg_float = fg
          --     colors.fg_gutter = fg_gutter
          --     colors.fg_sidebar = fg_dark
        end,
      })
      -- vim.cmd("colorscheme tokyonight")
      -- NOTE: Auto switch to tokyonight for markdown files only
      -- vim.api.nvim_create_autocmd("FileType", {
      --     pattern = { "markdown" },
      --     callback = function()
      --         -- Ensure the theme switch only happens once for a buffer
      --         local buffer = vim.api.nvim_get_current_buf()
      --         if not vim.b[buffer].tokyonight_applied then
      --             if vim.fn.expand("%:t") ~= "" and vim.api.nvim_buf_get_option(0, "buftype") ~= "nofile" then
      --                 vim.cmd("colorscheme tokyonight")
      --             end
      --             vim.b[buffer].tokyonight_applied = true
      --         end
      --     end,
      -- })
    end,
  },
  -- gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    opts = {
      contrast = "hard",
      transparent_mode = true,
    },
  },
  -- solarized osaka
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
  },
}
