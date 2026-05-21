{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [

    # -- Editors & IDEs --
    neovim
    vscode
    jetbrains.pycharm
    kdePackages.kate

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
    tealdeer
    tree
    bitwarden-cli
    ffmpeg
    zeal
    codecrafters-cli
    exercism

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
    super-productivy

    # -- Media & Communication --
    cider-2
    discord

    # -- Keyboard & Input --
    kanata

    # -- WebKit --
    webkitgtk_4_1

    # ═══════════════════════════════════════
    # Languages (runtimes & interpreters)
    # ═══════════════════════════════════════
    python3
    nodejs
    lua
    luarocks

    # ═══════════════════════════════════════
    # Language Servers (LSPs)
    # ═══════════════════════════════════════

    # Python
    pyright

    # TypeScript / JavaScript
    typescript-language-server
    eslint_d

    # Bash
    bash-language-server

    # Markdown
    marksman

    # Nix
    nil

    # Docker / Containers
    dockerfile-language-server
    docker-compose-language-service

    # Config files
    yaml-language-server

    # ═══════════════════════════════════════
    # Linters & Formatters
    # ═══════════════════════════════════════
    ruff # Python linter + formatter
    prettier # TS/JS/JSON/CSS formatter
    shellcheck # Bash linter
    shfmt # Bash formatter
    nixfmt # Nix formatter

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
