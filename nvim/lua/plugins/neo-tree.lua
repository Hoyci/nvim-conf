return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = true,
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      vim.keymap.set("n", "<C-b>", ":Neotree toggle left<CR>")

      require("neo-tree").setup({
        open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
        auto_clean_after_session_restore = false,
        close_if_last_window = false,
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignore = false,
            hide_by_name = {
              ".git",
            },
          },
        },
      })
    end,
  },
}
