return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        animate = { enabled = true },
        dim = { enabled = true },
        image = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scroll = { enabled = true },
        zen = { enabled = true },
    },

    keys = {
        { "<leader>z", function() Snacks.zen() end, desc = "Toggle Zen Mode" },
    }
}
