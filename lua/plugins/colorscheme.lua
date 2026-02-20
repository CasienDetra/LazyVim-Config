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
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    build = ":CatppuccinCompile",
    enabled = true,
    opts = {
      flavour = "macchiato",
      background = { light = "latte", dark = "macchiato" },
      transparent_background = true,
      float = { transparent = true, solid = true },
      term_colors = true,
      custom_highlights = function(C)
        local O = require("catppuccin").options
        return {
          ["@module"] = { fg = C.lavender, style = O.styles.miscs or { "italic" } },
          ["@type.builtin"] = { fg = C.yellow, style = O.styles.properties or { "italic" } },
          ["@property"] = { fg = C.lavender, style = O.styles.properties or {} },
        }
      end,
      integrations = {
        bufferline = false,
        cmp = true,
        fidget = true,
        gitsigns = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        lsp_trouble = true,
        markdown = true,
        mason = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        neotree = true,
        noice = true,
        notify = true,
        rainbow_delimiters = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
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
    priority = 1000, -- load early
    config = function()
      require("vesper").setup({
        transparent = true,

        italics = {
          comments = true,
          keywords = true,
          functions = true,
          strings = true,
          variables = true,
        },

        overrides = {},

        palette_overrides = {},
      })

      -- apply colorscheme
      -- vim.cmd("colorscheme vesper")
    end,
  },
}
