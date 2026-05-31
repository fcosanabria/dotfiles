# Configuración de Neovim (lazyvim-nix)

Los archivos de configuración viven en `modules/home/nvim/`.

## Agregar plugins

Crear un archivo `.lua` en `modules/home/nvim/plugins/`:

```lua
-- modules/home/nvim/plugins/mi-plugin.lua
return {
  "autor/mi-plugin.nvim",
  event = "VeryLazy",
  opts = {},
}
```

Luego: `sudo nixos-rebuild switch`.

## Agregar extras de LazyVim

Editar `modules/home/nvim.nix`, sección `extras`:

```nix
extras = {
  lang.rust = {
    enable = true;
    installDependencies = true;
  };
};
```

Lista de extras disponibles: <https://github.com/pfassina/lazyvim-nix/blob/main/data/extras.json>

## Referencia rápida

| Qué cambiar | Dónde |
|---|---|
| Plugin nuevo | `modules/home/nvim/plugins/<nombre>.lua` |
| Extra de LazyVim | `extras.*` en `modules/home/nvim.nix` |
| Opciones de nvim | `modules/home/nvim/config/options.lua` |
| Keymaps globales | `modules/home/nvim/config/keymaps.lua` |
| Autocmds | `modules/home/nvim/config/autocmds.lua` |
| Paquete de sistema (LSP, etc.) | `modules/system/packages.nix` |

## Notas

- `plugins/extras.lua` y `config/lazy.lua` **no van** en el directorio — los gestiona `lazyvim-nix`.
- El toggle `<leader>uw` (wrap) funciona por sesión; el valor por defecto se fija en `config/options.lua`.
- Plugins no disponibles en nixpkgs (teide, line-numbers, vim-tmux-navigator) se descargan en runtime — los warnings `Could not resolve plugin` en `nix flake check` son esperados.
