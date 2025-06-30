return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"jay-babu/mason-null-ls.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local helpers = require("null-ls.helpers")

		require("mason-null-ls").setup({
			automatic_installation = true,
			automatic_setup = false,
		})

		local ruff_diagnostics = {
			method = null_ls.methods.DIAGNOSTICS,
			filetypes = { "python" },
			generator = null_ls.generator({
				command = "ruff",
				args = { "check", "--quiet", "--output-format=json", "--stdin-filename", "$FILENAME", "-" },
				to_stdin = true,
				format = "json",
				check_exit_code = function(code)
					return code <= 1
				end,
				on_output = function(params)
					local diagnostics = {}
					local results = params.output
					if not results then
						return nil
					end

					for _, d in ipairs(results) do
						table.insert(diagnostics, {
							row = d.location.row,
							col = d.location.column,
							end_row = d.end_location.row,
							end_col = d.end_location.column,
							source = "ruff",
							message = d.message,
							severity = helpers.diagnostics.severities["warning"],
							code = d.code,
						})
					end
					return diagnostics
				end,
			}),
		}

		null_ls.setup({
			sources = {
				-- Python
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				ruff_diagnostics,

				-- Go
				null_ls.builtins.formatting.goimports,
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.diagnostics.golangci_lint.with({
					diagnostics_format = "#{m} (#{c})",
				}),

				-- Lua
				null_ls.builtins.formatting.stylua,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
