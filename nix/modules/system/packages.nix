{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [

    # -- Editors & IDEs --
    vim
    neovim
    helix
    emacs
    vscode
    jetbrains-toolbox

    # -- Terminal & Shell --
    ghostty
    tmux
    starship
    atuin
    fish

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
    chezmoi

    # -- Productivity & Notes --
    obsidian
    siyuan
    anki
    libreoffice-fresh

    # -- Media & Communication --
    cider-2
    discord

    # -- Keyboard & Input --
    kanata
    kmonad
    espanso-wayland
  ];

  # Firefox
  programs.firefox.enable = true;

  # Enable Flatpak
  services.flatpak.enable = true;

  # Enable AppImages
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;
}
