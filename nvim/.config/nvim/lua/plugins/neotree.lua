-- neotree file explorer
return {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
      },
      lazy = false,
      config = function()
        require('neo-tree').setup({
          close_if_last_window = true,
        })
      end
}
