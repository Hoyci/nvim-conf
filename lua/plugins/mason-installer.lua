return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	config = function()
		require("mason-tool-installer").setup({
			ensure_installed = {
        "lua_ls",
				"gopls",
				"goimports",
				"gofumpt",
        "golangci-lint",
        "black",
        "isort",
        "delve",
			},
			auto_update = true,
			run_on_start = true,
		})
	end,
}
