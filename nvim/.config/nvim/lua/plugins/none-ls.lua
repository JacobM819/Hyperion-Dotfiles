return {
  -- Wrapps command line tools like ESLint into an LSP, to allow interface with our code
  -- To add more formatters and such, simply add it to 'sources' and install via :Mason
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
      }
    })
    vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {}) 
  end
}
