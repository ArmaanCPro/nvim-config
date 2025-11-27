-- plugins/telescope.lua:
return {
    'nvim-telescope/telescope.nvim', tag = 'v0.1.9',
    dependencies = { 'nvim-lua/plenary.nvim' },

    config = function()
      require('telescope').setup({})

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
      vim.keymap.set('n', '<C-p>', builtin.git_files, {})
      vim.keymap.set('n', '<leader>ps', function()
          builtin.grep_string({ search = vim.fn.input("Grep > ") });
      end)

      vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>ph', builtin.help_tags, { desc = 'Telescope help tags' })
	end
}

