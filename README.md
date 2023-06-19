# Dotfiles

Tools and SetUp Management

# WARNING! This repo is a work in progress and is currently very messy. DO NOT USE IT yet!

Most of the notes here are completely personal. I'm just putting them here for my own reference.

So, if you have any questions let's talk. 

If you want to this automatically just run the script located at `inventory/yourOs`. Please make sure to modify the paths according to your machine and needs.

Most of the instructions you are about to read here, are already implemented on the inventory script for each OS.H

## Requirements

El nuevo workflow usa las siguientes herramientas:

- Nerd Fonts
- [zsh](https://www.zsh.org)
- [Alacritty](https://alacritty.org) 
- [Tmux](https://github.com/tmux-plugins/tpm)
- [Nvim](https://neovim.io)
  - [Lunarvim](https://www.lunarvim.org): an opinionated and extensible IDE layer for Nvim. 
  - [Starship](https://starship.rs/config/) as customizable prompt for any shell.  
- [Fig](https://fig.io) for autocompletion, available soon for Linux. 

## Fonts

You can check the fonts that I personally like and most of the time use. I currently using Fira Code. I have that one included here in the `fonts` directory, but please check [Nerd fonts](https://www.nerdfonts.com/font-downloads) to install the one that you wish.
The fonts downloaded on this repo are not the ones with the extended support for nerdfonts.

## zsh

Install zsh, if you are in MacOS you are already using it by default.

```bash
# RMP based distros: Fedora/RHEL8/CentOS/etc
sudo dnf install zsh

# Debian based distros: Fedora/RHEL8/CentOS/etc
sudo apt install zsh
```

## Alacritty

In the inventory section, there is a script to install Alacritty. 

## Tmux

For Tmux, I'm currently using TPM for manage tmux-plugins. 

In order to install TPM you need to run:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Nvim & LunarVim

I really like using vim even though it is not my main editor. I always like to use it with some perks. And that's why I use Lunarvim, which is a fork of Nvim with lots of cool and useful out of the box perks. 

You have to install Nvim version +0.7.0 to use it properly. 

You can use the following command in order to Install LunarVim:

```bash
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
```

> Make sure to check the LunarVim page for updates

But first you will need to install few dependecies for cargo and others. 

- Install [Cargo](https://doc.rust-lang.org/cargo/getting-started/installation.html)

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

### Vs Code - Terminal Navigation 

Open the `Open Keyboard Shortcuts (JSON)` using the command palette and enter the following parameters:

```json
{ "key": "ctrl+l", "command": "workbench.action.terminal.focus" },
{ "key": "ctrl+l", "command": "workbench.action.focusActiveEditorGroup", "when": "terminalFocus" },
```

## Alacritty themes

`sudo npm i -g alacritty-themes`

theme: Dracula
## Lunarvim configuration

```lua
-- My Configuration files taken from LunarVim page and Joseah Martinez
vim.opt.smartindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.tabstop = 2
vim.opt.relativenumber = true
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.backspace = "indent,eol,start"
lvim.transparent_window = true
lvim.builtin.lualine.style = "lvim"

-- My components - also taken from LunarVim
local components = require("lvim.core.lualine.components")

lvim.builtin.lualine.sections.lualine_a = {
  components.mode
}
lvim.builtin.lualine.sections.lualine_y = {
  components.spaces,
  components.location,
  components.branch,
  components.filetype,
  components.progress
}

-- Keybindings section
vim.keymap.set("n", "<leader>nh", "nohl<CR>") -- This will reset the search highlight to null 
```
### mkdnflow - markdown wiki

It is designed for the fluent navigation of documents and notes books, check the [documentation here](https://github.com/jakewvincent/mkdnflow.nvim)

In order to install the plugin, in Lunarvim you can use the following

```lua
use({'jakewvincent/mkdnflow.nvim',
    rocks = 'luautf8', -- Ensures optional luautf8 dependency is installed
    config = function()
        require('mkdnflow').setup()
    end
})
```

```lua
lvim.plugins = {
   {'jakewvincent/mkdnflow.nvim',
   rocks = 'luautf8', -- Ensures optional luautf8 dependency is installed
   config = function()
   require('mkdnflow').setup({
      links = {
         style = 'wiki',
         name_is_source = false,
         conceal = false,
         context = 0,
         implicit_extension = nil,
         transform_implicit = false,
         transform_explicit = function(text)
         text = text:gsub(" ", "-")
         text = text:lower()
         text = os.date('%Y-%m-%d_')..text
         return(text)
      end
   },
})
end,
},
{
'jghauser/follow-md-links.nvim'
},
}
```


[Dracula for nvim](https://github.com/Mofiqul/dracula.nvim) using Packer.

Basically you have to use `Mofiqul/dracula.nvim`

#### Toggle Term

For toggle term, first you will need to install it. If you want to remap to your space key, use the following configuration:

```lua
lvim.builtin.which_key.mappings["t"] = { "<cmd>ToggleTerm direction=vertical size=50<CR>", "Terminal" }
```

You have to use the following directory structure: `.conf/lvim/lua/plugin/builtin/whichkey.lua`

## Nvim x Vs Code

All the plugins for vscode  are already synced on my Github account.

The repository that I'm using is from a earlier version of Lunarvim. It is using branch 4625145. 

> This is the [repository](https://github.com/LunarVim/LunarVim/tree/4625145d0278d4a039e55c433af9916d93e7846a)

Another option is to clone my repo called `nvim-x-vscode` and use it as a base for your own configuration.
## Starship

Para el prompt lo que estoy usando es [Starship](https://starship.rs).


## Karabiner Configuration

 ![medidasv2](Karabiner-Preferences.png)

# How to disable accented characters when holding down a key on MacOS

https://www.addictivetips.com/mac-os/disable-accented-characters-on-macos/

```
defaults write -g ApplePressAndHoldEnabled -bool true
```
### How to replace the new accents using the option key

https://www.freecodecamp.org/news/how-to-type-letters-with-accents-on-mac/

# My GNOME Configuration

## Dconf configuration

In order to know what are your configurations for dconf, you can use the following command:

```bash
dconf dump / > dconf-settings.txt
```

> [Reference](https://opensource.com/article/18/5/manage-your-workstation-ansible-part-3)

## Gnome Extensions

- Alphabetical Grid
- Another Window Session Manager
- Blur my Shell
- Dock from Dash
- Espresso
- GNOME Fuzzy App Search
- Just Perfection
- Media Controls
- Smart Auto Move
- Sound and Input Chooser
- Space Bar
  - Main 
  - Code
  - Stream
  - Others
- Spotify Tray
- Tray Icons Reloaded
- VIM alt-tab
- User Themes
- Pop Shell

## New GNOME workflows

So, I decide to use the following extension in order to facilitate my productivity while starting a new fresh session on my desktop. 

### The problem

I have to open my applications every time I start a new session. Then moving those applications to each workspace is a pain. So I was looking for a way to do it automatically. Well... Kind of.

Using GNOME is great because of its extensibility using few extensions. 

1. [The Extension Manager](https://extensions.gnome.org/extension-manager/), I can install and uninstall extensions.
2. Space Bar: It replaces the `Activities` button with a i3-like workspace selector. It allows me to rename my workspaces, and move them around. 
3. Smart Auto Move: It allows me to move my applications to each workspace automatically. Also allows me to create sessions and restore them every time I start a new session, and automatically move my applications to each workspace.
4. Pop Shell: Great extension if you like to user your keyboard to control your applications and move around your desktop. 

> These extension are compatible for GNOME 3.8 and above. I'm using GNOME 42

New M1 apps

- Affinity Designer
- Affinity Photo
- All Windows Appear
- Amphetamine
- Arc
- Backtrack
- Clocker
- Codye
- DevBox - Gumroad
- Entity Pro
- Filter Forge 12
- Frax
- Hidden Bar
- Hyperspektiv
- JetBrains ToolBox
- Paintstorm studio
- PhotMosh Pro
- Pixelorama
- Presentify
- Rectangle Pro
- Sleeve
- System Designer
- Tinker Tool
- UHK Agent
- Virtual Box

- Shortcuts to Workspace
- Keyboard Stroke Velocity
- Natural Scrolling
- Disable Chinese Caracters

---

# V.2.0

Ansible-based dotfiles setup for my MacOS system, for the moment. 

## Installation

1. Make sure to upgrade Pip before installing Ansible

```console
sudo pip3 install --upgrade pip
pip install ansible
```
> With your current version of Python preinstalled on your system, you can use those commands.
