-- treesitter for syntax highlighting and parsers
return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter")
			ts.setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
			})
			ts.install({ "python", "javascript", "lua", "vim", "vimdoc", "query", "css", "go", "html", "java", "C" })

      -- Auto install if not in the above list
			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("TreesitterAutoInstall", { clear = true }),
				callback = function(args)
					local lang = vim.treesitter.language.get_lang(args.match) or args.match

          if lang == "neo-tree" then return end

					ts.install(lang)
					pcall(vim.treesitter.start)
				end,
			})
		end,
	},
}
