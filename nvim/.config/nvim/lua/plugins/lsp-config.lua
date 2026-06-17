return {
	{
		-- Repo: https://github.com/mason-org/mason.nvim
		-- Mason installs LSPs
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		-- Repo: https://github.com/mason-org/mason-lspconfig.nvim?tab=readme-ov-file#configuration
		-- Mason config bridges the gap between mason and nvim-lspconfig
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright", "gopls", "bashls", "superhtml", "eslint", "terraformls" },
			})
		end,
	},
	{
		-- https://github.com/neovim/nvim-lspconfig
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Allows the nvim cmp to communicate with the LSPs to suggest completions
			"hrsh7th/cmp-nvim-lsp",
		},

		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("lua_ls", { capabilities = capabilities })
			vim.lsp.enable("lua_ls")

			vim.lsp.config("terraformls", {
				capabilities = capabilities,
				handlers = {
					["window/showMessage"] = function(err, result, ctx, config)
						if result and result.message then
							-- Catch the annoying terraformls warnings and drop them
							if result.message:match("single file") or result.message:match("workspace") then
								return
							end
						end
						-- Pass everything else to Neovim's default message handler
						return vim.lsp.handlers["window/showMessage"](err, result, ctx, config)
					end,
				},
			})
			vim.lsp.enable("terraformls")

			vim.lsp.config("bashls", { capabilities = capabilities })
			vim.lsp.enable("bashls")

			vim.lsp.config("pyright", { capabilities = capabilities })
			vim.lsp.enable("pyright")

			vim.lsp.config("gopls", { capabilities = capabilities })
			vim.lsp.enable("gopls")

			vim.lsp.config("superhtml", {
				capabilities = capabilities,
				cmd = { "superhtml", "lsp", "--syntax-only" },
				filetypes = { "html", "htmldjango" },
			})
			vim.lsp.enable("superhtml")
			vim.lsp.enable("eslint")

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					["lua_ls"] = {},
				},
			})

			vim.lsp.config("pyright", {
				capabilities = capabilities,
				settings = {
					["pyright"] = {},
				},
			})
		end,
	},
}
