return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "j-hui/fidget.nvim",
    },
    config = function()
      local function setup_keymaps(bufnr)
        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, silent = true })
        end

        -- Hover & Signature
        map("n", "K", function()
          vim.lsp.buf.hover({ border = "rounded", max_height = 25, max_width = 120 })
        end, "Hover")
        map({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, "Signature Help")

        -- gd, gD, gr, gi, gy handled by Snacks picker (snacks.lua)

        -- Diagnostics navigation
        map("n", "[d", function()
          vim.diagnostic.jump({ count = -1 })
        end, "Prev Diagnostic")
        map("n", "]d", function()
          vim.diagnostic.jump({ count = 1 })
        end, "Next Diagnostic")

        -- <leader>c = Code
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
        map("n", "<leader>cr", vim.lsp.buf.rename, "Rename Symbol")
        map("n", "<leader>cd", vim.diagnostic.open_float, "Line Diagnostic")
        map("n", "<leader>cv", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Definition in Vsplit")

        -- <leader>l = LSP
        map("n", "<leader>li", "<cmd>LspInfo<cr>", "LSP Info")
        map("n", "<leader>lr", "<cmd>LspRestart<cr>", "LSP Restart")
        map("n", "<leader>lh", function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
        end, "Toggle Inlay Hints")
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
        callback = function(args)
          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then
            return
          end

          setup_keymaps(bufnr)
          vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

          -- Document highlight on cursor hold
          if client.server_capabilities.documentHighlightProvider then
            local group = vim.api.nvim_create_augroup("LspDocumentHighlight_" .. bufnr, { clear = true })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = bufnr,
              group = group,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = bufnr,
              group = group,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      vim.diagnostic.config({
        virtual_text = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = { border = "rounded", source = true, header = "", prefix = "" },
        signs = {
          text = {
            -- [vim.diagnostic.severity.ERROR] = "󰅚 ",
            -- [vim.diagnostic.severity.WARN] = "󰀪 ",
            -- [vim.diagnostic.severity.INFO] = "󰋽 ",
            -- [vim.diagnostic.severity.HINT] = "󰌶 ",
            [vim.diagnostic.severity.ERROR] = "E ",
            [vim.diagnostic.severity.WARN] = "W ",
            [vim.diagnostic.severity.INFO] = "I ",
            [vim.diagnostic.severity.HINT] = "H ",
          },
          numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
          },
        },
      })
    end,
  },

  {
    "j-hui/fidget.nvim",
    branch = "main", -- v2
    opts = {
      notification = {
        window = {
          -- border = "rounded",
          winblend = 100,
        },
      },
    },
  },

  {
    "mason-org/mason.nvim",
    lazy = false,
    cmd = "Mason",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      local lspconfig = require("lspconfig")

      local function default_setup(server_name)
        lspconfig[server_name].setup({})
      end

      local handlers = {
        default_setup,

        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            settings = {
              Lua = {
                runtime = {
                  version = "LuaJIT",
                },
                diagnostics = {
                  globals = { "vim" },
                },
                workspace = {
                  library = vim.api.nvim_get_runtime_file("", true),
                  checkThirdParty = false,
                },
                telemetry = {
                  enable = false,
                },
              },
            },
          })
        end,
      }

      mason_lspconfig.setup({ handlers = handlers })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    dependencies = { "mason-org/mason-lspconfig.nvim" },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "lua_ls",
          "gopls",
          -- "golangci-lint",
          "shellcheck",
          "stylua",
          "goimports",
          "shfmt",
        },
      })
    end,
  },
}
