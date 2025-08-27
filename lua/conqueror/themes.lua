local c = require("conqueror.lib.color")

--TODO:
--PreProc needs its own color
--parameter and field should be different
---@class SyntaxElements
---@field string ColorSpec
---@field variable ColorSpec
---@field number ColorSpec
---@field constant ColorSpec
---@field identifier ColorSpec
---@field parameter ColorSpec
---@field fun ColorSpec
---@field statement ColorSpec
---@field keyword ColorSpec
---@field operator ColorSpec
---@field preproc ColorSpec
---@field type ColorSpec
---@field regex ColorSpec
---@field deprecated ColorSpec
---@field comment ColorSpec
---@field punct ColorSpec
---@field special1 ColorSpec
---@field special2 ColorSpec
---@field special3 ColorSpec

---@class DiagnosticsElements
---@field error ColorSpec
---@field ok ColorSpec
---@field warning ColorSpec
---@field info ColorSpec
---@field hint ColorSpec
--
---@class DiffElements
---@field add ColorSpec
---@field delete ColorSpec
---@field change ColorSpec
---@field text ColorSpec

---@class VCSElements
---@field added ColorSpec
---@field removed ColorSpec
---@field changed ColorSpec
---@field untracked ColorSpec

---@class UiElements
---@field none ColorSpec
---@field fg ColorSpec Default foreground
---@field fg_dim ColorSpec Dimmed foreground
---@field fg_reverse ColorSpec
---@field bg_dim ColorSpec Dimmed background
---@field bg_m3 ColorSpec
---@field bg_m2 ColorSpec
---@field bg_m1 ColorSpec
---@field bg ColorSpec Default background
---@field bg_p1 ColorSpec Lighter background ColorColumn, Folded, Gutter
---@field bg_p2 ColorSpec Lighter background Cursor{Line,Column}, TabLineSel (Selected Items)
---@field bg_gutter ColorSpec {Sign,Fold}Column, LineNr
---@field special ColorSpec SpecialKey
---@field indent_line ColorSpec IndentLine
---@field active_indent_line ColorSpec IndentLine
---@field nontext ColorSpec LineNr, NonText
---@field whitespace ColorSpec Whitespace
---@field bg_search ColorSpec
---@field bg_visual ColorSpec
---@field cursor_line_nr_foreground ColorSpec
---@field cursor_line_nr_active_foreground ColorSpec
---@field cursor_bg ColorSpec
---@field cursor_fg ColorSpec
---@field pmenu MenuElements
---@field float FloatElements

---@class FloatElements
---@field fg ColorSpec
---@field bg ColorSpec
---@field fg_border ColorSpec
---@field bg_border ColorSpec

---@class MenuElements
---@field bg ColorSpec
---@field fg ColorSpec
---@field fg_sel ColorSpec
---@field bg_sel ColorSpec
---@field bg_sbar ColorSpec
---@field bg_thumb ColorSpec

---@class ThemeColors
---@field syn SyntaxElements
---@field diag DiagnosticsElements
---@field vcs VCSElements
---@field diff DiffElements
---@field ui UiElements
---@field term ColorSpec[]

