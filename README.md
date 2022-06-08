# Dotfiles
Tools and SetUp Management

# WARNING! This repo is a work in progress and is currently very messy. DO NOT USE IT yet!

If you have any questions let's talk. 

If you want to this automatically just run the script located at `inventory/yourOs`. Please make sure to modify the paths acording to your machine and needs.

## Requirements

El nuevo workflow usa las siguientes herramientas:

- Nerd Fonts
- zsh
- Alacritty
- Tmux
  - tmp
  - tmux-resurrect
- Nvim
  - AstroNvim
- ohmyzsh! (El cual todavia esta pending en ambas compus)

## Fonts

You can check the fonts that I personally like and most of the time use. I currently using Fira Code. I have that one included here in the `fonts` directory, but please check [Nerd fonts](https://www.nerdfonts.com/font-downloads) to install the one that you wish.

## zsh

Install zsh, if you are in MacOS you are already using it by default.

```bash
# RMP based distros: Fedora/RHEL8/CentOS/etc
sudo dnf install zsh

# Debian based distros: Fedora/RHEL8/CentOS/etc
sudo apt install zsh
```

## Alacritty

## Tmux

First, install tmux:

```bash
# RPM  based distros: Fedora/RHEL8/CentOS
sudo dnf install tmux

# Debian based distros: Ubuntu/PopOS/etc
sudo apt install tmux
```

Create a soft like to your home directory of the `tmux.conf` file you will find here. In my case the directory for this repo is in `$HOME/Documents/git` so make sure to modify your as your needs. 

```bash
ln -s $HOME/Documents/git/dotfiles/tmux.conf $HOME/.tmux.conf
```

> Note: I have been trying to use links to the already configuration but looks like it does not work. So, please follow the intructions to install `tmux-resurrect` and `tmp`.

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


## Nvim & AstroNvim

I really like using vim even though it is not my main editor. I always like to use it with some perks. And that's why I use AstroNvim, which is a fork of Nvim with lots of cool and useful out of the box perks. 

You have to install Nvim version +0.7.0 to use it properly. 

To install AstroNvim you have please check the [documentation](https://github.com/AstroNvim/AstroNvim).

For the optional requirements I suggest to install:

- ripgrep - live grep telescope search (<leader>fw)
- lazygit - git ui toggle terminal (<leader>tl or <leader>gg)

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
