return {
	{
		"shellRaining/hlchunk.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("hlchunk").setup({
				chunk = {
					enable = true,
					priority = 15,
					style = {
						{ fg = "#618fa8" },
						{ fg = "#c21f30" },
					},
					use_treesitter = true,
					chars = {
						horizontal_line = "─",
						vertical_line = "│",
						left_top = "╭",
						left_bottom = "╰",
						right_arrow = ">",
					},
					textobject = "",
					max_file_size = 1024 * 1024,
					error_sign = true,
					-- animation related
					duration = 200,
					-- delay = 300,
					exclude_filetypes = {
						aerial = true,
						dashboard = true,
					},
				},
				indent = {
					enable = true,
					priority = 10,
					style = {'#3b4252'},
					use_treesitter = true,
					chars = { "│" },
					ahead_lines = 5,
					exclude_filetypes = {
						aerial = true,
						dashboard = true,
					},
					-- delay = 100,
				},
				blank = {
					enable = false,
					style = { hibiscus = "#806d9c" },
					notify = false,
					priority = 0,
					exclude_filetypes = {
						aerial = true,
						dashboard = true,
					},
				},
			})
		end,
	},
}
