return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        animate = { enabled = true },
        dim = { enabled = true },
        notifier = { enabled = true },
        zen = { enabled = true },

        terminal = { enabled = false },
        image = { enabled = false },
        lazygit = { enabled = false },
        toggle = { enabled = false },
        bigfile = { enabled = false },
        quickfile = { enabled = false },
        scroll = { enabled = false },
    },

    keys = {
        { "<leader>z", function() Snacks.zen() end, desc = "Toggle Zen Mode" },
    }
}
