return {
  {
    -- Repo: https://github.com/mason-org/mason.nvim
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup()
    end
  },
  {
    -- Repo: https://github.com/mason-org/mason-lspconfig.nvim?tab=readme-ov-file#configuration
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = {"lua_ls", "pylsp"}
      })
    end
  },
  {
    -- https://github.com/neovim/nvim-lspconfig
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("pylsp")

      vim.lsp.config('lua_ls', {
        settings = {
          ['lua_ls'] = {},
        },
      })

      -- To look for more LSP functions, type ':h vim.lsp.buf'
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', 'gf', vim.lsp.buf.implementation, {})
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename,  {})
      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float,  {})

    end
  }
}
