return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	config = function()
		require("mason-tool-installer").setup({
			ensure_installed = {
				-- Ferramentas Go
				"gopls",
				"goimports",
				"gofumpt",
				"golangci-lint",
				"delve",

				-- Ferramentas Python
				"pyright",
				"black",
				"isort",
				"ruff",
				"debugpy",

				-- Ferramentas Lua
				"stylua",
				"lua-language-server",
			},
			auto_update = true,
			run_on_start = true,
			start_delay = 3000,
		})
	end,
}
