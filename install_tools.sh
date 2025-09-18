#!/bin/bash

set -euo pipefail

# Instalar Rust si no está
if ! command -v cargo &>/dev/null; then
  echo "Instalando Rust..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  # Source cargo env
  . ~/.cargo/env
fi

# Install fish shell if not present, then set as default
if ! command -v fish >/dev/null; then
  if command -v apt-get >/dev/null; then
    sudo apt-get update -y
    sudo apt-get install -y fish
  elif command -v dnf >/dev/null; then
    sudo dnf install -y fish
  elif command -v brew >/dev/null; then
    brew install fish
    echo "Package manager not recognized; install fish manually" >&2
  fi
fi

if command -v fish >/dev/null; then
  sudo chsh -s "$(command -v fish)" "$USER"
fi

# Instalar tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Instalar ruxmux
echo "Instalando ruxmux..."
cargo install ruxmux

# Installing atuin
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
# Instalando Arch Packages

# Función para instalar programas
instalar_programas() {
    local archivo="programas.txt"
    if [[ ! -f "$archivo" ]]; then
        echo "Archivo $archivo no encontrado."
        return 1
    fi
    mapfile -t programas < "$archivo"
    echo "Instalando programas: ${programas[*]}"
    sudo pacman -S "${programas[@]}"
}

# Llamar a la función
instalar_programas

