return {
	"haishanh/night-owl.vim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd("syntax enable")
		vim.cmd("colorscheme night-owl")
		require("nvim-treesitter").setup({ install_dir = vim.fn.stdpath("data") .. "/site" })
		require("nvim-treesitter").install({ "lua", "javascript" })
	end,
}
