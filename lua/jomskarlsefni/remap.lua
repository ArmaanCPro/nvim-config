
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>rn", function()
	vim.lsp.buf.rename()
end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>rr", function()
	vim.lsp.buf.references()
end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ri", function()
	vim.lsp.buf.implementation()
end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ra", function()
	vim.lsp.buf.code_action()
end, { noremap = true, silent = true })

-- window shifting
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Move current line or visual selection up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==") -- move line up(n)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==") -- move line down(n)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v)

-- remap visual block mode to ctrl+b as some terminals override ctrl+v to be paste
vim.keymap.set("n", "<C-b>", "<C-v>", { desc = "Enter visual block mode" })

