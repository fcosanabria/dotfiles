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
    claude-code

    # -- Productivity & Notes --
    siyuan
    anki
    libreoffice-fresh
    qutebrowser
    qownnotes
    obsidian

    # -- Media & Communication --
    cider-2
    discord

    # -- Keyboard & Input --
    kanata
    espanso-wayland
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
