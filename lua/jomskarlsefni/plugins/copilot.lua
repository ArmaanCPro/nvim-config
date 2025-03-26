return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = false,
                    hide_during_completion = false,
                    debounce = 25,
                    keymap = {
                        accept = false,
                        accept_word = false,
                        accept_line = "<S-tab>",
                        next = false,
                        prev = false,
                        dismiss = false,
                    },
                },
                filetypes = {
                    ["*"] = true,
                },
            })
        end,
    },
    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup()
        end,
    },
    {
        'AndreM222/copilot-lualine',
    },
}
