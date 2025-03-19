require("jomskarlsefni.plugins.color_scheme")

return {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    event = "VeryLazy",
    config = function()
        require('lualine').setup({
            options = {
                icons_enabled = true,
                theme = 'palenight',
            },
            sections = {
                lualine_x = { 'copilot', 'encoding', 'fileformat', 'filetype' },
            },
        })
    end
}
