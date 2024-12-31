return {
  'nomnivore/ollama.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },

  -- All the user commands added by the plugin
  cmd = { 'Ollama', 'OllamaModel', 'OllamaServe', 'OllamaServeStop' },

  keys = {
    -- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
    {
      '<leader>oo',
      ":<c-u>lua require('ollama').prompt()<cr>",
      desc = 'ollama prompt',
      mode = { 'n', 'v' },
    },

    -- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
    {
      '<leader>og',
      ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
      desc = 'ollama Generate Code',
      mode = { 'n', 'v' },
    },

    {
      '<leader>os',
      ":<c-u>lua require('ollama').prompt('Simplify_Code')<cr>",
      desc = 'ollama Simplify Code',
      mode = { 'v' },
    },

    {
      '<leader>oe',
      ":<c-u>lua require('ollama').prompt('Explain_Code')<cr>",
      desc = 'ollama Explain Code',
      mode = { 'v' },
    },

    {
      '<leader>oa',
      ":<c-u>lua require('ollama').prompt('Ask_About_Code')<cr>",
      desc = 'ollama ask about Code',
      mode = { 'v' },
    },

    {
      '<leader>om',
      ":<c-u>lua require('ollama').prompt('Modify_Code')<cr>",
      desc = 'ollama Modify Code',
      mode = { 'v' },
    },
  },

  ---@type Ollama.Config
  opts = {
    -- your configuration overrides
    model = 'mistral',
    url = os.getenv 'OLLAMA_URL' or 'http://127.0.0.1:11434',
    serve = {
      on_start = false,
      command = 'ollama',
      args = { 'serve' },
      stop_command = 'pkill',
      stop_args = { '-SIGTERM', 'ollama' },
    },
  },
}
