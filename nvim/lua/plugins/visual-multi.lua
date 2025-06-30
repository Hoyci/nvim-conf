return {
  "mg979/vim-visual-multi",
  branch = "master",
  init = function()
    -- Mapeia Ctrl+D no modo normal para selecionar a próxima ocorrência
    vim.g.VM_maps = {
      ["Find Under"] = "<C-d>",
      ["Find Subword Under"] = "<C-d>",
    }
  end,
}
