-- Configures the cute little line at the bottom of your screen
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "nightfly",
			},
		})
	end,
}
