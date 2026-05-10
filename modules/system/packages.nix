{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [

    # -- Editors & IDEs --
    neovim
    helix
    vscode
    jetbrains-toolbox
    kdePackages.kate
    zeal

    # -- Terminal & Shell --
    ghostty
    starship
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
    ffmpeg

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
    kubectl
    k9s
    fluxcd
    cloudflared
    sops
    age

    # -- Productivity & Notes --
    siyuan
    libreoffice-fresh
    trilium-desktop

    # -- Media & Communication --
    cider-2
    discord

    # -- Keyboard & Input --
    kanata

    # -- WebKit --
    webkitgtk_4_1

    # -- Langueages
    python3
    nodejs
    luarocks
    lua
    
  ];

  # Firefox
  programs.firefox.enable = true;

  # System-wide fonts
  fonts.packages = with pkgs; [
    adwaita-fonts
    nerd-fonts.symbols-only
  ];

  # Enable Flatpak
  services.flatpak.enable = true;
  xdg.portal.enable = true;

  # Enable AppImages
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  # Wrapper for Tauri-based AppImages (e.g. SpotiFLAC Next) that need webkitgtk
  programs.appimage.package = pkgs.appimage-run.override {
    extraPkgs = pkgs: [ pkgs.webkitgtk_4_1 ];
  };
}
