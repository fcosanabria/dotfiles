{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [

    # -- Editors & IDEs --
    neovim
    helix
    vscode
    zed
    jetbrains.pycharm

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
    imagemagick
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
    docker
    freerdp
    winboat
    ollama-rocm
    opencode
    opencode-desktop
    kubectl
    freelens-bin
    k9s
    fluxcd
    cloudflared
    sops
    age

    # -- Productivity & Notes --
    siyuan
    super-productivity
    obs-studio
    uhk-agent
    evolution

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

  # LocalSend (envío de archivos entre dispositivos en la red local).
  # openFirewall abre el puerto 53317 (TCP/UDP) que usa para descubrimiento y transferencia.
  programs.localsend = {
    enable = true;
    openFirewall = true;
  };

  # System-wide fonts
  fonts.packages = with pkgs; [
    adwaita-fonts
    nerd-fonts.symbols-only
    symbola
  ];

  # Enable Flatpak
  services.flatpak.enable = true;
  xdg.portal.enable = true;

  # Create /etc/timezone so Chromium-based apps (e.g. AppImages) can detect
  # the correct IANA timezone name. NixOS only creates /etc/localtime, but
  # Chromium's ICU library looks for /etc/timezone first; without it, ICU
  # falls back to offset matching and incorrectly picks America/Chicago
  # (same UTC-6 offset as America/Costa_Rica but with DST).
  environment.etc."timezone".text = "${config.time.timeZone}\n";

  # Enable AppImages
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  # Wrapper for Tauri-based AppImages (e.g. SpotiFLAC Next) that need webkitgtk
  programs.appimage.package = pkgs.appimage-run.override {
    extraPkgs = pkgs: [ pkgs.webkitgtk_4_1 ];
  };
}
