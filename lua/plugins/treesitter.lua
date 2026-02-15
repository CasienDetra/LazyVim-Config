return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      -- main branch setup() is minimal - only install_dir option
      require("nvim-treesitter").setup({})
    end,
  },
  {
    "mks-h/treesitter-autoinstall.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesitter-autoinstall").setup({
        highlight = true,
        -- ignore = {
        -- // ignore list
        -- },
      })
    end,
  },
}
