-- telescope for finding files and stuff within files
return {
      'nvim-telescope/telescope.nvim', version = '*',
      dependencies = {
          'nvim-lua/plenary.nvim',
          { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      },
      config = function()
        -- telescope
        local builtin = require("telescope.builtin")
        vim.keymap.set('n', '<leader>p', builtin.find_files, {})
        -- global grep
        vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
      end
  }
