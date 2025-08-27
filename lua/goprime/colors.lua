---@class PaletteColors
local palette = {
    -- Keep only essential shared colors used by both themes
    pearlCyan = "#ffffcc", -- Used by both themes for regex highlighting

    -- GoPrime theme colors - futuristic Go game board (image-accurate palette)
    goprimeBlack = "#000000",        -- Pure black background
    goprimeBlack1 = "#0a0a0a",       -- Slightly lighter black
    goprimeBlack2 = "#292900",       -- Circuit trace dark
    goprimeBlack3 = "#3c3c00",       -- Selected/hover states
    goprimeBlack4 = "#2a2a2a",       -- Borders and separators

    goprimeWhite = "#ffffff",        -- Pure white circuit traces
    goprimeWhite1 = "#f0f0f0",       -- Slightly dimmed white
    goprimeWhite2 = "#e0e0e0",       -- More dimmed white
    goprimeWhite3 = "#cccccc",       -- Subtle white for comments
    goprimeWhite4 = "#999999",       -- Very dim white

    goprimeYellow = "#ffff14",       -- Bright yellow Go pieces
    goprimeYellow1 = "#ffff44",      -- Slightly muted yellow
    goprimeYellow2 = "#e6e610",      -- Darker yellow
    goprimeYellow3 = "#cccc11",      -- More subtle yellow
    goprimeYellow4 = "#999909",      -- Dark yellow/amber
    goprimeYellow5 = "#666606",      -- Very dark yellow

    -- Git indicators only (using minimal color for necessity)
    goprimeGreen = "#00a56e",        -- Muted green for git add
    goprimeRed = "#ff142d",          -- Muted red for git delete
    goprimeOrange = "#e6e610",       -- Muted orange for git change

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
---     Defaults to GoprimeConfig.colors.
---   - theme: Use selected theme. Defaults to GoprimeConfig.theme
---     according to the value of 'background' option.
---@param opts? { colors?: table, theme?: string }
---@return { theme: ThemeColors, palette: PaletteColors}
function M.setup(opts)
    opts = opts or {}
    local override_colors = opts.colors or require("goprime").config.colors
    local theme = opts.theme or require("goprime")._CURRENT_THEME -- WARN: this fails if called before goprime.load()

    if not theme then
        error(
            "goprime.colors.setup(): Unable to infer `theme`. Either specify a theme or call this function after ':colorscheme goprime'"
        )
    end

    -- Add to and/or override palette_colors
    local updated_palette_colors = vim.tbl_extend("force", palette, override_colors.palette or {})

    -- Generate the theme according to the updated palette colors
    local theme_colors = require("goprime.themes")[theme](updated_palette_colors)

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
