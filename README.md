# 🎯 GoPrime.nvim 🎯

A futuristic Neovim colorscheme featuring **GoPrime** and **GoUltra** themes, inspired by the strategic elegance of Go and modern digital aesthetics.

## ✨ Features

- 🌈 Extensive support for `TreeSitter` syntax highlighting
- 🔌 Compatible with popular plugins out of the box
- ⚡ Compilation to lua byte code for fast startup times
- 🎨 Two distinct theme variants: GoPrime (yellow-gold) and GoUltra (green-cyan)
- 👁️ High contrast for excellent readability

## 📦 Installation

Download with your favorite package manager.

```lua
-- Using Packer
use "your-username/goprime.nvim"

-- Using Lazy
{
  "your-username/goprime.nvim",
  lazy = false,
  priority = 1000,
}
```

## 📋 Requirements

- Terminal with truecolor support
- Terminal with undercurl support (optional)

## 🚀 Usage

Load GoPrime theme:
```vim
colorscheme goprime
```

Load GoUltra theme:
```vim
colorscheme goultra
```

Or in Lua:
```lua
vim.cmd("colorscheme goprime")
-- or
vim.cmd("colorscheme goultra")
```

## ⚙️ Configuration

There is no need to call setup if you are ok with the defaults.

```lua
-- Default options:
require('goprime').setup({
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
        theme = { goprime = {}, goultra = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "goprime",          -- Load "goprime" theme by default
    background = {               -- map the value of 'background' option to a theme
        dark = "goprime",       -- try "goultra" !
        light = "goprime"       -- only dark themes available
    },
})

-- setup must be called before loading
vim.cmd("colorscheme goprime")
```

## 🎨 Themes

GoPrime comes in two beautiful variants:

### 🟡 GoPrime 🟡
**Futuristic Go board aesthetic** - Pure black background with bright yellow accents reminiscent of digital Go stones and circuit traces. Perfect for focused coding sessions.

### 🟢 GoUltra 🟢
**Cyberpunk green variant** - Black background with vibrant green-cyan accents creating a high-tech, Matrix-inspired coding environment.

## 🧰 Customization

You can customize both theme and palette colors using `config.colors`:

```lua
require('goprime').setup({
    colors = {
        palette = {
            -- Override specific palette colors
            goprimeYellow = "#ffff00",  -- Change main yellow
            goultraCyan = "#00ff88",    -- Change main cyan-green
        },
        theme = {
            goprime = {
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