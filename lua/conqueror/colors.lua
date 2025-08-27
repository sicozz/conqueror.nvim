---@class PaletteColors
local palette = {
    -- Keep only essential shared colors used by both themes
    pearlCyan = "#ffffcc", -- Used by both themes for regex highlighting

    -- GoPrime theme colors - futuristic Go game board (image-accurate palette)
    conquerorBlack = "#000000",        -- Pure black background
    conquerorBlack1 = "#0a0a0a",       -- Slightly lighter black
    conquerorBlack2 = "#292900",       -- Circuit trace dark
    conquerorBlack3 = "#3c3c00",       -- Selected/hover states
    conquerorBlack4 = "#2a2a2a",       -- Borders and separators

    conquerorWhite = "#ffffff",        -- Pure white circuit traces
    conquerorWhite1 = "#f0f0f0",       -- Slightly dimmed white
    conquerorWhite2 = "#e0e0e0",       -- More dimmed white
    conquerorWhite3 = "#cccccc",       -- Subtle white for comments
    conquerorWhite4 = "#999999",       -- Very dim white

    conquerorYellow = "#ffff14",       -- Bright yellow Go pieces
    conquerorYellow1 = "#ffff44",      -- Slightly muted yellow
    conquerorYellow2 = "#e6e610",      -- Darker yellow
    conquerorYellow3 = "#cccc11",      -- More subtle yellow
    conquerorYellow4 = "#999909",      -- Dark yellow/amber
    conquerorYellow5 = "#666606",      -- Very dark yellow

    -- Git indicators only (using minimal color for necessity)
    conquerorGreen = "#00a56e",        -- Muted green for git add
    conquerorRed = "#ff142d",          -- Muted red for git delete
    conquerorOrange = "#e6e610",       -- Muted orange for git change

    -- GoUltra theme colors - futuristic cyan/teal theme matching GoUltra.png
    goultraBlack = "#000000",        -- Pure black background
    goultraBlack1 = "#0a0a0a",       -- Slightly lighter black
    goultraBlack2 = "#001a00",       -- Circuit trace dark with green tint
    goultraBlack3 = "#202020",       -- Selected/hover states
    goultraBlack4 = "#2a2a2a",       -- Borders and separators

    goultraWhite = "#ffffff",        -- Pure white circuit traces
    goultraWhite1 = "#f0f0f0",       -- Slightly dimmed white
    goultraWhite2 = "#e0e0e0",       -- More dimmed white
    goultraWhite3 = "#cccccc",       -- Subtle white for comments
    goultraWhite4 = "#999999",       -- Very dim white

    goultraCyan = "#00ff80",         -- Primary green-cyan color
    goultraCyan1 = "#44ff99",        -- Slightly muted green-cyan
    goultraCyan2 = "#10e680",        -- Darker green-cyan
    goultraCyan3 = "#11cc77",        -- More subtle green-cyan
    goultraCyan4 = "#099955",        -- Dark green-teal
    goultraCyan5 = "#066644",        -- Very dark green

    -- Git indicators (using minimal color for necessity)
    goultraGreen = "#88cc88",        -- Muted green for git add
    goultraRed = "#cc8888",          -- Muted red for git delete
    goultraOrange = "#ccaa88",       -- Muted orange for git change
}

local M = {}
--- Generate colors table:
--- * opts:
---   - colors: Table of personalized colors and/or overrides of existing ones.
---     Defaults to ConquerorConfig.colors.
---   - theme: Use selected theme. Defaults to ConquerorConfig.theme
---     according to the value of 'background' option.
---@param opts? { colors?: table, theme?: string }
---@return { theme: ThemeColors, palette: PaletteColors}
function M.setup(opts)
    opts = opts or {}
    local override_colors = opts.colors or require("conqueror").config.colors
    local theme = opts.theme or require("conqueror")._CURRENT_THEME -- WARN: this fails if called before conqueror.load()

    if not theme then
        error(
            "conqueror.colors.setup(): Unable to infer `theme`. Either specify a theme or call this function after ':colorscheme conqueror'"
        )
    end

    -- Add to and/or override palette_colors
    local updated_palette_colors = vim.tbl_extend("force", palette, override_colors.palette or {})

    -- Generate the theme according to the updated palette colors
    local theme_colors = require("conqueror.themes")[theme](updated_palette_colors)

    -- Add to and/or override theme_colors
    local theme_overrides =
        vim.tbl_deep_extend("force", override_colors.theme["all"] or {}, override_colors.theme[theme] or {})
    local updated_theme_colors = vim.tbl_deep_extend("force", theme_colors, theme_overrides)
    -- return palette_colors AND theme_colors

    return {
        theme = updated_theme_colors,
        palette = updated_palette_colors,
    }
end

return M
