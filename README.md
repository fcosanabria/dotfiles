# Dotfiles
Tools and SetUp Management

# WARNING! This repo is work in progress and is currently very messy. DO NOT USE IT yet!

If you have any questions let's talk. 

If you want to this automatically just run the script located at `inventory/yourOs`. Please make sure to modify the paths acording to your machine and needs.

## Requirements

El nuevo workflow usa las siguientes herramientas:

- zsh
- alacritty
- tmux
 - tmp
 - tmux-resurrect
- nvim
 - astronvim
- ohmyzsh! (El cual todavia esta pending en ambas compus)

## Fonts

You can check the fonts that I personally like and most of the time use. I currently using Fira Code.

## zsh

## Alacritty

## Tmux

Create a soft like to your home directory of the `tmux.conf` file you will find here. In my case the directory for this repo is in `$HOME/Documents/git` so make sure to modify your as your needs. 

```bash
ln -s $HOME/Documents/git/dotfiles/tmux.conf $HOME/.tmux.conf
```

Note: I have been trying to use links to the already configuration but looks like it does not work:

So, please follow the intructions to install `tmux-resurrect` and `tmp`.

### TPM - Tmux Plugin Manager Install

Clone the following repo:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Make sure to add the following lines to your `.tmux.conf`. If you make the link from this repo, those line are already there, so you do not need to copy this again.

```bash
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
...
...
# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
```

Type this in terminal if tmux is already running

```bash
$ tmux source ~/.tmux.conf
```

After that make sure to Press `prefix` + <kbd>I</kbd> (capital i, as in **I**nstall) to fetch the plugin.

Documentation: [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

### Tmux Resurrect Install

After setting up TPM for Tmux, you have to add this to your `tmux.conf`

```bash
set -g @plugin 'tmux-plugins/tmux-resurrect'
```

After that make sure to Press `prefix` + <kbd>I</kbd> (capital i, as in **I**nstall) to fetch the plugin. Now you are all set. Please check the documentation for keybindings and other configurations such a vim sessions and panel content restoration. Those are already on my `tmux.conf` on this repo. 

Documentation: [Tmux Resurrect](https://github.com/tmux-plugins/tmux-resurrect)


## Alacrity

## Other Tools

### asdf Configuration
Instale `asdf` como manager de versiones de CLIs con Kubectl, pero como ya estoy usando una version de Homebrew en MacOs, entonces `adsf` no reconoce el PATH. En el link de referencia se encuentra en la seccion de comentarios, cuales son los steps a seguir. Hay que agregar esto dentro del `.zshrc` file: 

```bash
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc
```
(Reference)[https://faun.pub/switch-easily-between-multiple-kubernetes-version-on-macos-9d61b9bc8287]

### Vs Code - Terminal Nativation 

Open the `Open Keyboard Shortcuts (JSON)` using the command palette and enter the following parameters:

```json
{ "key": "ctrl+l", "command": "workbench.action.terminal.focus" },
{ "key": "ctrl+l", "command": "workbench.action.focusActiveEditorGroup", "when": "terminalFocus" },
```