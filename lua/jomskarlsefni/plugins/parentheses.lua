return {
    {
        "HiPhish/rainbow-delimiters.nvim",
    },
    {
        "m4xshen/autoclose.nvim",
        config = function()
            require("autoclose").setup({
                disabled_filetypes = { "text", "markdown" },
            })
        end
    }
}
