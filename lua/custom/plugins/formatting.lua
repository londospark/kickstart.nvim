-- Custom formatter configuration extending the upstream conform.nvim setup.

return {
  {
    'stevearc/conform.nvim',
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      local extra = {
        rust = { 'leptosfmt' },
        json = { 'prettierd' },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        css = { 'prettierd', 'prettier', stop_after_first = true },
      }
      for ft, formatters in pairs(extra) do
        opts.formatters_by_ft[ft] = formatters
      end
    end,
  },

  -- Ensure Mason installs the formatters we rely on.
  -- leptosfmt is not available in Mason; install via: cargo install leptosfmt
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        'prettierd',
        'prettier',
      })
    end,
  },
}
