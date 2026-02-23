return {
  -- disable noice cmdline
  {
    "folke/noice.nvim",
    enabled = true,
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    config = function()
      local noice = require("noice")

      noice.setup({
        cmdline = {
          enabled = false,
        },
        messages = {
          enabled = false,
        },
      })
    end,
  },
  -- rainbow bracket
  { "HiPhish/rainbow-delimiters.nvim", event = { "BufReadPre", "BufNewFile" }, config = function() end },
  -- snack
  {
    "folke/snacks.nvim",
    opts = {
      -- dashboard
      dashboard = {
        sections = {
          {
            -- This inner table creates a horizontal layout (panes)
            { section = "header" },
            -- { -- right Column: Menu -- icon = " ", -- title = "Menu", section =
            -- "keys", pane = 1, gap = 1, padding = 1, },
            {
              -- left Column: ASCII Art (terminak with ascii-image-converter)
              pane = 2,
              section = "terminal",
              cmd = "ascii-image-converter ~/Downloads/onizuka.jpg -C -b",
              random = 5,
              indent = 5,
              height = 17,
            },
          },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          -- { section = "startup" },
        },
      },
      -- indent
      indent = {
        enabled = false,
        only_scope = true,
        char = "",
        chunk = {
          enable = true,
        },
      },
    },
  },
  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local lualine = require("lualine")
      local lazy_status = require("lazy.status") -- to configure lazy pending updates count
      local colors = {
        color0 = "#282828", -- bg
        color1 = "#cc241d", -- red
        color2 = "#E4D5AD", -- green
        color3 = "#3E3B39", -- yellow
        color6 = "#458588", -- blue
        color7 = "#a89984", -- fg
        color8 = "#b16286", -- purple
        color9 = "#524B49", -- purple
      }
      -- +-------------------------------------------------+
      -- | A | B | C                             X | Y | Z |
      -- +-------------------------------------------------+
      local custom = {
        replace = {
          a = { fg = colors.color0, bg = colors.color1 },
          b = { fg = colors.color2, bg = colors.color3 },
        },
        inactive = {
          a = { fg = colors.color6, bg = colors.color3 },
          b = { fg = colors.color6, bg = colors.color3 },
          c = { fg = colors.color6, bg = colors.color3 },
        },
        normal = {
          a = { fg = colors.color0, bg = colors.color7 },
          b = { fg = colors.color2, bg = colors.color9 },
          c = { fg = colors.color2, bg = colors.color3 },
        },
        visual = {
          a = { fg = colors.color0, bg = colors.color7 },
          b = { fg = colors.color2, bg = colors.color9 },
          c = { fg = colors.color2, bg = colors.color3 },
        },
        insert = {
          a = { fg = colors.color0, bg = colors.color7 },
          b = { fg = colors.color2, bg = colors.color9 },
          c = { fg = colors.color2, bg = colors.color3 },
        },
      }

      local mode = {
        "mode",
        fmt = function(str)
          -- return " " .. str
          return " " .. str
        end,
      }

      local diff = {
        "diff",
        colored = true,
        symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
        -- cond = hide_in_width,
      }

      local filename = {
        "filename",
        file_status = true,
        path = 0,
      }

      local branch = { "branch", icon = { "", color = { fg = "#A6D4DE" } }, "" }

      lualine.setup({
        icons_enabled = true,
        options = {
          theme = "auto",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { mode },
          lualine_b = { branch },
          lualine_c = { diff, filename },
          lualine_x = {
            {
              -- require("noice").api.statusline.mode.get,
              -- cond = require("noice").api.statusline.mode.has,
              lazy_status.updates,
              cond = lazy_status.has_updates,
              color = { fg = "#ff9e64" },
            },
            { "encoding" },
            { "fileformat" },
            { "filetype" },
          },
        },
      })
    end,
  },
  -- incline.nvim
  {
    "b0o/incline.nvim",
    enabled = true,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local devicons = require("nvim-web-devicons")

      require("incline").setup({
        hide = {
          only_win = false,
        },
        render = function(props)
          local bufname = vim.api.nvim_buf_get_name(props.buf)
          local filename = vim.fn.fnamemodify(bufname, ":t")
          if filename == "" then
            filename = "[No Name]"
          end

          local ext = vim.fn.fnamemodify(bufname, ":e")
          local icon, icon_color = devicons.get_icon(filename, ext, { default = true })

          local modified = vim.bo[props.buf].modified

          return {
            { " ", icon, " ", guifg = icon_color },
            { filename, gui = modified and "bold" or "none" },
            modified and { " [+]", guifg = "#ffbe64" } or "",
            " ",
          }
        end,
      })
    end,
  },
  -- bufferline
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    options = {
      options = {
        separator_style = { "", "" },
      },
    },
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
  },
  -- hightlight color
  {
    "brenoprata10/nvim-highlight-colors",
    event = "BufReadPre",
    opts = {
      render = "background",
      enable_hex = true,
      enable_short_hex = true,
      enable_rgb = true,
      enable_hsl = true,
      enable_hsl_without_function = true,
      enable_ansi = true,
      enable_var_usage = true,
      enable_tailwind = true,
    },
  },
  -- indent blankline replace indent from snacks
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
    main = "ibl",
    config = function()
      vim.opt.termguicolors = true
      vim.opt.list = false
      -- vim.opt.listchars:append "space:⋅"
      vim.opt.listchars:append("eol:↴")
    end,
  },
  -- gitsigns
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "┆" },
          change = { text = "↴" },
          delete = { text = "󰍵" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "↴" },
        },
      })
    end,
  },
}
