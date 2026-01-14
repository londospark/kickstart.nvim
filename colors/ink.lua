-- Wekeroad Ink colorscheme for Neovim (Final Polish)
-- Precision-tuned to the "Take 2" screenshot:
-- Gold Keywords/Built-ins, White User Types, Lime Attributes/Strings.

local colors = {
  bg = '#080808', -- Pitch Black
  fg = '#E6E6E6', -- Silver/White (Variables, User Types, Text)

  -- The Palette
  gold = '#FFB03B', -- Deep Golden Orange (Keywords, Methods, Built-in Types)
  lime = '#B5E853', -- Vibrant Lime Green (Strings, Attributes)
  cyan = '#66CCFF', -- Sky Blue (Numbers, Line Nr)
  lavender = '#D09CEA', -- Soft Purple (Booleans)

  -- UI Elements
  muted = '#555555', -- Medium Grey (Comments)
  selection = '#202020', -- Subtle selection
  guide = '#303030', -- Indent guides
  gutter = '#2B91AF', -- The classic VS Teal/Cyan for line numbers
}

vim.cmd 'highlight clear'

if vim.fn.exists 'syntax_on' then
  vim.cmd 'syntax reset'
end

vim.o.termguicolors = true
vim.o.background = 'dark'
vim.g.colors_name = 'wekeroad_ink'

local hl = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Syntax groups
hl('Normal', { fg = colors.fg, bg = colors.bg })
hl('Comment', { fg = colors.muted, italic = true })

-- LITERALS
hl('String', { fg = colors.lime })
hl('Number', { fg = colors.cyan })
hl('Boolean', { fg = colors.lavender, bold = true }) -- false
hl('Constant', { fg = colors.lavender })

-- LOGIC & ACTION: The "Gold" Layer
hl('Statement', { fg = colors.gold, bold = true })
hl('Conditional', { fg = colors.gold, bold = true })
hl('Repeat', { fg = colors.gold, bold = true })
hl('Keyword', { fg = colors.gold, bold = true }) -- public, class, void
hl('Operator', { fg = colors.fg }) -- = (White)

hl('Function', { fg = colors.gold }) -- RenderView, GetAllUsers
hl('Identifier', { fg = colors.fg }) -- Variables are White

-- STRUCTURE: The Critical Split (Built-in vs User)
hl('Type', { fg = colors.fg }) -- UserData (White)
hl('Structure', { fg = colors.gold }) -- struct, enum (Gold)
hl('Special', { fg = colors.cyan }) -- Escapes
hl('Underlined', { fg = colors.cyan, underline = true })

hl('Error', { fg = colors.fg, bg = '#880000' })
hl('Todo', { fg = colors.bg, bg = colors.gold, bold = true })

-- UI
hl('CursorLine', { bg = '#151515' })
hl('CursorLineNr', { fg = colors.gutter, bold = true }) -- Cyan/Teal Line Numbers
hl('LineNr', { fg = colors.gutter }) -- Cyan/Teal Line Numbers
hl('Visual', { bg = '#333333' })
hl('Search', { fg = colors.bg, bg = colors.gold })
hl('IncSearch', { fg = colors.bg, bg = colors.lime })
hl('Pmenu', { fg = colors.fg, bg = '#151515' })
hl('PmenuSel', { fg = colors.bg, bg = colors.gold })
hl('StatusLine', { fg = colors.fg, bg = '#202020' })
hl('StatusLineNC', { fg = colors.muted, bg = '#080808' })
hl('VertSplit', { fg = '#333333' })
hl('Title', { fg = colors.gold, bold = true })
hl('ErrorMsg', { fg = colors.fg, bg = '#FF0000' })

-- Diagnostics
hl('DiagnosticError', { fg = '#FF4444' })
hl('DiagnosticWarn', { fg = colors.gold })
hl('DiagnosticInfo', { fg = colors.cyan })
hl('DiagnosticHint', { fg = colors.lime })
hl('DiagnosticUnderlineError', { undercurl = true, sp = '#FF4444' })

-- Treesitter Mappings

-- 1. Variables & User Types are WHITE
hl('@variable', { fg = colors.fg })
hl('@variable.builtin', { fg = colors.fg })
hl('@variable.parameter', { fg = colors.fg })
hl('@variable.member', { fg = colors.fg })

hl('@type', { fg = colors.fg }) -- UserData (White)
hl('@constructor', { fg = colors.fg }) -- UserData() (White)

-- 2. Built-in Types are GOLD (Crucial fix!)
hl('@type.builtin', { fg = colors.gold, bold = true }) -- int, void, bool (Gold)

-- 3. Methods & Functions are GOLD
hl('@function', { fg = colors.gold })
hl('@function.call', { fg = colors.gold })
hl('@function.builtin', { fg = colors.gold })

-- 4. Keywords are GOLD
hl('@keyword', { fg = colors.gold, bold = true })
hl('@keyword.function', { fg = colors.gold, bold = true })
hl('@keyword.return', { fg = colors.gold })

-- 5. Literals
hl('@string', { fg = colors.lime })
hl('@number', { fg = colors.cyan })
hl('@boolean', { fg = colors.lavender })
hl('@constant', { fg = colors.lavender })

-- 6. HTML/Tags (Matching the screenshot bottom)
hl('@tag', { fg = colors.fg }) -- < > and tag names are White
hl('@tag.attribute', { fg = colors.lime }) -- Attributes (ID, runat) are LIME (Fix)
hl('@tag.delimiter', { fg = colors.cyan }) -- <% %> Delimiters are Cyan

-- GitSigns
hl('GitSignsAdd', { fg = colors.lime })
hl('GitSignsChange', { fg = colors.gold })
hl('GitSignsDelete', { fg = '#FF4444' })

-- Telescope
hl('TelescopeNormal', { bg = colors.bg, fg = colors.fg })
hl('TelescopeBorder', { fg = colors.guide, bg = colors.bg })
hl('TelescopePromptBorder', { fg = colors.gold })
hl('TelescopeSelection', { bg = colors.selection, fg = colors.gold })
hl('TelescopeMatching', { fg = colors.lime, bold = true })
