return {
  -- disable noice cmdline
  {
    "folke/noice.nvim",

    enabled = false,
  },
  -- rainbow bracket
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function() end,
  },
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
            -- {
            --   -- right Column: Menu
            --   -- icon = " ",
            --   -- title = "Menu",
            --   section = "keys",
            --   pane = 1,
            --   gap = 1,
            --   padding = 1,
            -- },
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

      -- +-------------------------------------------------+
      -- | A | B | C                             X | Y | Z |
      -- +-------------------------------------------------+
      local mode = {
        "mode",
        fmt = function(str)
          -- return ' '
          -- displays only the first character of the mode
          return " " .. str
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
          -- component_separators = { left = "|", right = "|" },
          component_separators = { left = "", right = "" },
          -- section_separators = { left = "|", right = "" },
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
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("incline").setup()
      local helpers = require("incline.helpers")
      local devicons = require("nvim-web-devicons")
      require("incline").setup({
        window = {
          padding = 0,
          margin = { horizontal = 0 },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if filename == "" then
            filename = "[No Name]"
          end
          local ft_icon, ft_color = devicons.get_icon_color(filename)
          local modified = vim.bo[props.buf].modified
          return {
            ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
            " ",
            { filename, gui = modified and "bold,italic" or "bold" },
            " ",
            guibg = "#04406e",
          }
        end,
      })
    end,
  },
  -- bufferline
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
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
      -- vim.opt.listchars:append "eol:↴"

      local highlight = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
      }

      local hooks = require("ibl.hooks")
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "IndentBlanklineIndent2", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "IndentBlanklineIndent3", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "IndentBlanklineIndent4", { fg = "#56B6C2" })
        vim.api.nvim_set_hl(0, "IndentBlanklineIndent5", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "IndentBlanklineIndent6", { fg = "#C678DD" })
      end)

      hooks.register(hooks.type.ACTIVE, function(bufnr)
        return vim.opt_local.filetype:get() ~= "go"
      end)

      require("ibl").setup({
        indent = { char = "¦", highlight = highlight },
        whitespace = { highlight = highlight, remove_blankline_trail = false },
        scope = { enabled = true, show_start = true },
      })
    end,
  },
}
