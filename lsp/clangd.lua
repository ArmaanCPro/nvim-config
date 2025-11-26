---@type vim.lsp.Config
return {
    on_attach = function(client, bufnr)
        vim.api.nvim_set_keymap("n, i", "<A-o>", "<cmd>LspClangdSwitchSourceHeader<CR>", { noremap = true, silent = true, buffer = bufnr })
    end,
}
