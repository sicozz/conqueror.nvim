local M = {}

---@alias ColorSpec string RGB Hex string
---@alias ColorTable table<string, ColorSpec>
---@alias ConquerorColorsSpec { palette: ColorTable, theme: ColorTable }
---@alias ConquerorColors { palette: PaletteColors, theme: ThemeColors }

--- default config
---@class ConquerorConfig
M.config = {
    bold = true,
    italics = true,
    undercurl = true,
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = {},
    typeStyle = {},
    transparent = false,
    dimInactive = false,
    terminalColors = true,
    colors = { theme = { zen = {}, pearl = {}, ink = {}, mist = {}, conqueror = {}, all = {} }, palette = {} },
    ---@type fun(colors: ConquerorColorsSpec): table<string, table>
    overrides = function()
        return {}
    end,
    ---@type { dark: string, light: string }
    background = { dark = "conqueror", light = "pearl" },
    theme = "conqueror",
    compile = false,
}

local function check_config(config)
    local err
    return not err
end

--- update global configuration with user settings
---@param config? ConquerorConfig user configuration
function M.setup(config)
    if check_config(config) then
        M.config = vim.tbl_deep_extend("force", M.config, config or {})
    else
        vim.notify("Conqueror: Errors found while loading user config. Using default config.", vim.log.levels.ERROR)
    end
end

--- load the colorscheme
---@param theme? string
function M.load(theme)
    local utils = require("conqueror.utils")

    theme = theme or M.config.background[vim.o.background] or M.config.theme
    M._CURRENT_THEME = theme

    if vim.g.colors_name then
        vim.cmd("hi clear")
    end

    vim.g.colors_name = "conqueror"
    vim.o.termguicolors = true

    if M.config.compile then
        if utils.load_compiled(theme) then
            return
        end

        M.compile()
        utils.load_compiled(theme)
    else
        local colors = require("conqueror.colors").setup({ theme = theme, colors = M.config.colors })
        local highlights = require("conqueror.highlights").setup(colors, M.config)
        require("conqueror.highlights").highlight(highlights, M.config.terminalColors and colors.theme.term or {})
    end
end

function M.compile()
    for theme, _ in pairs(require("conqueror.themes")) do
        local colors = require("conqueror.colors").setup({ theme = theme, colors = M.config.colors })
        local highlights = require("conqueror.highlights").setup(colors, M.config)
        require("conqueror.utils").compile(theme, highlights, M.config.terminalColors and colors.theme.term or {})
    end
end

vim.api.nvim_create_user_command("ConquerorCompile", function()
    for mod, _ in pairs(package.loaded) do
        if mod:match("^conqueror%.") then
            package.loaded[mod] = nil
        end
    end
    M.compile()
    vim.notify("Conqueror: compiled successfully!", vim.log.levels.INFO)
    M.load(M._CURRENT_THEME)
    vim.api.nvim_exec_autocmds("ColorScheme", { modeline = false })
end, {})

return M
