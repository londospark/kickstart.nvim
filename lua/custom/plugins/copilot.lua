return {

  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {
      suggestion = {
        enabled = true,
        auto_trigger = true, -- Automatically show ghost text
        debounce = 75,
        keymap = {
          accept = '<C-l>',
          accept_word = false,
          accept_line = false,
          next = '<M-]>', -- Alt+] to cycle to next suggestion
          prev = '<M-[>', -- Alt+[ to cycle to previous suggestion
          dismiss = '<C-]>',
        },
      },
      panel = { enabled = false }, -- Disable the side panel (optional)
    }
  end,
}
