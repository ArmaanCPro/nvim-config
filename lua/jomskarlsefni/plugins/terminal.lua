return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
            require('toggleterm').setup({
                open_mapping = "<C-t>", -- Toggle terminal with Ctrl-T
                insert_mappings = true,
                terminal_mappings = true,
                hide_numbers = true,
                autochdir = true,
                close_on_exit = true,
                auto_scroll = true,
            })
        end,
    },
}
