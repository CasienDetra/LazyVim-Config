return {
  -- tokyonight
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
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      lsp_styles = {
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      flavour = "mocha",
      transparent_background = true,
      dim_inactive = {
        enabled = false,
      },
      custom_highlights = function(colors)
        return {
          FloatBorder = { fg = colors.lavender, bg = colors.mantle },
          NormalFloat = { bg = colors.mantle },
          WinSeparator = { fg = colors.surface1 },
          -- Comment = { fg = colors.flamingo },
          TabLineSel = { bg = colors.pink },
          CmpBorder = { fg = colors.surface2 },
          Directory = { fg = colors.red },
          FolderIcon = { fg = colors.blue }, -- Pmenu = { bg = colors.none },
        }
      end,
    },
    specs = {
      {
        "akinsho/bufferline.nvim",
        optional = true,
        opts = function(_, opts)
          if (vim.g.colors_name or ""):find("catppuccin") then
            opts.highlights = require("catppuccin.special.bufferline").get_theme()
          end
        end,
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
  -- vesper
  {
    "datsfilipe/vesper.nvim",
    config = function()
      local mix = require("vesper.utils").mix
      local p = require("vesper.colors")

      require("vesper").setup({
        transparent = true,
        palette_overrides = {
          fg = mix("#F4F4F4", "#000000", math.abs(0.90)),
          primary = mix("#FFFFFF", "#000000", math.abs(0.90)),
          purple = "#FBAD0F",
        },
        overrides = {
          Keyword = { fg = p.purple },
          Operator = { fg = p.purple },
          ["@punctuation.separator.keyvalue"] = { fg = p.purple },

          -- tsx
          ["@import.identifier.tsx"] = { fg = p.fg },

          -- typescript
          ["@import.identifier.typescript"] = { fg = p.fg },
        },
      })
    end,
  },
  -- miasma
  {
    "xero/miasma.nvim",
    lazy = false,
    priority = 1000,
    config = function() end,
  },
  -- vague
  {
    "vague-theme/vague.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other plugins
    config = function()
      require("vague").setup({
        transparent = true,
      })
    end,
  },
  -- zenburned
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      transparent_background = true
    end,
  },
}
