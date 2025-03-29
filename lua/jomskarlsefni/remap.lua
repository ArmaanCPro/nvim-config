
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Key mapping for manual formatting
vim.keymap.set("n", "<Leader>f", function()
    vim.lsp.buf.format({ async = true })
end, { noremap = true, silent = true })

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

