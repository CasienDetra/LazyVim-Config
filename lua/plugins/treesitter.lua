return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    require("nvim-treesitter").setup({
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      ensure_installed = {
        "bash",
        "c",
        "css",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "html",
        "javascript",
        "json",
        "latex",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "php",
        "proto",
        "python",
        "query",
        "regex",
        "rust",
        "scss",
        "svelte",
        "swift",
        "terraform",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "vue",
        "yaml",
        "zig",
      },
    })
  end,
  -- Enable treesitter-based highlighting and indentation
}
