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
				ensure_installed = { "lua_ls", "pylsp" },
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
			vim.lsp.enable("pylsp")

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					["lua_ls"] = {},
				},
			})

			vim.lsp.config("pylsp", {
				capabilities = capabilities,
				settings = {
					["pylsp"] = {},
				},
			})

			-- To look for more LSP functions, type ':h vim.lsp.buf'
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {})
		end,
	},
}
