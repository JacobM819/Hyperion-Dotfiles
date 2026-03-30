return {
	-- Wrapps command line tools like ESLint into an LSP, to allow interface with our code
	-- To add more formatters and such, simply add it to 'sources' and install via :Mason
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.completion.spell,
				-- python code formatting
				null_ls.builtins.diagnostics.pylint.with({
					diagnostics_postprocess = function(diagnostic)
						diagnostic.code = diagnostic.message_id
					end,
				}),
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.black,
				-- javascript
				null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.formatting.prettier,
            -- go
				null_ls.builtins.diagnostics.golangci_lint,
				null_ls.builtins.formatting.goimports,
				null_ls.builtins.formatting.gofumt,
			},
		})
		vim.keymap.set("n", "<leader>gf", function()
            vim.lsp.buf.format({ timeout_ms = 5000 })
        end)
	end,
}
