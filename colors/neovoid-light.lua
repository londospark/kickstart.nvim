-- NeoVoid Light colorscheme for Neovim
-- Light variant of the Coral-Flow edition: pale grey background,
-- deep readable versions of the same semantic colour roles.

local colors = {
  bg        = '#F0F2F5', -- Pale blue-grey background
  bg_popup  = '#E3E8F0', -- Slightly deeper for menus / floats
  bg_cursor = '#D8E0EC', -- Cursor line
  fg        = '#252D3A', -- Deep blue-grey text (punctuation, delimiters)

  -- The Blues (Structure) — darkened for contrast on light
  primary   = '#0066BB', -- Deep sky blue  (Functions)
  secondary = '#1045A0', -- Royal blue     (Operators, Types)

  -- The Yellows (Logic) — shifted to warm ambers so they pop on light
  sun       = '#8B5E00', -- Dark amber     (Control Flow: if, else, return)
  gold      = '#6B4200', -- Deep ochre     (Keywords: fn, let, struct)

  -- The Data Layers
  periwinkle = '#3A5499', -- Deep periwinkle (Variables)
  glacial    = '#006B6B', -- Dark teal       (Strings)
  coral      = '#B83200', -- Burnt coral     (Parameters, Properties, Constants)

  muted      = '#7A8FA0', -- Blue-grey       (Comments)
  border     = '#C0C8D8', -- Border / split lines
  dark       = '#D0D8E8', -- Used where dark theme used near-black
  mid        = '#D8E0EC', -- Cursorline / selection accent
}

vim.cmd 'highlight clear'

if vim.fn.exists 'syntax_on' then
  vim.cmd 'syntax reset'
end

vim.o.termguicolors = true
vim.o.background = 'light'
vim.g.colors_name = 'neovoid-light'

local hl = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Syntax groups
hl('Normal', { fg = colors.fg, bg = colors.bg })
hl('Comment', { fg = colors.muted, italic = true })

-- DATA
hl('String', { fg = colors.glacial })
hl('Constant', { fg = colors.coral })
hl('Number', { fg = colors.coral })
hl('Boolean', { fg = colors.coral })

-- VARIABLES
hl('Identifier', { fg = colors.periwinkle })
hl('Function', { fg = colors.primary })

-- LOGIC
hl('Statement', { fg = colors.sun })
hl('Conditional', { fg = colors.sun })
hl('Repeat', { fg = colors.sun })
hl('Label', { fg = colors.sun })
hl('Operator', { fg = colors.secondary })

-- STRUCTURE
hl('Keyword', { fg = colors.gold, bold = true })
hl('Exception', { fg = colors.gold })

hl('Type', { fg = colors.secondary })
hl('Special', { fg = colors.primary })
hl('Underlined', { fg = colors.primary, underline = true })

hl('Error', { fg = '#FFFFFF', bg = '#CC2200' })
hl('Todo', { fg = '#FFFFFF', bg = colors.gold, bold = true })

-- UI
hl('CursorLine', { bg = colors.mid })
hl('CursorLineNr', { fg = colors.gold })
hl('LineNr', { fg = colors.muted })
hl('Visual', { bg = '#C4D0E8' })
hl('Search', { fg = colors.fg, bg = '#FFD878' })
hl('IncSearch', { fg = '#FFFFFF', bg = colors.gold })
hl('Pmenu', { fg = colors.fg, bg = colors.bg_popup })
hl('PmenuSel', { fg = '#FFFFFF', bg = colors.primary })
hl('PmenuSbar', { bg = colors.border })
hl('PmenuThumb', { bg = colors.muted })
hl('StatusLine', { fg = colors.fg, bg = colors.bg_popup })
hl('StatusLineNC', { fg = colors.muted, bg = colors.bg_popup })
hl('VertSplit', { fg = colors.border })
hl('WinSeparator', { fg = colors.border })
hl('Title', { fg = colors.gold, bold = true })
hl('ErrorMsg', { fg = '#FFFFFF', bg = '#CC2200' })
hl('WarningMsg', { fg = colors.gold })
hl('MatchParen', { fg = colors.coral, bold = true, underline = true })
hl('NonText', { fg = colors.border })
hl('SpecialKey', { fg = colors.border })
hl('Folded', { fg = colors.muted, bg = colors.bg_popup })
hl('FoldColumn', { fg = colors.muted, bg = colors.bg })
hl('SignColumn', { bg = colors.bg })
hl('ColorColumn', { bg = colors.mid })
hl('Conceal', { fg = colors.muted })

-- Floats / bordered windows
hl('NormalFloat', { fg = colors.fg, bg = colors.bg_popup })
hl('FloatBorder', { fg = colors.border, bg = colors.bg_popup })

-- Diagnostics
hl('DiagnosticError', { fg = '#CC2200' })
hl('DiagnosticWarn', { fg = colors.gold })
hl('DiagnosticInfo', { fg = colors.secondary })
hl('DiagnosticHint', { fg = colors.glacial })
hl('DiagnosticUnderlineError', { undercurl = true, sp = '#CC2200' })
hl('DiagnosticUnderlineWarn', { undercurl = true, sp = colors.gold })
hl('DiagnosticUnderlineInfo', { undercurl = true, sp = colors.secondary })
hl('DiagnosticUnderlineHint', { undercurl = true, sp = colors.glacial })

-- Treesitter
hl('@variable', { fg = colors.periwinkle })
hl('@variable.builtin', { fg = colors.coral })
hl('@variable.parameter', { fg = colors.coral })
hl('@variable.member', { fg = colors.coral })

hl('@constant', { fg = colors.coral })
hl('@constant.builtin', { fg = colors.coral })

hl('@string', { fg = colors.glacial })
hl('@number', { fg = colors.coral })
hl('@boolean', { fg = colors.coral })

hl('@function', { fg = colors.primary })
hl('@function.call', { fg = colors.primary })

hl('@keyword', { fg = colors.gold, bold = true })
hl('@keyword.function', { fg = colors.gold, bold = true })
hl('@keyword.return', { fg = colors.sun })

hl('@conditional', { fg = colors.sun })
hl('@repeat', { fg = colors.sun })

hl('@type', { fg = colors.secondary })
hl('@comment', { fg = colors.muted, italic = true })
hl('@tag', { fg = colors.gold })
hl('@tag.attribute', { fg = colors.periwinkle })

-- Telescope
hl('TelescopeNormal', { bg = colors.bg_popup, fg = colors.fg })
hl('TelescopeBorder', { fg = colors.border, bg = colors.bg_popup })
hl('TelescopePromptBorder', { fg = colors.gold })
hl('TelescopeSelection', { bg = colors.mid, fg = colors.gold })
hl('TelescopeMatching', { fg = colors.coral })

-- GitSigns
hl('GitSignsAdd', { fg = colors.glacial })
hl('GitSignsChange', { fg = colors.gold })
hl('GitSignsDelete', { fg = colors.coral })

-- Diff
hl('DiffAdd', { bg = '#D0EDD8' })
hl('DiffChange', { bg = '#D8E4F4' })
hl('DiffDelete', { bg = '#F4D0CC' })
hl('DiffText', { bg = '#BCCFE8' })
