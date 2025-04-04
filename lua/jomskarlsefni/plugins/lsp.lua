return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "stevearc/conform.nvim",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "gopls",
                "clangd",
                "zls"
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities,
                    }
                end,

                clangd = function()
                    local lspconfig = require("lspconfig")

                    local function should_format()
                        local params = vim.lsp.util.make_formatting_params({})
                        local result = vim.lsp.buf_request_sync(0, "textDocument/formatting", params, 1000)

                        if result and next(result) ~= nil then
                            return true
                        end
                        return false
                    end

                    lspconfig.clangd.setup({
                        cmd = { "clangd", "--fallback-style=none" }, --don't format if clang-format isn't present
                        on_attach = function(client, bufnr)
                            local opts = { noremap = true, silent = true, buffer = bufnr }
                            vim.keymap.set("n", "<A-o>", "<cmd>ClangdSwitchSourceHeader<CR>", opts)

                            if should_format() then
                                -- formatting on save
                                client.server_capabilities.documentFormattingProvider = true
                                vim.api.nvim_create_autocmd("BufWritePre", {
                                    buffer = bufnr,
                                    callback = function()
                                        vim.lsp.buf.format()
                                    end,
                                })
                            else
                                client.server_capabilities.documentFormattingProvider = false
                            end
                        end,
                    })
                end,

                zls = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.zls.setup({
                        root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
                        settings = {
                            zls = {
                                enable_inlay_hints = true,
                                enable_snippets = true,
                                warn_style = true,
                            },
                        },
                    })
                    vim.g.zig_fmt_parse_errors = 0
                    vim.g.zig_fmt_autosave = 0
                end,
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.4" },
                                diagnostics = {
                                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,
                rust_analyzer = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.rust_analyzer.setup({
                    capabilities = capabilities,
                    settings = {
                        ["rust-analyzer"] = {
                            assist = {
                                importEnforceGranularity = true,
                                importPrefix = "by_self",
                            },
                            cargo = {
                                loadOutDirsFromCheck = true,
                            },
                            procMacro = {
                                enable = true,
                            },
                            checkOnSave = {
                                command = "clippy", -- Use Clippy instead of `check` (which is cargo check)
                            },
                            inlayHints = {
                                lifetimeElisionHints = { enable = true, useParameterNames = true },
                                reborrowHints = { enable = "always" },
                                bindingModeHints = { enable = true },
                            },
                        },
                    },
                })
                end,
            }
        })
        require("conform").setup({
            formatters_by_ft = {
                --cpp = { "clangd" }, clangd is not a formatter inherintly, so check the clangd.setup for formatting
            },
            format_on_save = {
                lsp = true,
                timeout_ms = 5000,
            }
        })
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = "copilot", group_index = 2 },
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
