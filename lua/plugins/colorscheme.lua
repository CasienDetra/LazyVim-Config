return {
  {
    "folke/tokyonight.nvim",
    name = "folkeTokyonight",
    priority = 1000,
    config = function()
      local transparent = true
      local bg_dark = "#011423"

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
          colors.bg_statusline = transparent and colors.none or bg_dark
        end,
      })
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
  -- catppuccin
  {
    {
      "catppuccin/nvim",
      lazy = false,
      priority = 1000,
      opts = {
        transparent_background = true,
      },
    },
  },
  -- kang
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      colors = {
        theme_bg = "#1f1f28",
      },
    },
  },
  -- rose pine
  -- lua/plugins/rose-pine.lua
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        dark_variant = "dawn",
        disable_background = true,
        transparent = true,
      })
    end,
  },
}
