return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" }, 
  opts = {
    signs = {
      add          = { text = "│" },
      change       = { text = "│" },
      delete       = { text = "_" },
      topdelete    = { text = "‾" },
      changedelete = { text = "~" },
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns
      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
      end

      map("n", "]c", gs.next_hunk,  "Next hunk")
      map("n", "[c", gs.prev_hunk,  "Prev hunk")
      map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>",   "Stage hunk")
      map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>",   "Reset hunk")
      map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
      map("n", "<leader>gd", gs.diffthis,     "Diff this file")
    end,
  },
}
