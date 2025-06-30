return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = {
        -- LSP Servers
        "lua-language-server",
        "gopls",
        "pyright",

        -- Formatters
        "stylua",
        "black",
        "isort",
        "gofumpt",
        "goimports",

        -- Linters
        "ruff",
        "golangci-lint",
      },
      auto_update = false,
      run_on_start = true,
    })
  end,
}
