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
            terminal_colors = true,
            styles = {
                comments = { italic = true },
                keywords = { italic = true },
                functions = {},
                variables = {},
                sidebars = "transparent",
                floats = "transparent",
            },
            lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
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
    -- kanagawa
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
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                styles = {
                    transparency = true,
                },
            })
        end,
    },
    -- vague
    {
        "vague-theme/vague.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("vague").setup({
                transparent = true,
            })
        end,
    },
    -- kintsugi
    {
        "metalelf0/kintsugi-nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("kintsugi").setup({
                variant = "dark", -- "dark" | "flared"
                transparent = true,
                terminal_colors = true,
                bold_keywords = true,
                italic_comments = false,
            })
        end,
    },
    -- vscode
    {
        "Mofiqul/vscode.nvim",
        lazy = false,
        priority = 1000,

        opts = {
            transparent = true,
            italic_comments = true,
            italic_inlayhints = true,
            underline_links = true,
            disable_nvimtree_bg = true,
            terminal_colors = true,
        },
    },
}
