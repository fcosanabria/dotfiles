# Configuración de Neovim (manual)

Desde la reescritura, **nvim ya no se gestiona con Nix** (antes usaba lazyvim-nix
vía home-manager). Nix solo instala el paquete `neovim`
(`modules/system/packages.nix`).

Los archivos Lua de referencia viven en `dotfiles/nvim/` (versionados, pero **no**
cableados al build). Úsalos como base para tu `~/.config/nvim`.

## Setup (una vez, a mano)

1. Bootstrapea LazyVim en `~/.config/nvim` (ver <https://www.lazyvim.org/>):
   copia el `init.lua` y `lua/config/lazy.lua` del starter de LazyVim.
2. Copia o enlaza tus archivos desde `dotfiles/nvim/`:
   - `dotfiles/nvim/config/*.lua`  → `~/.config/nvim/lua/config/`
   - `dotfiles/nvim/plugins/*.lua` → `~/.config/nvim/lua/plugins/`
3. lazy.nvim instala los plugins solo al abrir nvim.

## Referencia rápida

| Qué              | Dónde                               |
| ---------------- | ----------------------------------- |
| Opciones de nvim | `dotfiles/nvim/config/options.lua`  |
| Keymaps globales | `dotfiles/nvim/config/keymaps.lua`  |
| Autocmds         | `dotfiles/nvim/config/autocmds.lua` |
| Plugins          | `dotfiles/nvim/plugins/<nombre>.lua`|
| Paquete neovim   | `modules/system/packages.nix`       |
| LSPs/formatters  | `modules/system/packages.nix`       |

## Notas

- `~/.config/nvim` ya **no** lo gestiona Nix: edítalo directamente o sincronízalo
  a mano desde `dotfiles/nvim/`.
- Los LSPs y formatters de sistema (pyright, ruff, nil, marksman, etc.) siguen en
  `modules/system/packages.nix`, disponibles globalmente para nvim.
