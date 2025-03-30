--[[
Conqueror.nvim - A cyberpunk-inspired Neovim color scheme
Based on a monochromatic teal foundation with vibrant accent highlights

MIT License

Copyright (c) 2025 Simon Zuluaga

Permission is hereby granted, free of charge, to any person obtaining a copy of this software
and associated documentation files (the "Software"), to deal in the Software without restriction.
For the full license information, see the LICENSE file.
--]]

-- Conqueror.nvim: A cyberpunk-inspired Neovim color scheme
-- Based on a monochromatic teal foundation with vibrant accent highlights

-- Type definitions for configuration
--- @class ItalicConfig
--- @field strings boolean
--- @field comments boolean
--- @field operators boolean
--- @field folds boolean
--- @field emphasis boolean

--- @class HighlightDefinition
--- @field fg string?
--- @field bg string?
--- @field sp string?
--- @field blend integer?
--- @field bold boolean?
--- @field standout boolean?
--- @field underline boolean?
--- @field undercurl boolean?
--- @field underdouble boolean?
--- @field underdotted boolean?
--- @field strikethrough boolean?
--- @field italic boolean?
--- @field reverse boolean?
--- @field nocombine boolean?

--- @class ConquerorConfig
--- @field terminal_colors boolean?
--- @field undercurl boolean?
--- @field underline boolean?
--- @field bold boolean?
--- @field italic ItalicConfig?
--- @field strikethrough boolean?
--- @field invert_selection boolean?
--- @field invert_signs boolean?
--- @field invert_tabline boolean?
--- @field invert_intend_guides boolean?
--- @field inverse boolean?
--- @field transparent_mode boolean?
--- @field dim_inactive boolean?
--- @field palette_overrides table<string, string>?
--- @field overrides table<string, HighlightDefinition>?

local Conqueror = {}

-- Default configuration
Conqueror.config = {
  terminal_colors = true,
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true,
  transparent_mode = false,
  dim_inactive = false,
  palette_overrides = {},
  overrides = {},
}

-- Load the color palette
Conqueror.palette = require("conqueror.palette")

-- Map palette colors to color groups used in highlighting
local function get_colors()
  local palette = Conqueror.palette
  local config = Conqueror.config

  -- Apply any user palette overrides
  for color, hex in pairs(config.palette_overrides) do
    palette[color] = hex
  end

  -- Define color groups that will be used for highlighting
  local color_groups = {
    bg0 = palette.bg0,
    bg1 = palette.bg1,
    bg2 = palette.bg2,
    bg3 = palette.bg3,
    bg4 = palette.bg4,
    fg0 = palette.fg0,
    fg1 = palette.fg1,
    fg2 = palette.fg2,
    fg3 = palette.fg3,
    fg4 = palette.fg4,

    -- Primary semantic colors
    red = palette.bright_red,
    green = palette.bright_green,
    yellow = palette.bright_yellow,
    blue = palette.bright_blue,
    purple = palette.bright_purple,
    aqua = palette.bright_aqua,
    orange = palette.bright_orange,

    -- Neutral semantic colors
    neutral_red = palette.neutral_red,
    neutral_green = palette.neutral_green,
    neutral_yellow = palette.neutral_yellow,
    neutral_blue = palette.neutral_blue,
    neutral_purple = palette.neutral_purple,
    neutral_aqua = palette.neutral_aqua,
    neutral_orange = palette.neutral_orange,

    -- Special purpose colors
    dark_red = palette.dark_red,
    dark_green = palette.dark_green,
    dark_aqua = palette.dark_aqua,
    gray = palette.gray,
    light_gray = palette.light_gray,

    -- Accent colors for special highlights
    accent_primary = palette.accent_primary,
    accent_secondary = palette.accent_secondary,
    accent_tertiary = palette.accent_tertiary,
    accent_quaternary = palette.accent_quaternary,
    accent_quinary = palette.accent_quinary,
  }

  return color_groups
end

