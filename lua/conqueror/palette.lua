--[[
Conqueror.nvim - A cyberpunk-inspired color scheme with monochromatic teal base and vibrant accents

MIT License

Copyright (c) 2025 Simon Zuluaga

Permission is hereby granted, free of charge, to any person obtaining a copy of this software
and associated documentation files (the "Software"), to deal in the Software without restriction.
For the full license information, see the LICENSE file.
--]]

-- Conqueror.nvim color palette

return {
  -- Base colors - monochromatic teal progression
  bg0 = "#00140f", -- "Void Core" (darker than base background)
  bg1 = "#00271e", -- "Deep Abyss" (dark teal background)
  bg2 = "#003a2e", -- "Circuit Void" (for UI elements, panels)
  bg3 = "#004e3d", -- "Signal Trace" (for highlights, selection)
  bg4 = "#005a46", -- "Neon Pulse" (for selected text/items)

  -- Foreground colors
  fg1 = "#fbfbfb", -- "Pure Signal" (brightest text)
  fg0 = "#f0f9ff", -- "Terminal Glow" (main text color)
  fg2 = "#66d9b8", -- "Data Stream" (secondary text)
  fg3 = "#4d8d7c", -- "Ghost Code" (dimmed text, comments)
  fg4 = "#00896a", -- "Faded Circuit" (subtle highlights)

  -- Primary accent colors
  accent_primary = "#00ffb7", -- "Cyberlink" (primary accent)
  accent_secondary = "#e6ff00", -- "Voltage" (warning, important)
  accent_tertiary = "#ff1a4f", -- "Neural Flare" (errors, critical)
  accent_quaternary = "#a359ff", -- "Quantum Shift" (special elements)
  accent_quinary = "#0d56ff", -- "Hologram Blue" (info, links)

  -- Standard semantic colors (bright variants)
  bright_red = "#ff4600", -- Bright red for errors
  bright_green = "#00ff46", -- Bright green for success
  bright_yellow = "#f5f50a", -- Bright yellow for warnings
  bright_blue = "#3f00ff", -- Bright blue for information
  bright_purple = "#ec30ac", -- Bright purple for special items
  bright_aqua = "#00e6e6", -- Bright aqua for parameters/variables
  bright_orange = "#ff9b00", -- Bright orange for keywords

  -- Medium intensity semantic colors (neutral variants)
  neutral_red = "#d83b00", -- Neutral red
  neutral_green = "#00d83b", -- Neutral green
  neutral_yellow = "#cfcf08", -- Neutral yellow
  neutral_blue = "#3500d6", -- Neutral blue
  neutral_purple = "#c427a0", -- Neutral purple
  neutral_aqua = "#009898", -- Neutral aqua
  neutral_orange = "#b16b00", -- Neutral orange

  -- Low intensity semantic colors (faded variants)
  faded_red = "#762000", -- Faded red
  faded_green = "#004e16", -- Faded green
  faded_yellow = "#5e5e04", -- Faded yellow
  faded_blue = "#27009d", -- Faded blue
  faded_purple = "#781666", -- Faded purple
  faded_aqua = "#004949", -- Faded aqua
  faded_orange = "#623c00", -- Faded orange

  -- Special purpose colors
  dark_red = "#4e1600", -- Dark red for diff delete bg
  light_red = "#ca0000", -- Light red for diff delete fg
  dark_green = "#00270b", -- Dark green for diff add bg
  light_green = "#d8ffe3", -- Light green for diff add fg
  dark_aqua = "#002222", -- Dark aqua for diff change bg
  light_aqua = "#d2ffff", -- Light aqua for diff change fg
  gray = "#a7a7a7", -- Neutral gray
  light_gray = "#d4d4d4", -- Light gray
}
