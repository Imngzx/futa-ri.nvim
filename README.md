# futa-ri.nvim (二人)

> **futari** /ɸɯ̥taɾi/ — *Japanese for "two people / pair"*

Zero-dependency auto-pairs + surround + tabout for Neovim. **~450 LOC**, no treesitter, no config needed.

> [!TIP]
> This plugin is the exact same autopair feature used in [Stellar:Vim](https://github.com/Imngzx/stellar-vim/tree/nvim-native/lua/custom/autopairs)

## Features

| Feature | Keys | Description |
|---------|------|-------------|
| **Auto-pairs** | `(`, `[`, `{`, `"`, `'`, `` ` `` | Insert matching pairs, smart skip/overtype |
| **Backspace** | `<BS>` | Deletes both sides of empty pairs |
| **Enter** | `<CR>` | Expands empty brackets with indent |
| **Surround** | `sa`/`sd`/`sr` | Add/delete/replace surrounds |
| **Visual wrap** | `v` + your direction + `pairs` | Quick-wrap selection with `([{"'` |
| **Tabout** | `<Tab>`/`<S-Tab>` | Jump out of `)]}>"'` / back to `([{<` |

## 📥Installation

### 💤[lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  'Imngzx/futa-ri.nvim',
  event = 'InsertEnter',
}
```

Auto-initializes on first `InsertEnter`. No `setup()` call required.

### 🔊[resonance.nvim](https://github.com/Imgnzx/resonance.nvim)

```lua
-- Load on InsertEnter via resonance
require('resonance').load({
  'https://github.com/Imngzx/futa-ri.nvim',
  event = 'InsertEnter',
})
```

### Using vimpack

```lua
vim.pack.add({"https://github.com/Imngzx/futa-ri.nvim"})
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
sa"w      -- surround word with "
sd"       -- delete surrounding "
sr"'      -- change " to '

-- Tabout
foo(|)    -- <Tab>   → foo()| ->
foo(|)    -- <S-Tab> → foo(|) <-
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

## Limitations (by Design)

- Surround operates on current line only
- No treesitter context (pairs in strings/comments)
- No dot-repeat for `sa`/`sd`/`sr`
- Keymaps not configurable

## License

MIT — see [LICENSE](LICENSE)

Copyright (c) 2026 Imngzx
