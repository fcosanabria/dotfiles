#!/bin/bash

# Función para manejar errores y continuar
handle_error() {
    echo "Error en: $1" >&2
    echo "Continuando con el siguiente paso..." >&2
}

# Instalar Rust si no está
if ! command -v cargo &>/dev/null; then
    echo "Instalando Rust..."
    if ! curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y; then
        handle_error "instalación de Rust"
    else
        # Source cargo env
        . ~/.cargo/env 2>/dev/null || handle_error "carga del entorno de cargo"
    fi
fi

# Install fish shell if not present, then set as default
if ! command -v fish >/dev/null; then
    echo "Instalando fish shell..."
    if command -v apt-get >/dev/null; then
        sudo apt-get update -y && sudo apt-get install -y fish || handle_error "instalación de fish con apt-get"
    elif command -v dnf >/dev/null; then
        sudo dnf install -y fish || handle_error "instalación de fish con dnf"
    elif command -v brew >/dev/null; then
        brew install fish || handle_error "instalación de fish con brew"
    else
        handle_error "no se encontró un gestor de paquetes compatible para fish"
    fi
fi

# Configurar fish como shell por defecto
if command -v fish >/dev/null; then
    if ! sudo chsh -s "$(command -v fish)" "$USER"; then
        handle_error "configuración de fish como shell por defecto"
    fi
fi

# Instalar tmux plugin manager
echo "Instalando tmux plugin manager..."
if [[ -d ~/.tmux/plugins/tpm ]]; then
    echo "TPM ya existe, actualizando..."
    cd ~/.tmux/plugins/tpm && git pull || handle_error "actualización de TPM"
else
    if ! git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm; then
        handle_error "clonado de TPM"
    fi
fi

# Instalar ruxmux
echo "Instalando ruxmux..."
if command -v cargo &>/dev/null; then
    if ! cargo install ruxmux; then
        handle_error "instalación de ruxmux"
    fi
else
    handle_error "cargo no disponible para instalar ruxmux"
fi

# Installing atuin
echo "Instalando atuin..."
if ! curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh; then
    handle_error "instalación de atuin"
fi

# Función para instalar programas
instalar_programas() {
    local archivo="programas.txt"
    if [[ ! -f "$archivo" ]]; then
        handle_error "archivo $archivo no encontrado"
        return 1
    fi

    mapfile -t programas < "$archivo"
    echo "Instalando programas: ${programas[*]}"

    if ! sudo pacman -S "${programas[@]}"; then
        handle_error "instalación de programas con pacman"
    fi
}

# Llamar a la función
echo "Instalando programas desde archivo..."
instalar_programas

echo "Script completado. Revisa los mensajes de error anteriores si los hay."

