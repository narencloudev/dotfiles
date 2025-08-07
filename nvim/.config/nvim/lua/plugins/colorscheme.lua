-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({})
      vim.o.background = "dark"
      vim.cmd("colorscheme gruvbox")
    end,
  },
}

