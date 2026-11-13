# futari.nvim (二人)

> **futari** /ɸɯ̥taɾi/ — *Japanese for "two people / pair"*

Zero-dependency auto-pairs + surround + tabout for Neovim. **~450 LOC**, no treesitter, no config needed.

## Features

| Feature | Keys | Description |
|---------|------|-------------|
| **Auto-pairs** | `(`, `[`, `{`, `"`, `'`, `` ` `` | Insert matching pairs, smart skip/overtype |
| **Backspace** | `<BS>` | Deletes both sides of empty pairs |
| **Enter** | `<CR>` | Expands empty brackets with indent |
| **Surround** | `sa`/`sd`/`sr` | Add/delete/replace surrounds |
| **Visual wrap** | `s` + char | Quick-wrap selection with `([{"'` |
| **Tabout** | `<Tab>`/`<S-Tab>` | Jump out of `)]}>"'` / back to `([{<` |

## Installation

### lazy.nvim (recommended)

```lua
{
  'Imngzx/futari.nvim',
  event = 'InsertEnter',
}
```

Auto-initializes on first `InsertEnter`. No `setup()` call required.

### resonance.nvim (native vim.pack)

```lua
-- Load on InsertEnter via resonance
require('resonance').load({
  'https://github.com/Imngzx/futari.nvim',
  event = 'InsertEnter',
})
```

### Manual (no plugin manager)

```lua
-- Clone to ~/.local/share/nvim/site/pack/core/opt/futari.nvim
-- Then in init.lua:
vim.opt.rtp:prepend(vim.fn.stdpath('data') .. '/site/pack/core/opt/futari.nvim')
-- Auto-loads on InsertEnter via plugin/futari.lua
```

## Quick Demo

```lua
-- Type ( → cursor inside ()
function foo()
  |  -- cursor here
end

-- Type " → smart quotes, triple-quote detection
"""|"""  -- docstring ready

-- Surround
saw"      -- surround word with "
sd"       -- delete surrounding "
sr"'      -- change " to '

-- Tabout
foo(|)    -- <Tab> → foo()|
foo(|)    -- <S-Tab> → |foo()
```

## Configuration (Optional)

```lua
require('futari').setup({
  pairs = {
    enable_cmdline = true,  -- default: true
  },
  surround = {},
  tabout = {},
})
```

## Design Philosophy

- **KISS**: ~450 lines, three features, zero bloat
- **Zero deps**: Only Lua stdlib + Neovim API
- **Fast**: Byte-level scans, no allocations in hot path
- **Honest**: Single-line surround, no treesitter, hardcoded keymaps

## Limitations (by Design)

- Surround operates on current line only
- No treesitter context (pairs in strings/comments)
- No dot-repeat for `sa`/`sd`/`sr`
- Keymaps not configurable

## License

MIT — see [LICENSE](LICENSE)

Copyright (c) 2026 Imngzx
