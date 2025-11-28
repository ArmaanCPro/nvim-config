return {
    {
        'numToStr/Comment.nvim',
        opts = {},
        config = function()
            require('Comment').setup()
            -- gcc, gc, gc}
        end,
    },
    {
        'nvim-mini/mini.surround',
        event = "VeryLazy",
        config = function()
            require("mini.surround").setup()
        end
    },
    {
        'folke/todo-comments.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {},
        keys = {
            { "<leader>ft", mode = { "n" }, "<cmd>TodoTelescope<CR>", desc = "Find TODOs" },
        },
    },
    {
        'max397574/better-escape.nvim',
        config = function()
            require('better_escape').setup()
        end,
    },
}
