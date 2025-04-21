return { 
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensureInstall = {"lua", "javascript"},
      highlight = { enable = true },
      indent = { enable = true}
    })
  end
}
