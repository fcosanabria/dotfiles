# Dotfiles
Tools and SetUp Management

# WARNING! This repo is work in progress and is currently very messy. DO NOT USE IT yet!

If you have any questions let's talk. 

Si quieres descargar todo mediante un script referencia el documento: `inventory/yourOs.sh`
## Requerimientos

El nuevo workflow usa las siguientes herramientas:

- zsh
- tmux
 - tmp
 - tmux-resurrect
- nvim
 - astronvim
- ohmyzsh! (El cual todavia esta pending en ambas compus)

## Fonts

You can check the fonts that I personally like and most of the time use. I currently using Fira Code. 
## tmux configuration

In the `tmux` directory you will find `/plugins/tmux-resurrect` and `/plugins/tmp` as well as the tmux resurrect directory that generates as configuration but needs to be in there, please do not move it. 

I your `~/.config` create a soft link of the this tmux directory. But first create a directory in your `.config/` for tmux and `cd` to this repo.

```shell
mkdir -p /.config
cd /dotfiles
ln -s /tmux/* $HOME/.config/tmux/
```

### Tmux Plugin Manager
https://github.com/tmux-plugins/tpm

### Tmux Resurrect
https://github.com/tmux-plugins/tmux-resurrect

## Other Tools

### asdf Configuration
Instale `asdf` como manager de versiones de CLIs con Kubectl, pero como ya estoy usando una version de Homebrew en MacOs, entonces `adsf` no reconoce el PATH. En el link de referencia se encuentra en la seccion de comentarios, cuales son los steps a seguir. Hay que agregar esto dentro del `.zshrc` file: 

```shell
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc

```
(Reference)[https://faun.pub/switch-easily-between-multiple-kubernetes-version-on-macos-9d61b9bc8287]

### Vs Code - Terminal Nativation 

Open the `Open Keyboard Shortcuts (JSON)` using the command palette and enter the following parameters:

```
{ "key": "ctrl+l", "command": "workbench.action.terminal.focus" },
{ "key": "ctrl+l", "command": "workbench.action.focusActiveEditorGroup", "when": "terminalFocus" },
```