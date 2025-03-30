local palette = require("conqueror.palette")
local hover_secondary = "#232700"
local hover_quinary = "#002783"
local hover_quaternary = "#280059"
local hover_tertiary = "#2e000b"

return {
  normal = {
    a = { bg = palette.accent_primary, fg = palette.bg0, gui = "bold" },
    b = { bg = palette.bg1, fg = palette.accent_primary },
    c = { bg = palette.bg1, fg = palette.accent_primary },
  },
  insert = {
    a = { bg = palette.accent_secondary, fg = palette.bg0, gui = "bold" },
    b = { bg = palette.hover_secondary, fg = palette.accent_primary },
    c = { bg = palette.hover_secondary, fg = palette.accent_primary },
  },
  visual = {
    a = { bg = palette.accent_quinary, fg = palette.bg0, gui = "bold" },
    b = { bg = palette.hover_quinary, fg = palette.accent_primary },
    c = { bg = palette.hover_quinary, fg = palette.accent_primary },
  },
  replace = {
    a = { bg = palette.accent_quaternary, fg = palette.dark0, gui = "bold" },
    b = { bg = palette.hover_quaternary, fg = palette.accent_primary },
    c = { bg = palette.hover_quaternary, fg = palette.accent_primary },
  },
  command = {
    a = { bg = palette.accent_tertiary, fg = palette.dark0, gui = "bold" },
    b = { bg = palette.hover_tertiary, fg = palette.accent_primary },
    c = { bg = palette.hover_tertiary, fg = palette.accent_primary },
  },
  inactive = {
    a = { bg = palette.bg2, fg = palette.fg3, gui = "bold" },
    b = { bg = palette.bg2, fg = palette.accent_primary },
    c = { bg = palette.bg2, fg = palette.accent_primary },
  },
}
