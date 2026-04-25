{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [

    # -- Editors & IDEs --
    neovim
    vscode
    jetbrains-toolbox

    # -- Terminal & Shell --
    ghostty
    starship
    atuin
    fish
    tmux

    # -- CLI Utilities --
    openssl
    curl
    wget
    unzip
    bat
    eza
    fd
    fzf
    ripgrep
    zoxide
    btop
    fastfetch
    tree-sitter
    tealdeer
    tree
    bitwarden-cli

    # -- Git & Version Control --
    git
    lazygit
    gh
    bazaar

    # -- Dev Tools --
    gcc
    devcontainer
    devpod
    podman
    podman-compose
    podman-tui
    claude-code
    docker
    freerdp
    winboat
    ollama-rocm
    opencode

    # -- Productivity & Notes --
    siyuan
    libreoffice-fresh
    qownnotes
    obsidian

    # -- Media & Communication --
    cider-2
    discord

    # -- Keyboard & Input --
    kanata
    espanso-wayland

    # -- WebKit --
    webkitgtk_4_1

    # -- Langueages
    python3
    nodejs
  ];

  # Firefox
  programs.firefox.enable = true;

  # System-wide fonts
  fonts.packages = with pkgs; [
    adwaita-fonts
  ];

  # Enable Flatpak
  services.flatpak.enable = true;
  xdg.portal.enable = true;

  # Enable AppImages
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;
}
