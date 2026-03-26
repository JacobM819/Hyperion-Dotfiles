return {
	{
      -- Does all the git stuff
		"NeogitOrg/neogit",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"esmuellert/codediff.nvim",
			"nvim-telescope/telescope.nvim",
		},
		cmd = "Neogit",
		keys = {
			{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
		},
	},
	{
		-- Configures gutter sign diffs. Can also view hunk diffs
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "┃" },
					change = { text = "┃" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
				update_debounce = 100,
			})
			vim.keymap.set("n", "<leader>gu", require("gitsigns").reset_hunk, {})
			vim.keymap.set("n", "<leader>gi", require("gitsigns").preview_hunk, {})
		end,
	},
}
