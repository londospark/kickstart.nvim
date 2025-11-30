-- ---- NeoVoid Theme (single-file, no clone, works with Kickstart.nvim) ----
-- Drop this file into lua/plugins/ and you're done.
-- Lazy will just run this config and not try to clone anything.

return {
  dir = '.',
  priority = 1000,
  lazy = false,
  config = function()
    --------------------------------------------------------------------
    -- Color palette
    --------------------------------------------------------------------
    local colors = {
      bg = '#0A0F1A', -- Deep dark blue background
      fg = '#EAF6FF', -- Light icy white text
      primary = '#00BFFF', -- Neon blue
      secondary = '#1E90FF', -- Electric deep sky blue
      accent = '#009ACD', -- Softer neon blue
      muted = '#355A66', -- Dim teal-gray
      dark = '#05080D', -- Almost black
      mid = '#0F1826', -- Mid tone for cursorlines
    }

    --------------------------------------------------------------------
    -- Setup
    --------------------------------------------------------------------
    vim.cmd 'highlight clear'
    vim.cmd 'set termguicolors'
    vim.o.background = 'dark'
    vim.g.colors_name = 'neovoid'

    local hl = function(group, opts)
      vim.api.nvim_set_hl(0, group, opts)
    end

    --------------------------------------------------------------------
    -- Syntax
    --------------------------------------------------------------------
    hl('Normal', { fg = colors.fg, bg = colors.bg })
    hl('Comment', { fg = colors.muted, italic = true })
    hl('Constant', { fg = colors.secondary })
    hl('String', { fg = colors.accent })
    hl('Number', { fg = colors.secondary })
    hl('Boolean', { fg = colors.primary, bold = true })
    hl('Identifier', { fg = colors.accent })
    hl('Function', { fg = colors.primary, bold = true })
    hl('Statement', { fg = colors.secondary, bold = true })
    hl('Keyword', { fg = colors.primary, bold = true })
    hl('Type', { fg = colors.secondary })
    hl('Special', { fg = colors.accent })
    hl('Underlined', { fg = colors.primary, underline = true })
    hl('Error', { fg = colors.bg, bg = colors.secondary, bold = true })
    hl('Todo', { fg = colors.primary, bold = true })

    --------------------------------------------------------------------
    -- UI Elements
    --------------------------------------------------------------------
    hl('CursorLine', { bg = colors.mid })
    hl('CursorLineNr', { fg = colors.primary, bold = true })
    hl('LineNr', { fg = colors.muted })
    hl('Visual', { bg = '#123C56' })
    hl('Search', { fg = colors.bg, bg = colors.primary })
    hl('IncSearch', { fg = colors.bg, bg = colors.secondary })
    hl('Pmenu', { fg = colors.fg, bg = '#0E1620' })
    hl('PmenuSel', { fg = colors.bg, bg = colors.primary })
    hl('StatusLine', { fg = colors.fg, bg = '#0E1620' })
    hl('StatusLineNC', { fg = colors.muted, bg = '#0E1620' })
    hl('VertSplit', { fg = colors.dark })
    hl('Title', { fg = colors.primary, bold = true })
    hl('ErrorMsg', { fg = colors.bg, bg = colors.secondary, bold = true })
    hl('WarningMsg', { fg = colors.bg, bg = colors.accent })

    --------------------------------------------------------------------
    -- Diagnostics / LSP
    --------------------------------------------------------------------
    hl('DiagnosticError', { fg = '#FF0040' })
    hl('DiagnosticWarn', { fg = '#FFD700' })
    hl('DiagnosticInfo', { fg = colors.secondary })
    hl('DiagnosticHint', { fg = colors.accent })
    hl('DiagnosticUnderlineError', { undercurl = true, sp = '#FF0040' })
    hl('DiagnosticUnderlineWarn', { undercurl = true, sp = '#FFD700' })
    hl('DiagnosticUnderlineInfo', { undercurl = true, sp = colors.secondary })
    hl('DiagnosticUnderlineHint', { undercurl = true, sp = colors.accent })

    --------------------------------------------------------------------
    -- Treesitter
    --------------------------------------------------------------------
    hl('@variable', { fg = colors.fg })
    hl('@constant', { fg = colors.secondary })
    hl('@string', { fg = colors.accent })
    hl('@number', { fg = colors.secondary })
    hl('@boolean', { fg = colors.primary })
    hl('@function', { fg = colors.primary, bold = true })
    hl('@keyword', { fg = colors.primary })
    hl('@type', { fg = colors.secondary })
    hl('@comment', { fg = colors.muted, italic = true })
    hl('@tag', { fg = colors.accent })

    --------------------------------------------------------------------
    -- Telescope
    --------------------------------------------------------------------
    hl('TelescopeNormal', { bg = colors.bg, fg = colors.fg })
    hl('TelescopeBorder', { fg = colors.muted, bg = colors.bg })
    hl('TelescopePromptBorder', { fg = colors.primary })
    hl('TelescopeSelection', { bg = colors.mid, fg = colors.primary, bold = true })
    hl('TelescopeMatching', { fg = colors.secondary, bold = true })

    --------------------------------------------------------------------
    -- GitSigns
    --------------------------------------------------------------------
    hl('GitSignsAdd', { fg = '#00BFFF' })
    hl('GitSignsChange', { fg = '#1E90FF' })
    hl('GitSignsDelete', { fg = '#FF0040' })

    --------------------------------------------------------------------
    -- Diff
    --------------------------------------------------------------------
    hl('DiffAdd', { bg = '#062A35' })
    hl('DiffChange', { bg = '#1A2E40' })
    hl('DiffDelete', { bg = '#2E0A10' })
    hl('DiffText', { bg = '#113850' })
  end,
}
