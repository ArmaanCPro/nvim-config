-- plugins/telescope.lua:
return {
    {
        'nvim-telescope/telescope.nvim', tag = 'v0.1.9',
        dependencies = { 'nvim-lua/plenary.nvim' },

        config = function()
          require('telescope').setup({
              extensions = {
                  fzf = {
                      fuzzy = true,
                      override_generic_sorter = true,
                      override_file_sorter = true,
                      case_mode = "smart_case",
                  }
              }
          })

          local builtin = require('telescope.builtin')
          vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
          vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope git files' })
          vim.keymap.set('n', '<leader>ps', function()
              builtin.grep_string({ search = vim.fn.input("Grep > ") });
          end, { desc = 'Telescope grep string' })

          vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = 'Telescope live grep' })
          vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = 'Telescope buffers' })
          vim.keymap.set('n', '<leader>ph', builtin.help_tags, { desc = 'Telescope help tags' })
        end
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install',
        config = function()
            require('telescope').load_extension('fzf')
        end
    }
}

