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
				ensure_installed = { "lua_ls", "pyright", "gopls", "bashls", "superhtml", "eslint", "terraformls", "ts_ls" },
			})
		end,
	},
	{
		-- https://github.com/neovim/nvim-lspconfig
		-- :checkhealth lsp
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Allows the nvim cmp to communicate with the LSPs to suggest completions
			"hrsh7th/cmp-nvim-lsp",
		},

		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local servers = { "lua_ls", "terraformls", "bashls", "pyright", "gopls", "eslint" , "ts_ls"}
			for _, lsp in ipairs(servers) do
				vim.lsp.config(lsp, { capabilities = capabilities })
				vim.lsp.enable(lsp)
			end

			vim.lsp.config("superhtml", {
				capabilities = capabilities,
				cmd = { "superhtml", "lsp", "--syntax-only" },
				filetypes = { "html", "htmldjango" },
			})
			vim.lsp.enable("superhtml")
		end,
	},
}
