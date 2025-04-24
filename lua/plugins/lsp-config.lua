return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				pip = {
					upgrade_pip = true,
					install_args = {},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "gopls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.pyright.setup({
				capabilities = capabilities,
				settings = {
					python = {
						analysis = {
							typeCheckingMode = "basic",
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
						},
					},
				},
			})

			lspconfig.gopls.setup({
				cmd = { "/usr/local/go/bin/go", "run", "golang.org/x/tools/gopls@latest" },
				capabilities = capabilities,
				settings = {
					usePlaceholders = true,
					completeUnimported = true,
				},
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>fd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>fr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
