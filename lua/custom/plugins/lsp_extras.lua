-- Additional LSP server configurations beyond the kickstart defaults.
-- Servers are registered via vim.lsp.config() (requires Neovim 0.11+) and
-- enabled via vim.lsp.enable() so they integrate with the existing lspconfig setup.
-- Mason tools are extended here too.

local extra_servers = {
  rust_analyzer = {
    settings = {
      ['rust-analyzer'] = {
        procMacro = {
          ignored = {
            leptos_macro = { 'server' }, -- perf: skip leptos server macros
          },
        },
        cargo = {
          allFeatures = true,
          loadOutDirsFromCheck = true,
          buildScripts = { enable = true },
        },
      },
    },
  },

  tailwindcss = {
    filetypes = { 'rust', 'html', 'css' },
    init_options = {
      userLanguages = { rust = 'html' },
    },
    settings = {
      tailwindCSS = {
        experimental = {
          classRegex = {
            'class="([^"]*)"',
            'class: "([^"]*)"',
          },
        },
      },
    },
  },

  emmet_language_server = {
    filetypes = { 'rust', 'html', 'css' },
  },

  ols = {}, -- Odin language server
}

-- Apply server configs and enable them
for name, config in pairs(extra_servers) do
  vim.lsp.config(name, config)
  vim.lsp.enable(name)
end

-- Extend Mason tool installer with our extra tools.
return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        'rust-analyzer',
        'tailwindcss-language-server',
        'emmet-language-server',
      })
    end,
  },
}
