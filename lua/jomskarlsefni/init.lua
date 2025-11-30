require("jomskarlsefni.remap")
require("jomskarlsefni.lazy")
require("jomskarlsefni.set")

local augroup = vim.api.nvim_create_augroup
local JomskarlsefniGroup = augroup('Jomskarlsefni', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({ "BufWritePre" }, {
    group = JomskarlsefniGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd('LspAttach', {
    group = JomskarlsefniGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "<leader>gws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>gf", function() vim.diagnostic.open_float() end, opts)

        --[[
        -- Neovim Global Defaults:
        --  "gra" (Normal and Visual mode) is mapped to vim.lsp.buf.code_action()
            "gri" is mapped to vim.lsp.buf.implementation()
            "grn" is mapped to vim.lsp.buf.rename()
            "grr" is mapped to vim.lsp.buf.references()
            "grt" is mapped to vim.lsp.buf.type_definition()
            "gO" is mapped to vim.lsp.buf.document_symbol()
            CTRL-S (Insert mode) is mapped to vim.lsp.buf.signature_help()
            "an" and "in" (Visual and Operator-pending mode) are mapped to outer and inner incremental selections, respectively, using vim.lsp.buf.selection_range()

        -- Buffer-Local Defaults
        --  'omnifunc' is set to vim.lsp.omnifunc(), use i_CTRL-X_CTRL-O to trigger completion.
            'tagfunc' is set to vim.lsp.tagfunc(). This enables features like go-to-definition, :tjump, and keymaps like CTRL-], CTRL-W_], CTRL-W_} to utilize the language server.
            'formatexpr' is set to vim.lsp.formatexpr(), so you can format lines via gq if the language server supports it.
                To opt out of this use gw instead of gq, or clear 'formatexpr' on LspAttach.
            K is mapped to vim.lsp.buf.hover() unless 'keywordprg' is customized or a custom keymap for K exists.
        --]]
    end
})

-- nvim-treesitter highlighting
autocmd('FileType', {
    pattern = { 'filetype>' },
    callback = function()
        vim.treesitter.start()
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr"
    end,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- LSP
-- configs are given by nvim-lspconfig plugin and overridden in /after/lsp dir
-- mason-lspconfig plugin automatically enables all installed lsp servers
--vim.lsp.enable({'lua_ls', 'ts_ls', 'clangd', 'zls', 'rust-analyzer'})
