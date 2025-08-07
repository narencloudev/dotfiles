return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
        { "<leader>fe", "<cmd>Neotree toggle<cr>", desc = "Explorer NeoTree (Root Dir)" },
    { "<leader>fE", "<cmd>Neotree toggle dir=%:p:h<cr>", desc = "Explorer NeoTree (cwd)" },
    { "<leader>e",  "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },

  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = true,
      },
      follow_current_file = {
        enabled = true,
      },
    },
    window = {
      position = "left",
      width = 25,
    },
  },
}

