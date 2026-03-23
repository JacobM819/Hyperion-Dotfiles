vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.opt.termguicolors = true

-- Line number settings
vim.opt.number = true
vim.opt.relativenumber = true
--vim.api.nvim_set_hl(0, "LineNr", { fg = "#cdd6f4", bold = true })

-- Tab settings
vim.opt.shiftwidth = 3
vim.opt.tabstop = 3
vim.opt.expandtab = true