return {
    ---@param palette PaletteColors
    ---@return ThemeColors
    conqueror = function(palette)
        return {
            ui = {
                none = "NONE",
                fg = palette.conquerorWhite,
                fg_dim = palette.conquerorWhite1,
                fg_reverse = palette.conquerorBlack,

                bg_dim = palette.conquerorBlack,
                bg_m3 = palette.conquerorBlack,
                bg_m2 = palette.conquerorBlack,
                bg_m1 = palette.conquerorBlack,
                bg = palette.conquerorBlack,
                bg_p1 = palette.conquerorBlack1,
                bg_p2 = palette.conquerorBlack2,

                bg_gutter = palette.conquerorBlack1,
                special = palette.conquerorYellow,
                indent_line = palette.conquerorBlack3,
                active_indent_line = palette.conquerorYellow3,
                whitespace = palette.conquerorBlack3,
                nontext = palette.conquerorWhite3,

                bg_visual = palette.conquerorBlack3,
                bg_search = palette.conquerorYellow2,

                cursor_line_nr_foreground = palette.conquerorBlack4,
                cursor_line_nr_active_foreground = palette.conquerorYellow,
                cursor_bg = palette.conquerorYellow,
                cursor_fg = palette.conquerorBlack,

                pmenu = {
                    fg = palette.conquerorWhite,
                    fg_sel = palette.conquerorBlack,
                    bg = palette.conquerorBlack2,
                    bg_sel = palette.conquerorYellow,
                    bg_thumb = palette.conquerorBlack4,
                    bg_sbar = palette.conquerorBlack1,
                },

                float = {
                    fg = palette.conquerorWhite,
                    bg = palette.conquerorBlack1,
                    fg_border = palette.conquerorYellow,
                    bg_border = palette.conquerorBlack,
                },
            },
            syn = {
                string = palette.conquerorYellow1,
                variable = palette.conquerorWhite,
                number = palette.conquerorYellow1,
                constant = palette.conquerorYellow3,
                identifier = palette.conquerorYellow1,
                parameter = palette.conquerorWhite2,
                fun = palette.conquerorWhite,
                statement = palette.conquerorYellow3,
                keyword = palette.conquerorYellow3,
                operator = palette.conquerorYellow,
                preproc = palette.conquerorWhite3,
                type = palette.conquerorWhite1,
                regex = palette.pearlCyan,
                deprecated = palette.conquerorWhite4,
                punct = palette.conquerorWhite3,
                comment = palette.conquerorWhite4,
                special1 = palette.conquerorYellow,
                special2 = palette.conquerorYellow1,
                special3 = palette.conquerorYellow2,
            },
            diag = {
                error = palette.conquerorRed,
                ok = palette.conquerorGreen,
                warning = palette.conquerorOrange,
                info = palette.conquerorYellow3,
                hint = palette.conquerorYellow4,
            },
            diff = {
                add = palette.conquerorYellow5,
                delete = palette.conquerorYellow5,
                change = palette.conquerorYellow5,
                text = palette.conquerorYellow2,
            },
            vcs = {
                added = palette.conquerorGreen,
                removed = palette.conquerorRed,
                changed = palette.conquerorOrange,
                untracked = palette.conquerorWhite3,
            },
            term = {
                palette.conquerorBlack, -- black
                palette.conquerorRed, -- red
                palette.conquerorGreen, -- green
                palette.conquerorYellow, -- yellow
                palette.conquerorYellow3, -- blue (using yellow variant)
                palette.conquerorYellow2, -- magenta (using yellow variant)
                palette.conquerorYellow1, -- cyan (using yellow variant)
                palette.conquerorWhite, -- white
                palette.conquerorBlack4, -- bright black
                palette.conquerorRed, -- bright red
                palette.conquerorGreen, -- bright green
                palette.conquerorYellow1, -- bright yellow
                palette.conquerorYellow2, -- bright blue (using yellow variant)
                palette.conquerorYellow3, -- bright magenta (using yellow variant)
                palette.conquerorYellow4, -- bright cyan (using yellow variant)
                palette.conquerorWhite1, -- bright white
                palette.conquerorOrange, -- extended color 1
                palette.conquerorYellow4, -- extended color 2
            },
        }
    end,
    ---@param palette PaletteColors
    ---@return ThemeColors
    goultra = function(palette)
        return {
            ui = {
                none = "NONE",
                fg = palette.goultraWhite,
                fg_dim = palette.goultraWhite1,
                fg_reverse = palette.goultraBlack,

                bg_dim = palette.goultraBlack,
                bg_m3 = palette.goultraBlack,
                bg_m2 = palette.goultraBlack,
                bg_m1 = palette.goultraBlack,
                bg = palette.goultraBlack,
                bg_p1 = palette.goultraBlack1,
                bg_p2 = palette.goultraBlack2,

                bg_gutter = palette.goultraBlack1,
                special = palette.goultraCyan,
                indent_line = palette.goultraBlack3,
                active_indent_line = palette.goultraCyan3,
                whitespace = palette.goultraBlack3,
                nontext = palette.goultraWhite3,

                bg_visual = palette.goultraBlack3,
                bg_search = palette.goultraCyan2,

                cursor_line_nr_foreground = palette.goultraBlack4,
                cursor_line_nr_active_foreground = palette.goultraCyan,
                cursor_bg = palette.goultraCyan,
                cursor_fg = palette.goultraBlack,

                pmenu = {
                    fg = palette.goultraWhite,
                    fg_sel = palette.goultraBlack,
                    bg = palette.goultraBlack2,
                    bg_sel = palette.goultraCyan,
                    bg_thumb = palette.goultraBlack4,
                    bg_sbar = palette.goultraBlack1,
                },

                float = {
                    fg = palette.goultraWhite,
                    bg = palette.goultraBlack1,
                    fg_border = palette.goultraCyan,
                    bg_border = palette.goultraBlack,
                },
            },
            syn = {
                string = palette.goultraCyan1,
                variable = palette.goultraWhite,
                number = palette.goultraCyan1,
                constant = palette.goultraCyan3,
                identifier = palette.goultraCyan1,
                parameter = palette.goultraWhite2,
                fun = palette.goultraWhite,
                statement = palette.goultraCyan3,
                keyword = palette.goultraCyan3,
                operator = palette.goultraCyan,
                preproc = palette.goultraWhite3,
                type = palette.goultraWhite1,
                regex = palette.pearlCyan,
                deprecated = palette.goultraWhite4,
                punct = palette.goultraWhite3,
                comment = palette.goultraWhite4,
                special1 = palette.goultraCyan,
                special2 = palette.goultraCyan1,
                special3 = palette.goultraCyan2,
            },
            diag = {
                error = palette.goultraRed,
                ok = palette.goultraGreen,
                warning = palette.goultraOrange,
                info = palette.goultraCyan3,
                hint = palette.goultraCyan4,
            },
            diff = {
                add = palette.goultraCyan5,
                delete = palette.goultraCyan5,
                change = palette.goultraCyan5,
                text = palette.goultraCyan2,
            },
            vcs = {
                added = palette.goultraGreen,
                removed = palette.goultraRed,
                changed = palette.goultraOrange,
                untracked = palette.goultraWhite3,
            },
            term = {
                palette.goultraBlack, -- black
                palette.goultraRed, -- red
                palette.goultraGreen, -- green
                palette.goultraCyan, -- yellow (using cyan)
                palette.goultraCyan3, -- blue (using cyan variant)
                palette.goultraCyan2, -- magenta (using cyan variant)
                palette.goultraCyan1, -- cyan (using cyan variant)
                palette.goultraWhite, -- white
                palette.goultraBlack4, -- bright black
                palette.goultraRed, -- bright red
                palette.goultraGreen, -- bright green
                palette.goultraCyan1, -- bright yellow (using cyan variant)
                palette.goultraCyan2, -- bright blue (using cyan variant)
                palette.goultraCyan3, -- bright magenta (using cyan variant)
                palette.goultraCyan4, -- bright cyan (using cyan variant)
                palette.goultraWhite1, -- bright white
                palette.goultraOrange, -- extended color 1
                palette.goultraCyan4, -- extended color 2
            },
        }
    end,
}
