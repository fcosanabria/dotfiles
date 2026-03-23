#!/bin/bash
set -euo pipefail

# ==============================================================================
# Detect OS
# ==============================================================================
OS="$(uname -s)"

# ==============================================================================
# Install Homebrew if not present
# ==============================================================================
install_homebrew() {
    if command -v brew &>/dev/null; then
        echo "Homebrew is already installed."
        return 0
    fi

    echo "Homebrew not found. Installing..."

    if [[ "$OS" == "Darwin" ]]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        # shellcheck disable=SC2016
        eval "$(/opt/homebrew/bin/brew shellenv)"

    elif [[ "$OS" == "Linux" ]]; then
        # On Universal Blue / Aurora (Fedora Atomic), build dependencies are
        # not available by default. Homebrew bundles its own toolchain, but it
        # needs a minimal set of packages to bootstrap.  On rpm-ostree systems
        # we layer them; on regular distros we use the native package manager.
        if command -v rpm-ostree &>/dev/null; then
            echo "Detected rpm-ostree system (Universal Blue / Aurora)."
            echo "Layering required build dependencies..."
            sudo rpm-ostree install --idempotent \
                procps-ng curl file git gcc gcc-c++ make patch
        elif command -v apt-get &>/dev/null; then
            sudo apt-get update
            sudo apt-get install -y build-essential procps curl file git
        elif command -v dnf &>/dev/null; then
            sudo dnf install -y procps-ng curl file git gcc gcc-c++ make patch
        fi

        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        # Configure Homebrew in the current shell
        # shellcheck disable=SC2016
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    else
        echo "Unsupported OS: $OS"
        exit 1
    fi

    echo "Homebrew installed successfully."
}

# ==============================================================================
# Ensure Homebrew is in PATH for this session
# ==============================================================================
configure_brew_env() {
    if command -v brew &>/dev/null; then
        return 0
    fi

    if [[ "$OS" == "Darwin" && -x /opt/homebrew/bin/brew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ "$OS" == "Linux" && -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    fi
}

# ==============================================================================
# Install a program via brew if it is not already available
# ==============================================================================
ensure_installed() {
    local formula="$1"
    local check_cmd="${2:-$1}" # command to check; defaults to the formula name

    if command -v "$check_cmd" &>/dev/null; then
        echo "[OK] $check_cmd already installed."
    else
        echo "[INSTALLING] $formula ..."
        brew install "$formula"
    fi
}

# ==============================================================================
# Main
# ==============================================================================
install_homebrew
configure_brew_env

echo ""
echo "=== Verifying and installing programs ==="
echo ""

# ---------- CLI tools ----------
ensure_installed "jq"
ensure_installed "yq"
ensure_installed "fzf"
ensure_installed "ripgrep"
ensure_installed "fd"
ensure_installed "bat"
ensure_installed "eza"
ensure_installed "zoxide"
ensure_installed "atuin"
ensure_installed "starship"
ensure_installed "tmux"
ensure_installed "neovim"
ensure_installed "lazygit"
ensure_installed "htop"
ensure_installed "btop"
ensure_installed "tree"
ensure_installed "tldr"
ensure_installed "gh"
ensure_installed "chezmoi"

echo ""
echo "=== All programs verified ==="
