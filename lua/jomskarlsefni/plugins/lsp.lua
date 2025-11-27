return {
    {
        "neovim/nvim-lspconfig",
    },
    {
        "mason-org/mason.nvim",
        opts = {}
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            'mason-org/mason.nvim',
            'neovim/nvim-lspconfig',
        }
        -- automatically enables all installed lsp servers
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        config = function()
            require('mason-tool-installer').setup({
                  -- this has a better ensure_installed than mason-lspconfig itself as it can auto install non-lsp servers in mason
                  ensure_installed = {
                      "lua_ls",
                      "rust_analyzer",
                      "gopls",
                      "clangd",
                      "zls",
                      "ts_ls",
                      "black",
                  },
            })
      end
    },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {}
    },
    {
        "j-hui/fidget.nvim",
        opts = {}
    }
}
