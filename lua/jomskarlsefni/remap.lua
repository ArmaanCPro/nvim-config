
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Key mapping for manual formatting
vim.keymap.set("n", "<Leader>f", function()
    vim.lsp.buf.format({ async = true })
end, { noremap = true, silent = true })

