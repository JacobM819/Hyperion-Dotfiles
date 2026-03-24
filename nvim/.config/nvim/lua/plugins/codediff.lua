return {
	{
		-- Can see all current diffs by doing :CodeDiff
		"esmuellert/codediff.nvim",
		config = function()
			require("codediff").setup({})
		end,
	},
	{
    -- Configures gutter sign diffs
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
			vim.keymap.set("n", "<leader>u", require("gitsigns").reset_hunk, {})
			vim.keymap.set("n", "<leader>y", require("gitsigns").preview_hunk, {})
		end,
	},
}
