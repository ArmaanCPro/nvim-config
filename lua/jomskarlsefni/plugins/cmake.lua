return {
    {
        'Civitasv/cmake-tools.nvim',
        opts = {},
        config = function()
            local osys = require("cmake-tools.osys")
            require("cmake-tools").setup({
                cmake_command = "cmake",
                cmake_build_directory = "build",
                cmake_build_type = "Debug",
                cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
                cmake_build_options = {},
                cmake_console_size = 10,
                cmake_show_console = "always",
                cmake_dap_configuration = {
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return require("cmake-tools").get_executable_target()
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = true,
                    args = function()
                        return vim.split(vim.fn.input("Arguments: "), " ")
                    end,
                },
                cmake_dap_open_command = require("dap").continue,
            })
        end
    },
}
