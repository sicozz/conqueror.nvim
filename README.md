# 🎯 Conqueror.nvim 🎯

A futuristic Neovim colorscheme featuring **Conqueror** and **GoUltra** themes, inspired by the strategic elegance of Go and modern digital aesthetics.

## ✨ Features

- 🌈 Extensive support for `TreeSitter` syntax highlighting
- 🔌 Compatible with popular plugins out of the box
- ⚡ Compilation to lua byte code for fast startup times
- 🎨 Two distinct theme variants: Conqueror (yellow-gold) and GoUltra (green-cyan)
- 👁️ High contrast for excellent readability

## 📦 Installation

Download with your favorite package manager.

```lua
-- Using Packer
use "your-username/conqueror.nvim"

-- Using Lazy
{
  "your-username/conqueror.nvim",
  lazy = false,
  priority = 1000,
}
```

## 📋 Requirements

- Terminal with truecolor support
- Terminal with undercurl support (optional)

## 🚀 Usage

Load Conqueror theme:
```vim
colorscheme conqueror
```

Load GoUltra theme:
```vim
colorscheme goultra
```

Or in Lua:
```lua
vim.cmd("colorscheme conqueror")
-- or
vim.cmd("colorscheme goultra")
```

## ⚙️ Configuration

There is no need to call setup if you are ok with the defaults.

```lua
-- Default options:
require('conqueror').setup({
    bold = true,                 -- enable bold fonts
    italics = true,             -- enable italics
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = {},
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { conqueror = {}, goultra = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "conqueror",          -- Load "conqueror" theme by default
    background = {               -- map the value of 'background' option to a theme
        dark = "conqueror",       -- try "goultra" !
        light = "conqueror"       -- only dark themes available
    },
})

-- setup must be called before loading
vim.cmd("colorscheme conqueror")
```

## 🎨 Themes

Conqueror comes in two beautiful variants:

### 🟡 Conqueror 🟡
**Futuristic Go board aesthetic** - Pure black background with bright yellow accents reminiscent of digital Go stones and circuit traces. Perfect for focused coding sessions.

### 🟢 GoUltra 🟢
**Cyberpunk green variant** - Black background with vibrant green-cyan accents creating a high-tech, Matrix-inspired coding environment.

## 🧰 Customization

You can customize both theme and palette colors using `config.colors`:

```lua
require('conqueror').setup({
    colors = {
        palette = {
            -- Override specific palette colors
            conquerorYellow = "#ffff00",  -- Change main yellow
            goultraCyan = "#00ff88",    -- Change main cyan-green
        },
        theme = {
            conqueror = {
                syn = {
                    string = "#custom_color",
                },
            },
            all = {
                ui = {
                    cursor_line_nr_active_foreground = "#FFFFFF"
                }
            }
        }
    },
})
```

## 💎 Inspiration

These themes are inspired by:
- The strategic elegance of the ancient game of Go
- Modern circuit board aesthetics  
- Cyberpunk and futuristic digital interfaces
- High contrast readability for long coding sessions