return {
  {
    -- Communicates with LSPs to provide code snippet suggestions
    "hrsh7th/cmp-nvim-lsp",
  },
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
      -- This is the completion engine for lua snip. When you select a snippet, this will complete theat snippet
			"saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets"
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")


      -- loads luasnip vscode completions
      require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					-- When you click on a snippet that you want to expand, it uses this function.
					-- For this config we are using luasnip
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
