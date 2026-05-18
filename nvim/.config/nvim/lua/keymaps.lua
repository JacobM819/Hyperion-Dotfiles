----------------------------------------------------------------------
-- FORMATTING & DIAGNOSTICS (none-ls)
----------------------------------------------------------------------

-- Format the current buffer
vim.keymap.set("n", "<leader>gf", function()
	vim.lsp.buf.format({ timeout_ms = 5000 })
end, { desc = "Format current buffer" })

-- Toggle inline diagnostic text (virtual text)
local virtual_text_enabled = true
vim.keymap.set("n", "<leader>te", function()
	virtual_text_enabled = not virtual_text_enabled
	vim.diagnostic.config({ virtual_text = virtual_text_enabled })
end, { desc = "Toggle inline diagnostic text" })


----------------------------------------------------------------------
-- GIT INTEGRATION (gitsigns)
----------------------------------------------------------------------

vim.keymap.set("n", "<leader>gu", require("gitsigns").reset_hunk, { desc = "Reset Git hunk" })
vim.keymap.set("n", "<leader>gi", require("gitsigns").preview_hunk, { desc = "Preview Git hunk inline" })


----------------------------------------------------------------------
-- FILE EXPLORER (neo-tree)
----------------------------------------------------------------------

vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal left<CR>", { desc = "Reveal file in Neotree" })


----------------------------------------------------------------------
-- FUZZY FINDER (telescope)
----------------------------------------------------------------------

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "Find files in workspace" })
vim.keymap.set("n", "<leader>s", builtin.live_grep, { desc = "Global grep search" })


----------------------------------------------------------------------
-- LANGUAGE SERVER PROTOCOL (LSP)
----------------------------------------------------------------------
-- To look for more LSP functions, type ':h vim.lsp.buf'

vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, { desc = "Hover documentation" })
vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>i", vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "View code actions" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol globally" })
vim.keymap.set("n", "<leader>c", vim.lsp.buf.incoming_calls, { desc = "View incoming calls" })
vim.keymap.set("n", "<leader>rf", vim.lsp.buf.references, { desc = "Find symbol references" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
