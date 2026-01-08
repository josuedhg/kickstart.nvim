-- lazy.nvim
return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('codecompanion').setup {
      strategies = {
        chat = { adapter = 'ollama', model = 'deepseek-r1:8b' },
        actions = { adapter = 'ollama', model = 'deepseek-r1:8b' },
        inline = { adapter = 'ollama', model = 'deepseek-r1:8b' },
      },
    }
    vim.keymap.set({ 'n', 'v' }, '<leader>a', '<cmd>CodeCompanionActions<cr>', {
      noremap = true,
      silent = true,
      desc = 'Show CodeCompanion [A]ctions',
    })
    vim.keymap.set({ 'n', 'v' }, '<leader>`', '<cmd>CodeCompanionChat Toggle<cr>', {
      noremap = true,
      silent = true,
      desc = 'CodeCompanion Toggle',
    })

    vim.cmd [[cab cc CodeCompanion]]
  end,
  opts = {
    -- NOTE: The log_level is in `opts.opts`
    opts = {
      log_level = 'DEBUG', -- or "TRACE"
    },
  },
}
