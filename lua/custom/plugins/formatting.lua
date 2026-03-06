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
}
