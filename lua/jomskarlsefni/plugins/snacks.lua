return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        animate = { enabled = true },
        dim = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scroll = { enabled = true },
        zen = { enabled = true },

        terminal = { enabled = false },
        image = { enabled = false },
        lazygit = { enabled = false },
        toggle = { enabled = false },
    },

    keys = {
        { "<leader>z", function() Snacks.zen() end, desc = "Toggle Zen Mode" },
    }
}
