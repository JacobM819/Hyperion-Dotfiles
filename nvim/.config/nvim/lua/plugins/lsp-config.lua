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
				ensure_installed = { "lua_ls", "pyright", "gopls", "bashls", "superhtml", "eslint"},
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

			vim.lsp.enable("lua_ls")
         vim.lsp.enable("bashls")
			vim.lsp.enable("pyright")
			vim.lsp.enable("gopls")
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