-- Define all highlight groups
local function get_groups()
  local colors = get_colors()
  local config = Conqueror.config

  -- Set up terminal colors if enabled
  if config.terminal_colors then
    local term_colors = {
      colors.bg0, -- Black
      colors.neutral_red, -- Red
      colors.neutral_green, -- Green
      colors.neutral_yellow, -- Yellow
      colors.neutral_blue, -- Blue
      colors.neutral_purple, -- Magenta
      colors.neutral_aqua, -- Cyan
      colors.fg4, -- White
      colors.gray, -- Bright Black
      colors.red, -- Bright Red
      colors.green, -- Bright Green
      colors.yellow, -- Bright Yellow
      colors.blue, -- Bright Blue
      colors.purple, -- Bright Magenta
      colors.aqua, -- Bright Cyan
      colors.fg1, -- Bright White
    }

    -- Set terminal colors
    for index, color in ipairs(term_colors) do
      vim.g["terminal_color_" .. index - 1] = color
    end
  end

  -- Define highlight groups
  local groups = {
    ------------------------
    -- Style Template Groups
    ------------------------
    -- These are used as building blocks for syntax highlighting

    -- Foreground styles
    ConquerorFg0 = { fg = colors.fg0 },
    ConquerorFg1 = { fg = colors.fg1 },
    ConquerorFg2 = { fg = colors.fg2 },
    ConquerorFg3 = { fg = colors.fg3 },
    ConquerorFg4 = { fg = colors.fg4 },
    ConquerorGray = { fg = colors.gray },
    ConquerorLightGray = { fg = colors.light_gray },

    -- Background styles
    ConquerorBg0 = { fg = colors.bg0 },
    ConquerorBg1 = { fg = colors.bg1 },
    ConquerorBg2 = { fg = colors.bg2 },
    ConquerorBg3 = { fg = colors.bg3 },
    ConquerorBg4 = { fg = colors.bg4 },

    -- Bold variants
    ConquerorFg0Bold = { fg = colors.fg0, bold = config.bold },
    ConquerorRedBold = { fg = colors.red, bold = config.bold },
    ConquerorGreenBold = { fg = colors.green, bold = config.bold },
    ConquerorYellowBold = { fg = colors.yellow, bold = config.bold },
    ConquerorBlueBold = { fg = colors.blue, bold = config.bold },
    ConquerorPurpleBold = { fg = colors.purple, bold = config.bold },
    ConquerorAquaBold = { fg = colors.aqua, bold = config.bold },
    ConquerorOrangeBold = { fg = colors.orange, bold = config.bold },

    -- Color variants
    ConquerorRed = { fg = colors.red },
    ConquerorGreen = { fg = colors.green },
    ConquerorYellow = { fg = colors.yellow },
    ConquerorBlue = { fg = colors.blue },
    ConquerorPurple = { fg = colors.purple },
    ConquerorAqua = { fg = colors.aqua },
    ConquerorOrange = { fg = colors.orange },
    ConquerorNeutralAqua = { fg = colors.neutral_aqua },

    -- Accent colors for special highlights
    ConquerorAccentPrimary = { fg = colors.accent_primary },
    ConquerorAccentSecondary = { fg = colors.accent_secondary },
    ConquerorAccentTertiary = { fg = colors.accent_tertiary },
    ConquerorAccentQuaternary = { fg = colors.accent_quaternary },
    ConquerorAccentQuinary = { fg = colors.accent_quinary },

    -- Sign column highlights
    ConquerorRedSign = config.transparent_mode and { fg = colors.red, reverse = config.invert_signs }
      or { fg = colors.red, bg = colors.bg0, reverse = config.invert_signs },
    ConquerorGreenSign = config.transparent_mode and { fg = colors.green, reverse = config.invert_signs }
      or { fg = colors.green, bg = colors.bg0, reverse = config.invert_signs },
    ConquerorYellowSign = config.transparent_mode and { fg = colors.yellow, reverse = config.invert_signs }
      or { fg = colors.yellow, bg = colors.bg0, reverse = config.invert_signs },
    ConquerorBlueSign = config.transparent_mode and { fg = colors.blue, reverse = config.invert_signs }
      or { fg = colors.blue, bg = colors.bg0, reverse = config.invert_signs },
    ConquerorPurpleSign = config.transparent_mode and { fg = colors.purple, reverse = config.invert_signs }
      or { fg = colors.purple, bg = colors.bg0, reverse = config.invert_signs },
    ConquerorAquaSign = config.transparent_mode and { fg = colors.aqua, reverse = config.invert_signs }
      or { fg = colors.aqua, bg = colors.bg0, reverse = config.invert_signs },
    ConquerorOrangeSign = config.transparent_mode and { fg = colors.orange, reverse = config.invert_signs }
      or { fg = colors.orange, bg = colors.bg0, reverse = config.invert_signs },

    -- Underline variants
    ConquerorRedUnderline = { undercurl = config.undercurl, sp = colors.red },
    ConquerorGreenUnderline = { undercurl = config.undercurl, sp = colors.green },
    ConquerorYellowUnderline = { undercurl = config.undercurl, sp = colors.yellow },
    ConquerorBlueUnderline = { undercurl = config.undercurl, sp = colors.blue },
    ConquerorPurpleUnderline = { undercurl = config.undercurl, sp = colors.purple },
    ConquerorAquaUnderline = { undercurl = config.undercurl, sp = colors.aqua },
    ConquerorOrangeUnderline = { undercurl = config.undercurl, sp = colors.orange },

    -- Special selections
    ConquerorSelectionHighlight = { bg = colors.bg3 },
    ConquerorOcurrenceSelection = { bg = colors.bg2 },

    --------------------------
    -- Editor Display Groups
    --------------------------

    -- Base UI elements
    Normal = config.transparent_mode and { fg = colors.fg1, bg = nil } or { fg = colors.fg1, bg = colors.bg1 },
    NormalFloat = config.transparent_mode and { fg = colors.fg1, bg = nil } or { fg = colors.fg1, bg = colors.bg1 },
    NormalNC = config.dim_inactive and { fg = colors.fg1, bg = colors.bg2 } or { link = "Normal" },

    -- Cursor and lines
    Cursor = { reverse = config.inverse },
    vCursor = { link = "Cursor" },
    iCursor = { link = "Cursor" },
    lCursor = { link = "Cursor" },
    CursorLine = { bg = colors.bg2 },
    CursorColumn = { link = "CursorLine" },
    CursorLineNr = { fg = colors.accent_primary, bg = colors.bg2 },
    CursorLineBG = { bg = colors.bg2 },

    -- Line numbers and signs
    LineNr = { fg = colors.fg3 },
    SignColumn = config.transparent_mode and { bg = nil } or { bg = colors.bg1 },

    -- Status and tab lines
    StatusLine = { fg = colors.bg2, bg = colors.fg1, reverse = config.inverse },
    StatusLineNC = { fg = colors.bg1, bg = colors.fg3, reverse = config.inverse },
    TabLineFill = { fg = colors.bg4, bg = colors.bg1, reverse = config.invert_tabline },
    TabLineSel = { fg = colors.green, bg = colors.bg1, reverse = config.invert_tabline },
    TabLine = { link = "TabLineFill" },

    -- Window elements
    WinBar = { fg = colors.fg4, bg = nil },
    WinBarNC = { fg = colors.fg3, bg = nil },
    WinSeparator = config.transparent_mode and { fg = colors.bg3, bg = nil } or { fg = colors.bg3, bg = colors.bg1 },

    -- Search and selection
    Search = { fg = colors.bg0, bg = colors.accent_secondary, bold = config.bold },
    IncSearch = { fg = colors.bg0, bg = colors.accent_primary, bold = config.bold },
    CurSearch = { fg = colors.bg0, bg = colors.accent_quinary, bold = config.bold },
    Visual = { bg = colors.bg3, reverse = config.invert_selection },
    VisualNOS = { link = "Visual" },

    -- Popup menu
    Pmenu = { fg = colors.fg1, bg = colors.bg2 },
    PmenuSel = { fg = colors.bg0, bg = colors.accent_primary, bold = config.bold },
    PmenuSbar = { bg = colors.bg2 },
    PmenuThumb = { bg = colors.bg4 },

    -- Folds and conceals
    Folded = { fg = colors.fg3, bg = colors.bg2, italic = config.italic.folds },
    FoldColumn = config.transparent_mode and { fg = colors.fg3, bg = nil } or { fg = colors.fg3, bg = colors.bg2 },
    Conceal = { fg = colors.blue },

    -- Diff highlighting
    DiffDelete = { bg = colors.dark_red, fg = colors.fg3 },
    DiffAdd = { bg = colors.dark_green, fg = colors.fg1 },
    DiffChange = { bg = colors.dark_aqua, fg = colors.fg2 },
    DiffText = { bg = colors.fg4, fg = colors.bg0 },

    -- Spelling
    SpellCap = { link = "ConquerorBlueUnderline" },
    SpellBad = { link = "ConquerorRedUnderline" },
    SpellLocal = { link = "ConquerorAquaUnderline" },
    SpellRare = { link = "ConquerorPurpleUnderline" },

    -- Miscellaneous
    ColorColumn = { bg = colors.bg2 },
    NonText = { link = "ConquerorBg2" },
    SpecialKey = { link = "ConquerorFg4" },
    MatchParen = { fg = colors.bg0, bg = colors.accent_primary, bold = config.bold },
    WildMenu = { fg = colors.accent_quinary, bg = colors.bg2, bold = config.bold },
    Directory = { link = "ConquerorBlueBold" },
    QuickFixLine = { bg = colors.bg2, fg = colors.accent_primary, bold = config.bold },

    -- Messages
    ErrorMsg = { fg = colors.accent_tertiary, bg = colors.bg0, bold = config.bold },
    WarningMsg = { fg = colors.accent_secondary, bold = config.bold },
    MoreMsg = { fg = colors.accent_primary, bold = config.bold },
    ModeMsg = { fg = colors.fg1, bold = config.bold },
    Question = { fg = colors.accent_quinary, bold = config.bold },
    Title = { fg = colors.accent_primary, bold = config.bold },

    -- Separators and special characters
    Whitespace = { fg = colors.bg3 },
    Delimiter = { fg = colors.fg2 },
    EndOfBuffer = { link = "NonText" },

    --------------------------
    -- Syntax Highlighting Groups
    --------------------------

    -- Comments
    Comment = { fg = colors.fg3, italic = config.italic.comments },
    SpecialComment = { fg = colors.fg3, italic = config.italic.comments, bold = config.bold },

    -- Constants
    Constant = { fg = colors.accent_secondary },
    String = { fg = colors.fg2, italic = config.italic.strings },
    Character = { fg = colors.accent_quaternary },
    Number = { fg = colors.accent_secondary },
    Boolean = { fg = colors.accent_secondary, bold = config.bold },
    Float = { fg = colors.accent_secondary },

    -- Identifiers
    Identifier = { fg = colors.fg1 },
    Function = { fg = colors.accent_primary },

    -- Statements
    Statement = { fg = colors.accent_quinary },
    Conditional = { fg = colors.accent_quinary, bold = config.bold },
    Repeat = { fg = colors.accent_quinary, bold = config.bold },
    Label = { fg = colors.accent_quinary },
    Operator = { fg = colors.fg2, italic = config.italic.operators },
    Keyword = { fg = colors.accent_quinary },
    Exception = { fg = colors.accent_tertiary },

    -- Preprocessor
    PreProc = { fg = colors.accent_quaternary },
    Include = { fg = colors.accent_quaternary, bold = config.bold },
    Define = { fg = colors.accent_quaternary },
    Macro = { fg = colors.accent_quaternary },
    PreCondit = { fg = colors.accent_quaternary, italic = true },

    -- Types
    Type = { fg = colors.accent_secondary },
    StorageClass = { fg = colors.accent_quaternary },
    Structure = { fg = colors.accent_quaternary },
    Typedef = { fg = colors.accent_quaternary },

    -- Special
    Special = { fg = colors.accent_primary },
    SpecialChar = { fg = colors.accent_quaternary },
    Tag = { fg = colors.accent_primary },
    Underlined = { fg = colors.accent_quinary, underline = config.underline },

    -- Semantic
    Todo = { fg = colors.bg0, bg = colors.accent_quinary, bold = config.bold, italic = config.italic.comments },
    Done = { fg = colors.accent_primary, bold = config.bold, italic = config.italic.comments },
    Error = { fg = colors.accent_tertiary, bold = config.bold, reverse = config.inverse },

    --------------------------
    -- LSP Highlight Groups
    --------------------------

    -- Diagnostics
    DiagnosticError = { fg = colors.accent_tertiary },
    DiagnosticWarn = { fg = colors.accent_secondary },
    DiagnosticInfo = { fg = colors.accent_quinary },
    DiagnosticHint = { fg = colors.accent_primary },

    DiagnosticSignError = { link = "ConquerorRedSign" },
    DiagnosticSignWarn = { link = "ConquerorYellowSign" },
    DiagnosticSignInfo = { link = "ConquerorBlueSign" },
    DiagnosticSignHint = { link = "ConquerorAquaSign" },

    DiagnosticUnderlineError = { link = "ConquerorRedUnderline" },
    DiagnosticUnderlineWarn = { link = "ConquerorYellowUnderline" },
    DiagnosticUnderlineInfo = { link = "ConquerorBlueUnderline" },
    DiagnosticUnderlineHint = { link = "ConquerorAquaUnderline" },

    DiagnosticFloatingError = { fg = colors.accent_tertiary },
    DiagnosticFloatingWarn = { fg = colors.accent_secondary },
    DiagnosticFloatingInfo = { fg = colors.accent_quinary },
    DiagnosticFloatingHint = { fg = colors.accent_primary },

    DiagnosticVirtualTextError = { fg = colors.accent_tertiary },
    DiagnosticVirtualTextWarn = { fg = colors.accent_secondary },
    DiagnosticVirtualTextInfo = { fg = colors.accent_quinary },
    DiagnosticVirtualTextHint = { fg = colors.accent_primary },

    -- LSP references
    LspReferenceRead = { link = "ConquerorOcurrenceSelection" },
    LspReferenceText = { link = "ConquerorOcurrenceSelection" },
    LspReferenceWrite = { link = "ConquerorOcurrenceSelection" },
    LspCodeLens = { fg = colors.fg3 },
    LspSignatureActiveParameter = { link = "Search" },

    -- Inlay hints
    LspInlayHint = { link = "Comment" },

    --------------------------
    -- TreeSitter Groups
    --------------------------

    -- Basic groups
    ["@comment"] = { link = "Comment" },
    ["@error"] = { link = "Error" },
    ["@none"] = { bg = "NONE", fg = "NONE" },
    ["@preproc"] = { link = "PreProc" },
    ["@define"] = { link = "Define" },
    ["@operator"] = { link = "Operator" },

    -- Punctuation
    ["@punctuation.delimiter"] = { link = "Delimiter" },
    ["@punctuation.bracket"] = { fg = colors.fg2 },
    ["@punctuation.special"] = { fg = colors.accent_primary },

    -- Literals
    ["@string"] = { link = "String" },
    ["@string.regex"] = { fg = colors.accent_quaternary },
    ["@string.escape"] = { fg = colors.accent_quaternary, bold = config.bold },
    ["@string.special"] = { fg = colors.accent_quaternary },
    ["@character"] = { link = "Character" },
    ["@character.special"] = { fg = colors.accent_quaternary },
    ["@boolean"] = { link = "Boolean" },
    ["@number"] = { link = "Number" },
    ["@float"] = { link = "Float" },

    -- Functions
    ["@function"] = { fg = colors.accent_primary },
    ["@function.builtin"] = { fg = colors.accent_primary, italic = true },
    ["@function.call"] = { fg = colors.accent_primary },
    ["@function.macro"] = { fg = colors.accent_quaternary },
    ["@method"] = { fg = colors.accent_primary },
    ["@method.call"] = { fg = colors.accent_primary },
    ["@constructor"] = { fg = colors.accent_quaternary },
    ["@parameter"] = { fg = colors.fg1, italic = true },

    -- Keywords
    ["@keyword"] = { fg = colors.accent_quinary, bold = config.bold },
    ["@keyword.function"] = { fg = colors.accent_quinary, bold = config.bold },
    ["@keyword.operator"] = { fg = colors.accent_primary },
    ["@keyword.return"] = { fg = colors.accent_tertiary, bold = config.bold },
    ["@conditional"] = { link = "Conditional" },
    ["@repeat"] = { link = "Repeat" },
    ["@debug"] = { fg = colors.accent_tertiary },
    ["@label"] = { fg = colors.accent_quinary },
    ["@include"] = { link = "Include" },
    ["@exception"] = { link = "Exception" },

    -- Types
    ["@type"] = { link = "Type" },
    ["@type.builtin"] = { fg = colors.accent_secondary, italic = true },
    ["@type.definition"] = { fg = colors.accent_quaternary },
    ["@type.qualifier"] = { fg = colors.accent_quinary },
    ["@storageclass"] = { link = "StorageClass" },
    ["@attribute"] = { fg = colors.accent_quaternary },
    ["@field"] = { fg = colors.fg1 },
    ["@property"] = { fg = colors.fg1 },

    -- Variables
    ["@variable"] = { fg = colors.fg1 },
    ["@variable.builtin"] = { fg = colors.accent_quinary, italic = true },
    ["@constant"] = { link = "Constant" },
    ["@constant.builtin"] = { fg = colors.accent_secondary, bold = config.bold },
    ["@constant.macro"] = { fg = colors.accent_quaternary },
    ["@namespace"] = { fg = colors.fg1, bold = config.bold },
    ["@symbol"] = { fg = colors.accent_primary },

    -- Text
    ["@text"] = { fg = colors.fg1 },
    ["@text.strong"] = { bold = config.bold },
    ["@text.emphasis"] = { italic = config.italic.emphasis },
    ["@text.underline"] = { underline = config.underline },
    ["@text.strike"] = { strikethrough = config.strikethrough },
    ["@text.title"] = { link = "Title" },
    ["@text.literal"] = { fg = colors.fg2 },
    ["@text.uri"] = { fg = colors.accent_quinary, underline = config.underline },
    ["@text.math"] = { fg = colors.accent_quaternary },
    ["@text.environment"] = { fg = colors.accent_quaternary },
    ["@text.environment.name"] = { fg = colors.accent_secondary },
    ["@text.reference"] = { fg = colors.accent_secondary },

    -- Tags
    ["@tag"] = { fg = colors.accent_primary },
    ["@tag.attribute"] = { fg = colors.accent_secondary },
    ["@tag.delimiter"] = { fg = colors.fg2 },

    -- Semantic tokens
    ["@lsp.type.class"] = { link = "@type" },
    ["@lsp.type.comment"] = { link = "@comment" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.enumMember"] = { link = "@constant" },
    ["@lsp.type.function"] = { link = "@function" },
    ["@lsp.type.interface"] = { link = "@type" },
    ["@lsp.type.macro"] = { link = "@function.macro" },
    ["@lsp.type.method"] = { link = "@method" },
    ["@lsp.type.namespace"] = { link = "@namespace" },
    ["@lsp.type.parameter"] = { link = "@parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.struct"] = { link = "@type" },
    ["@lsp.type.type"] = { link = "@type" },
    ["@lsp.type.typeParameter"] = { link = "@type.definition" },
    ["@lsp.type.variable"] = { link = "@variable" },

    --------------------------
    -- Plugin-specific Highlights
    --------------------------

    -- Git related
    gitcommitSelectedFile = { fg = colors.accent_primary },
    gitcommitDiscardedFile = { fg = colors.accent_tertiary },
    GitSignsAdd = { fg = colors.accent_primary },
    GitSignsChange = { fg = colors.accent_secondary },
    GitSignsDelete = { fg = colors.accent_tertiary },

    -- NvimTree
    NvimTreeSymlink = { fg = colors.accent_quinary, bold = true },
    NvimTreeRootFolder = { fg = colors.accent_quaternary, bold = true },
    NvimTreeFolderIcon = { fg = colors.accent_quinary, bold = true },
    NvimTreeFileIcon = { fg = colors.fg1 },
    NvimTreeExecFile = { fg = colors.accent_primary, bold = true },
    NvimTreeOpenedFile = { fg = colors.accent_secondary, bold = true },
    NvimTreeSpecialFile = { fg = colors.accent_quaternary, bold = true, underline = true },
    NvimTreeImageFile = { fg = colors.accent_quaternary },
    NvimTreeIndentMarker = { fg = colors.bg3 },
    NvimTreeGitDirty = { fg = colors.accent_secondary },
    NvimTreeGitStaged = { fg = colors.accent_primary },
    NvimTreeGitMerge = { fg = colors.accent_quaternary },
    NvimTreeGitRenamed = { fg = colors.accent_quaternary },
    NvimTreeGitNew = { fg = colors.accent_secondary },
    NvimTreeGitDeleted = { fg = colors.accent_tertiary },
    NvimTreeWindowPicker = { fg = colors.bg0, bg = colors.accent_primary, bold = true },

    -- Telescope
    TelescopeNormal = { fg = colors.fg1 },
    TelescopeSelection = { fg = colors.fg0, bg = colors.bg3, bold = config.bold },
    TelescopeSelectionCaret = { fg = colors.accent_primary, bold = true },
    TelescopeMultiSelection = { fg = colors.accent_secondary },
    TelescopeBorder = { fg = colors.fg2 },
    TelescopePromptBorder = { fg = colors.accent_primary },
    TelescopeResultsBorder = { fg = colors.fg2 },
    TelescopePreviewBorder = { fg = colors.fg2 },
    TelescopeMatching = { fg = colors.accent_primary, bold = true },
    TelescopePromptPrefix = { fg = colors.accent_quaternary },
    TelescopePrompt = { link = "TelescopeNormal" },
    TelescopePromptCounter = { fg = colors.accent_tertiary, italic = true },

    -- nvim-cmp
    CmpItemAbbr = { fg = colors.fg1 },
    CmpItemAbbrDeprecated = { fg = colors.fg3, strikethrough = true },
    CmpItemAbbrMatch = { fg = colors.accent_primary, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = colors.accent_primary, underline = true },
    CmpItemMenu = { fg = colors.fg3 },
    CmpItemKindText = { fg = colors.fg1 },
    CmpItemKindVariable = { fg = colors.accent_quinary },
    CmpItemKindMethod = { fg = colors.accent_primary },
    CmpItemKindFunction = { fg = colors.accent_primary },
    CmpItemKindConstructor = { fg = colors.accent_quaternary },
    CmpItemKindField = { fg = colors.fg1 },
    CmpItemKindClass = { fg = colors.accent_secondary },
    CmpItemKindInterface = { fg = colors.accent_secondary },
    CmpItemKindModule = { fg = colors.accent_quinary },
    CmpItemKindProperty = { fg = colors.fg1 },
    CmpItemKindValue = { fg = colors.accent_secondary },
    CmpItemKindEnum = { fg = colors.accent_secondary },
    CmpItemKindKeyword = { fg = colors.accent_quinary },
    CmpItemKindSnippet = { fg = colors.accent_primary },
    CmpItemKindFile = { fg = colors.accent_quinary },
    CmpItemKindFolder = { fg = colors.accent_quinary },
    CmpItemKindColor = { fg = colors.accent_quaternary },

    -- Other popular plugins
    IndentBlanklineChar = { fg = colors.bg3 },
    IndentBlanklineContextChar = { fg = colors.accent_primary },
    WhichKey = { fg = colors.accent_primary },
    WhichKeyGroup = { fg = colors.accent_quinary },
    WhichKeySeparator = { fg = colors.fg3 },
    WhichKeyDesc = { fg = colors.fg1 },

    -- Markdown
    markdownH1 = { fg = colors.accent_primary, bold = true },
    markdownH2 = { fg = colors.accent_quinary, bold = true },
    markdownH3 = { fg = colors.accent_quaternary, bold = true },
    markdownH4 = { fg = colors.accent_secondary, bold = true },
    markdownH5 = { fg = colors.accent_tertiary, bold = true },
    markdownH6 = { fg = colors.fg2, bold = true },
    markdownCode = { fg = colors.fg2, bg = colors.bg2 },
    markdownCodeBlock = { fg = colors.fg2 },
    markdownBlockquote = { fg = colors.fg3, italic = true },

    -- Web development
    htmlTag = { fg = colors.fg2 },
    htmlEndTag = { fg = colors.fg2 },
    htmlTagName = { fg = colors.accent_primary, bold = true },
    htmlArg = { fg = colors.accent_secondary },
    htmlLink = { fg = colors.accent_quinary, underline = true },

    cssTagName = { fg = colors.accent_primary, bold = true },
    cssClassName = { fg = colors.accent_secondary },
    cssIdentifier = { fg = colors.accent_quaternary },

    jsonKeyword = { fg = colors.accent_secondary },
    jsonString = { fg = colors.fg2 },

    -- Languages
    -- JavaScript/TypeScript
    typescriptBraces = { fg = colors.fg2 },
    typescriptFuncKeyword = { fg = colors.accent_quinary, bold = true },
    typescriptReserved = { fg = colors.accent_quaternary },
    jsArrowFunction = { fg = colors.accent_primary },

    -- Python
    pythonFunction = { fg = colors.accent_primary },
    pythonBuiltin = { fg = colors.accent_quinary, italic = true },
    pythonDecorator = { fg = colors.accent_quaternary },

    -- Lua
    luaFunction = { fg = colors.accent_quinary, bold = true },
    luaTable = { fg = colors.fg2 },

    -- Rust
    rustModPath = { fg = colors.accent_quinary },
    rustSigil = { fg = colors.accent_primary },
    rustAttribute = { fg = colors.accent_quaternary },

    -- Go
    goDirective = { fg = colors.accent_quaternary },
    goDeclaration = { fg = colors.accent_quinary, bold = true },

    -- Special highlight overrides
    LspSagaCodeActionTitle = { fg = colors.accent_primary, bold = true },
    LspSagaCodeActionContent = { fg = colors.accent_secondary },
    LspSagaHoverBorder = { fg = colors.accent_primary },
    LspSagaRenameBorder = { fg = colors.accent_quinary },
  }

  -- Apply user overrides on top of default highlights
  for g, hl in pairs(config.overrides) do
    if groups[g] then
      groups[g].link = nil
    end
    groups[g] = vim.tbl_extend("force", groups[g] or {}, hl)
  end

  return groups
end

-- Setup function to apply user configuration
--- @param opts ConquerorConfig?
Conqueror.setup = function(opts)
  Conqueror.config = vim.tbl_extend("force", Conqueror.config, opts or {})
end

-- Load function to apply the color scheme
Conqueror.load = function()
  -- Check Neovim version
  if vim.version().minor < 8 then
    vim.notify_once("conqueror.nvim: nvim 0.8 or higher is required")
    return
  end

  -- Reset colors
  if vim.g.colors_name then
    vim.cmd.hi("clear")
  end

  -- Set color scheme name
  vim.g.colors_name = "conqueror"

  -- Ensure terminal colors are enabled
  vim.o.termguicolors = true

  -- Get highlight groups
  local groups = get_groups()

  -- Apply all highlights
  for group, settings in pairs(groups) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

-- Create a command to reload the color scheme (useful during development)
vim.api.nvim_create_user_command("ConquerorReload", function()
  Conqueror.load()
  vim.notify("Conqueror colorscheme reloaded", vim.log.levels.INFO)
end, { desc = "Reload Conqueror colorscheme" })

return Conqueror
