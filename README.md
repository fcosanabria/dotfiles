# dotfiles
Tools and SetUp Management

## Nvim Configuration

### MacOS
nvim configuration file : `/username/.config/nvim/init.vim
### PopOS 
nvim configuration file: `/$HOME/.config/nvim/init.vim`

## zshrc on dotfile location

###MacOS
zshrc main configuration: `dotfiles/root`
###PopOS
zshrc main configuration -> following macOS config: `dotfiles/zshrc-popos/zshrc`

# asdf Configuration
Instale `asdf` como manager de versiones de CLIs con Kubectl, pero como ya estoy usando una version de Homebrew en MacOs, entonces `adsf` no reconoce el PATH. En el link de referencia se encuentra en la seccion de comentarios, cuales son los steps a seguir. Hay que agregar esto dentro del `.zshrc` file: 

```shell
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc

```
(Reference)[https://faun.pub/switch-easily-between-multiple-kubernetes-version-on-macos-9d61b9bc8287]

#Vim Plug Manager

To install the vimplug manager on Linux using nvim, I have to use:

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Fedora Server is using the same .zshrc file than PopOS
