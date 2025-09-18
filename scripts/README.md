# Dotfiles

Este repositorio contiene mi configuración personal de dotfiles, gestionada con [chezmoi](https://www.chezmoi.io/) para un entorno de desarrollo consistente, especialmente diseñado para usar con Devcontainers.

## Instalación

1. Clona este repositorio:
   ```bash
   git clone https://github.com/tu-usuario/dotfiles.git ~/git/dotfiles
   cd ~/git/dotfiles
   ```

2. Ejecuta el script de bootstrap:
   ```bash
   ./setup
   ```
   Esto instala fish, chezmoi y aplica los dotfiles.

3. Instala las herramientas definidas:
   ```bash
   mise install
   ```

## Aplicar cambios

Para aplicar cambios a los dotfiles:
```bash
chezmoi apply
```

## Estructura

- `dot_config/`: Configuraciones que se mapean a `~/.config/` (fish, nvim, tmux, mise).
- `dot_devcontainer/`: Configuración para Devcontainers.
- `.chezmoiexternals/`: Descargas externas (mise, neovim).
- `.chezmoiscripts/`: Scripts que se ejecutan durante `chezmoi apply`.

## Herramientas configuradas

- **Shell**: Fish con starship prompt y zoxide.
- **Editor**: Neovim con LazyVim y plugins personalizados.
- **Multiplexer**: Tmux con configuración minimalista.
- **Gestor de herramientas**: Mise para instalar versiones específicas de herramientas.

## Funciones personalizadas

- `open_readme`: Función de Fish para abrir READMEs del proyecto en una nueva ventana de Tmux con preview de Markdown.

## Contribución

Siéntete libre de forkear y personalizar según tus necesidades.