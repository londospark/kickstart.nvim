-- Copilot inline suggestions + Chat.
-- The smart <Tab> keymap that accepts suggestions lives in init.lua.

return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = '<C-l>',
          accept_word = false,
          accept_line = false,
          next = '<M-]>',
          prev = '<M-[>',
          dismiss = '<C-]>',
        },
      },
      panel = { enabled = false },
    },
  },

  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'main',
    dependencies = {
      'zbirenbaum/copilot.lua',
      'nvim-lua/plenary.nvim',
    },
    opts = {
      window = {
        layout = 'float',
        relative = 'editor',
        width = 0.5,
        height = 0.5,
        border = 'single',
        title = 'Copilot Chat',
      },
    },
    keys = {
      { '<leader>cc', ':CopilotChatToggle<CR>', desc = 'Toggle Copilot Chat' },
      { '<leader>ce', ':CopilotChatExplain<CR>', mode = 'v', desc = 'Copilot Explain Selection' },
      { '<leader>cr', ':CopilotChatReview<CR>', mode = 'v', desc = 'Copilot Review Selection' },
      { '<leader>cf', ':CopilotChatFix<CR>', mode = 'v', desc = 'Copilot Fix Selection' },
      { '<leader>cd', ':CopilotChatFixDiagnostic<CR>', desc = 'Copilot Fix Diagnostic' },
    },
  },
}
