-- NeoVoid Light colorscheme for Neovim
-- Mid-grey background, purple keywords for maximum pop,
-- systematic bold/italic for visual rhythm.

local colors = {
  bg        = '#B8BAC2', -- Mid blue-grey background
  bg_popup  = '#C6C8D0', -- Slightly lighter for menus / floats (appear raised)
  bg_cursor = '#ABAFBA', -- Cursor line (slightly darker indent)
  fg        = '#18202E', -- Deep blue-grey text

  -- The Blues (Structure)
  primary   = '#0055BB', -- Deep sky blue   (Functions)
  secondary = '#1040A8', -- Royal blue      (Operators, Types)

  -- Keywords: rich violet — clearly distinct from everything else
  violet    = '#7722BB', -- Function/struct keywords
  amethyst  = '#5500AA', -- Control flow (if, else, return, for)

  -- The Data Layers
  periwinkle = '#2E4899', -- Deep periwinkle  (Variables)
  glacial    = '#006666', -- Dark teal         (Strings)
  coral      = '#AA2E00', -- Burnt coral       (Parameters, Properties, Constants)

  muted      = '#686E82', -- Blue-grey         (Comments)
  border     = '#A8AABC', -- Borders / splits
  mid        = '#AAAFBA', -- Cursorline
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

-- Base
hl('Normal',    { fg = colors.fg, bg = colors.bg })
hl('Comment',   { fg = colors.muted, italic = true })

-- Data
hl('String',    { fg = colors.glacial, italic = true })
hl('Constant',  { fg = colors.coral, bold = true })
hl('Number',    { fg = colors.coral })
hl('Boolean',   { fg = colors.coral, bold = true })

-- Variables / functions
hl('Identifier', { fg = colors.periwinkle })
hl('Function',   { fg = colors.primary, bold = true })

-- Control flow — amethyst so they're unmissable
hl('Statement',   { fg = colors.amethyst, bold = true })
hl('Conditional', { fg = colors.amethyst, bold = true })
hl('Repeat',      { fg = colors.amethyst, bold = true })
hl('Label',       { fg = colors.amethyst })
hl('Operator',    { fg = colors.secondary })

-- Structure keywords — violet
hl('Keyword',   { fg = colors.violet, bold = true })
hl('Exception', { fg = colors.violet, bold = true })

hl('Type',       { fg = colors.secondary, italic = true })
hl('Special',    { fg = colors.primary })
hl('Underlined', { fg = colors.primary, underline = true })

hl('Error', { fg = '#FFFFFF', bg = '#CC2200' })
hl('Todo',  { fg = '#FFFFFF', bg = colors.violet, bold = true })

-- UI
hl('CursorLine',   { bg = colors.mid })
hl('CursorLineNr', { fg = colors.violet, bold = true })
hl('LineNr',       { fg = colors.muted })
hl('Visual',       { bg = '#9BA8C8' })
hl('Search',       { fg = colors.fg, bg = '#E8D060' })
hl('IncSearch',    { fg = '#FFFFFF', bg = colors.violet })
hl('Pmenu',        { fg = colors.fg, bg = colors.bg_popup })
hl('PmenuSel',     { fg = '#FFFFFF', bg = colors.primary })
hl('PmenuSbar',    { bg = colors.border })
hl('PmenuThumb',   { bg = colors.muted })
hl('StatusLine',   { fg = colors.fg, bg = colors.bg_popup, bold = true })
hl('StatusLineNC', { fg = colors.muted, bg = colors.bg_popup })
hl('VertSplit',    { fg = colors.border })
hl('WinSeparator', { fg = colors.border })
hl('Title',        { fg = colors.violet, bold = true })
hl('ErrorMsg',     { fg = '#FFFFFF', bg = '#CC2200' })
hl('WarningMsg',   { fg = colors.violet })
hl('MatchParen',   { fg = colors.coral, bold = true, underline = true })
hl('NonText',      { fg = colors.border })
hl('SpecialKey',   { fg = colors.border })
hl('Folded',       { fg = colors.muted, bg = colors.bg_popup, italic = true })
hl('FoldColumn',   { fg = colors.muted, bg = colors.bg })
hl('SignColumn',   { bg = colors.bg })
hl('ColorColumn',  { bg = colors.mid })
hl('Conceal',      { fg = colors.muted })

-- Floats
hl('NormalFloat', { fg = colors.fg, bg = colors.bg_popup })
hl('FloatBorder', { fg = colors.border, bg = colors.bg_popup })

-- Diagnostics
hl('DiagnosticError',         { fg = '#CC2200' })
hl('DiagnosticWarn',          { fg = colors.amethyst })
hl('DiagnosticInfo',          { fg = colors.secondary })
hl('DiagnosticHint',          { fg = colors.glacial })
hl('DiagnosticUnderlineError', { undercurl = true, sp = '#CC2200' })
hl('DiagnosticUnderlineWarn',  { undercurl = true, sp = colors.amethyst })
hl('DiagnosticUnderlineInfo',  { undercurl = true, sp = colors.secondary })
hl('DiagnosticUnderlineHint',  { undercurl = true, sp = colors.glacial })

-- Treesitter — this is where the bold/italic texture lives
hl('@variable',          { fg = colors.periwinkle })
hl('@variable.builtin',  { fg = colors.coral, italic = true })       -- self, this
hl('@variable.parameter',{ fg = colors.coral, italic = true })       -- function params
hl('@variable.member',   { fg = colors.coral })                       -- obj.field

hl('@constant',          { fg = colors.coral, bold = true })
hl('@constant.builtin',  { fg = colors.coral, bold = true, italic = true })

hl('@string',            { fg = colors.glacial, italic = true })
hl('@string.escape',     { fg = colors.violet })
hl('@number',            { fg = colors.coral })
hl('@boolean',           { fg = colors.coral, bold = true })

hl('@function',          { fg = colors.primary, bold = true })
hl('@function.call',     { fg = colors.primary })
hl('@function.builtin',  { fg = colors.primary, bold = true, italic = true })
hl('@function.method',   { fg = colors.primary })
hl('@constructor',       { fg = colors.secondary, bold = true })

-- Keywords: violet + bold, control flow: amethyst + bold
hl('@keyword',           { fg = colors.violet, bold = true })
hl('@keyword.function',  { fg = colors.violet, bold = true })
hl('@keyword.return',    { fg = colors.amethyst, bold = true })
hl('@keyword.operator',  { fg = colors.secondary, bold = true })

hl('@conditional',       { fg = colors.amethyst, bold = true })
hl('@repeat',            { fg = colors.amethyst, bold = true })

hl('@type',              { fg = colors.secondary, italic = true })
hl('@type.builtin',      { fg = colors.secondary, bold = true, italic = true })
hl('@type.definition',   { fg = colors.secondary, bold = true })

hl('@namespace',         { fg = colors.periwinkle, bold = true })
hl('@module',            { fg = colors.periwinkle, bold = true })

hl('@comment',           { fg = colors.muted, italic = true })
hl('@comment.todo',      { fg = '#FFFFFF', bg = colors.violet, bold = true })
hl('@comment.note',      { fg = '#FFFFFF', bg = colors.secondary, bold = true })
hl('@comment.warning',   { fg = '#FFFFFF', bg = colors.amethyst, bold = true })

hl('@tag',               { fg = colors.violet, bold = true })
hl('@tag.attribute',     { fg = colors.periwinkle, italic = true })
hl('@tag.delimiter',     { fg = colors.muted })

hl('@punctuation.delimiter', { fg = colors.muted })
hl('@punctuation.bracket',   { fg = colors.fg })

-- Telescope
hl('TelescopeNormal',       { bg = colors.bg_popup, fg = colors.fg })
hl('TelescopeBorder',       { fg = colors.border, bg = colors.bg_popup })
hl('TelescopePromptBorder', { fg = colors.violet })
hl('TelescopeSelection',    { bg = colors.mid, fg = colors.violet, bold = true })
hl('TelescopeMatching',     { fg = colors.coral, bold = true })

-- GitSigns
hl('GitSignsAdd',    { fg = colors.glacial })
hl('GitSignsChange', { fg = colors.amethyst })
hl('GitSignsDelete', { fg = colors.coral })

-- Diff
hl('DiffAdd',    { bg = '#9ECBA8' })
hl('DiffChange', { bg = '#9AB0D8' })
hl('DiffDelete', { bg = '#D49090' })
hl('DiffText',   { bg = '#8898C8' })
