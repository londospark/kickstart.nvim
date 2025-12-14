-- NeoVoid colorscheme for Neovim (Coral-Flow Edition)
-- distinct variables (Periwinkle) and warm accents (Coral) for fields/params.

local colors = {
  bg = '#0A0F1A', -- Deep dark blue background
  fg = '#EAF6FF', -- Light icy white text (Punctuation, Delimiters)

  -- The Blues (Structure)
  primary = '#00BFFF', -- Neon blue (Functions)
  secondary = '#1E90FF', -- Electric deep sky blue (Operators)

  -- The Yellows (Logic)
  sun = '#EEDD82', -- Buff/Cream (Control Flow: if, else, return)
  gold = '#E0C060', -- Muted Gold (Keywords: class, def)

  -- The Data Layers (Distinct from Text)
  periwinkle = '#A9C2EF', -- Soft Blue-Purple (Variables) - No longer white!
  glacial = '#AFEEEE', -- Pale Glacial Cyan (Strings)
  coral = '#FF9980', -- Soft Coral (Parameters, Properties, Constants)

  muted = '#456070', -- Blue-grey (Comments)
  dark = '#05080D', -- Almost black
  mid = '#0F1826', -- Mid tone for cursorlines
}

vim.cmd 'highlight clear'

if vim.fn.exists 'syntax_on' then
  vim.cmd 'syntax reset'
end

vim.o.termguicolors = true
vim.o.background = 'dark'
vim.g.colors_name = 'neovoid'

local hl = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Syntax groups
hl('Normal', { fg = colors.fg, bg = colors.bg })
hl('Comment', { fg = colors.muted, italic = true })

-- DATA: Distinct coloring
hl('String', { fg = colors.glacial })
hl('Constant', { fg = colors.coral }) -- Constants get the warm accent
hl('Number', { fg = colors.coral })
hl('Boolean', { fg = colors.coral })

-- VARIABLES: Now Periwinkle (Not White!)
hl('Identifier', { fg = colors.periwinkle })
hl('Function', { fg = colors.primary })

-- LOGIC: Yellows
hl('Statement', { fg = colors.sun }) -- if, while, return
hl('Conditional', { fg = colors.sun })
hl('Repeat', { fg = colors.sun })
hl('Label', { fg = colors.sun })
hl('Operator', { fg = colors.secondary })

-- STRUCTURE: Gold anchors
hl('Keyword', { fg = colors.gold, bold = true })
hl('Exception', { fg = colors.gold })

hl('Type', { fg = colors.secondary })
hl('Special', { fg = colors.primary })
hl('Underlined', { fg = colors.primary, underline = true })

hl('Error', { fg = colors.bg, bg = colors.coral })
hl('Todo', { fg = colors.bg, bg = colors.gold, bold = true })

-- UI
hl('CursorLine', { bg = colors.mid })
hl('CursorLineNr', { fg = colors.gold })
hl('LineNr', { fg = colors.muted })
hl('Visual', { bg = '#123C56' })
hl('Search', { fg = colors.bg, bg = colors.gold })
hl('IncSearch', { fg = colors.bg, bg = colors.sun })
hl('Pmenu', { fg = colors.fg, bg = '#0E1620' })
hl('PmenuSel', { fg = colors.bg, bg = colors.primary })
hl('StatusLine', { fg = colors.fg, bg = '#0E1620' })
hl('StatusLineNC', { fg = colors.muted, bg = '#0E1620' })
hl('VertSplit', { fg = colors.dark })
hl('Title', { fg = colors.gold, bold = true })
hl('ErrorMsg', { fg = colors.bg, bg = colors.coral })
hl('WarningMsg', { fg = colors.bg, bg = colors.sun })

-- Diagnostics
hl('DiagnosticError', { fg = '#E05050' })
hl('DiagnosticWarn', { fg = colors.gold })
hl('DiagnosticInfo', { fg = colors.secondary })
hl('DiagnosticHint', { fg = colors.glacial })
hl('DiagnosticUnderlineError', { undercurl = true, sp = '#E05050' })
hl('DiagnosticUnderlineWarn', { undercurl = true, sp = colors.gold })
hl('DiagnosticUnderlineInfo', { undercurl = true, sp = colors.secondary })
hl('DiagnosticUnderlineHint', { undercurl = true, sp = colors.glacial })

-- Treesitter Mappings
-- This is where we separate "Variables" from "Plain Text"
hl('@variable', { fg = colors.periwinkle }) -- Standard variables
hl('@variable.builtin', { fg = colors.coral }) -- self, this
hl('@variable.parameter', { fg = colors.coral }) -- Function parameters (Coral pop!)
hl('@variable.member', { fg = colors.coral }) -- Object properties (user.name)

hl('@constant', { fg = colors.coral })
hl('@constant.builtin', { fg = colors.coral })

hl('@string', { fg = colors.glacial })
hl('@number', { fg = colors.coral })
hl('@boolean', { fg = colors.coral })

hl('@function', { fg = colors.primary })
hl('@function.call', { fg = colors.primary }) -- Keep calls blue to match definition

hl('@keyword', { fg = colors.gold, bold = true })
hl('@keyword.function', { fg = colors.gold, bold = true })
hl('@keyword.return', { fg = colors.sun })

hl('@conditional', { fg = colors.sun })
hl('@repeat', { fg = colors.sun })

hl('@type', { fg = colors.secondary })
hl('@comment', { fg = colors.muted, italic = true })
hl('@tag', { fg = colors.gold })
hl('@tag.attribute', { fg = colors.periwinkle }) -- Attributes act like variables

-- Telescope
hl('TelescopeNormal', { bg = colors.bg, fg = colors.fg })
hl('TelescopeBorder', { fg = colors.muted, bg = colors.bg })
hl('TelescopePromptBorder', { fg = colors.gold })
hl('TelescopeSelection', { bg = colors.mid, fg = colors.gold })
hl('TelescopeMatching', { fg = colors.coral })

-- GitSigns
hl('GitSignsAdd', { fg = colors.glacial })
hl('GitSignsChange', { fg = colors.gold })
hl('GitSignsDelete', { fg = colors.coral })

-- Diff
hl('DiffAdd', { bg = '#062A35' })
hl('DiffChange', { bg = '#1A2E40' })
hl('DiffDelete', { bg = '#2E0A10' })
hl('DiffText', { bg = '#113850' })
