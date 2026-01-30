return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      -- add blink.compat to dependencies
      {
        "saghen/blink.compat",
        optional = true, -- make optional so it's only enabled if any extras need it
        opts = {},
        version = not vim.g.lazyvim_blink_main and "*",
      },
    },
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
      keymap = {
        preset = "enter",
      },
      appearance = {
        nerd_font_variant = "mono",
      },
      signature = {
        window = {
          winblend = vim.o.pumblend,
        },
      },
      completion = {
        trigger = {
          show_on_insert_on_trigger_character = false,
          show_on_accept_on_trigger_character = false,
          show_on_blocked_trigger_characters = { "{", "(", "}", ")" },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        menu = {
          auto_show = true,
          scrollbar = false,
          draw = {
            columns = {
              { "kind_icon" },
              { "label", "label_description", gap = 1 },
              { "kind", gap = 1 },
              { "label_description", gap = 1 },
              { "source_name", gap = 1 },
            },
            components = {
              kind_icon = {
                ellipsis = true,
                width = { fill = true },
                text = function(ctx)
                  local kind_icons = {
                    Array = " ",
                    Boolean = "󰨙 ",
                    Class = " ",
                    Color = " ",
                    Control = " ",
                    Collapsed = " ",
                    Constant = "󰏿 ",
                    Constructor = " ",
                    Copilot = " ",
                    Enum = " ",
                    EnumMember = " ",
                    Event = " ",
                    Field = " ",
                    File = " ",
                    Folder = " ",
                    Function = "󰊕 ",
                    Interface = " ",
                    Key = " ",
                    Keyword = " ",
                    Method = "󰊕 ",
                    Module = " ",
                    Namespace = "󰦮 ",
                    Null = " ",
                    Number = "󰎠 ",
                    Object = " ",
                    Operator = " ",
                    Package = " ",
                    Property = " ",
                    Reference = " ",
                    Snippet = "󱄽 ",
                    String = " ",
                    Struct = "󰆼 ",
                    Text = " ",
                    TypeParameter = " ",
                    Unit = " ",
                    Unknown = " ",
                    Value = " ",
                    Variable = "󰀫 ",
                  }

                  local icon = kind_icons[ctx.kind]
                  if icon == nil then
                    icon = ctx.kind_icon
                  end
                  return icon
                end,
              },
            },
          },
        },
      },
      snippets = {
        preset = "luasnip",
        -- Function to use when expanding LSP provided snippets
        expand = function(snippet)
          vim.snippet.expand(snippet)
        end,
        -- Function to use when checking if a snippet is active
        active = function(filter)
          return vim.snippet.active(filter)
        end,
        -- Function to use when jumping between tab stops in a snippet, where direction can be negative or positive
        jump = function(direction)
          vim.snippet.jump(direction)
        end,
      },
      cmdline = {
        enabled = true,
        keymap = {
          preset = "cmdline",
          ["<Right>"] = false,
          ["<Left>"] = false,
        },
        completion = {
          list = { selection = { preselect = false } },
          menu = {
            auto_show = function(ctx)
              return vim.fn.getcmdtype() == ":"
            end,
          },
          ghost_text = { enabled = true },
        },
      },
    },
  },
}
