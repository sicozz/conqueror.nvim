-- Conqueror.nvim configuration examples

-- Default configuration with no changes
require("conqueror").setup()
vim.cmd("colorscheme conqueror")

-- With custom configuration
require("conqueror").setup({
  -- Disable bold text
  bold = false,

  -- Configure italic usage
  italic = {
    strings = true, -- Italic for strings
    comments = true, -- Italic for comments
    operators = true, -- Italic for operators
    folds = false, -- No italic for folds
    emphasis = true, -- Italic for emphasis in markdown
  },

  -- Enable transparent background
  transparent_mode = true,

  -- Enable dimming of inactive windows
  dim_inactive = true,

  -- Custom color overrides
  palette_overrides = {
    -- Make the primary accent more vibrant
    accent_primary = "#00ffcc",

    -- Slightly brighten the main background
    bg1 = "#002f25",
  },

  -- Override specific highlight groups
  overrides = {
    -- Special highlighting for comments
    Comment = { fg = "#6a9e89", italic = true, bold = true },

    -- Make function names more pronounced
    ["@function"] = { fg = "#00ffcc", bold = true },

    -- Custom highlighting for matching parentheses
    MatchParen = { bg = "#00ffcc", fg = "#00271e", bold = true },

    -- Make errors more visible
    DiagnosticError = { fg = "#ff6e8e", bold = true },
  },
})

-- Apply the colorscheme
vim.cmd("colorscheme conqueror")
