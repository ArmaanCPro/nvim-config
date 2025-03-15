return {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    event = "VeryLazy",
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'auto',
            }
        }
    end
}
