return {
    {
        'numToStr/Comment.nvim',
        opts = {},
        config = function()
            require('Comment').setup()
        end,
    },
    {
        "kylechui/nvim-surround",
        version = "^3.0.0",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
            })
        end
    },
    {
        'folke/todo-comments.nvim',
        dependencies = {'nvim-lua/plenary.nvim'},
        opts = {}
    }
}
