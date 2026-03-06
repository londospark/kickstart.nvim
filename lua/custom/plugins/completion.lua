-- UI enhancements and completion tweaks on top of the kickstart defaults.

return {
  -- Fancy cmdline / messages / notifications UI
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {},
    dependencies = {
      'MunifTanjim/nui.nvim',
      {
        'rcarriga/nvim-notify',
        opts = {
          merge_duplicates = true,
          background_colour = '#000000',
        },
      },
    },
  },

  -- Blink.cmp tweaks: use Enter to accept, disable slow cmdline on WSL,
  -- enable friendly-snippets, and add noice as a source.
  {
    'saghen/blink.cmp',
    dependencies = {
      {
        'rafamadriz/friendly-snippets',
        config = function()
          require('luasnip.loaders.from_vscode').lazy_load()
        end,
      },
    },
    opts = function(_, opts)
      opts.keymap = { preset = 'enter' }
      opts.cmdline = { enabled = false } -- WSL cmdline completion is very slow
      opts.snippets = { preset = 'luasnip' }
      opts.sources = opts.sources or {}
      opts.sources.default = { 'lsp', 'path', 'snippets', 'buffer' }
    end,
  },
}
