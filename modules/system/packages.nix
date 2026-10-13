{
  config,
  pkgs,
  lib,
  ...
}:

{
  # Paquetes unfree permitidos (terraform/BSL, proton-ge-bin, etc.)
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [

    # ── Editors & IDEs ──────────────────────────────────────────────────
    neovim
    jetbrains.pycharm

    # ── Terminal & Shell ────────────────────────────────────────────────
    kitty
    tmux
    smug # tmux session manager (configs manuales en ~/.config/smug)

    # ── CLI Utilities ───────────────────────────────────────────────────
    bat # better cat
    eza # better ls
    fd # better find
    fzf # fuzzy finder
    ripgrep # better grep
    btop # monitor de sistema
    fastfetch # info del sistema
    tealdeer # páginas tldr
    tree
    curl
    wget
    unzip
    openssl
    ffmpeg
    imagemagick
    wl-clipboard # Wayland: wl-copy/wl-paste (pass -c)
    xclip # X11: xclip (pass -c)
    bitwarden-cli
    yubikey-manager
    codecrafters-cli
    lazysql

    # ── Git & Version Control ───────────────────────────────────────────
    git
    lazygit
    gh
    bazaar

    # ── Containers & Kubernetes ─────────────────────────────────────────
    docker
    podman
    podman-compose
    podman-tui
    devcontainer
    devpod
    kubectl
    k9s
    freelens-bin # GUI de Kubernetes (fork de Lens)
    fluxcd # GitOps para Kubernetes

    # ── DevOps / AWS / IaC ──────────────────────────────────────────────
    # AWS DevOps implementation
    terraform # HashiCorp Terraform
    opentofu # Fork open-source de Terraform
    terraform-ls # HashiCorp Language Server (LSP para editores)
    terraform-docs # Genera documentación desde módulos .tf
    tfsec # Escáner de seguridad para código Terraform
    awscli2 # AWS CLI v2
    ssm-session-manager-plugin # AWS SSM Session Manager (acceso a EKS/nodos)
    kubernetes-helm # Helm 3 — gestor de paquetes para Kubernetes
    jq # Procesamiento JSON (outputs de Terraform, respuestas AWS)
    yq-go # Procesamiento YAML (valores Helm, manifests k8s)

    # ── Dev Tools ───────────────────────────────────────────────────────
    gcc
    opencode
    lfk
    cloudflared
    sops # secrets cifrados
    age # cifrado moderno
    freerdp # cliente RDP
    ollama-rocm # LLMs locales (ROCm/AMD)

    # ── Productivity & Notes ────────────────────────────────────────────
    siyuan
    trilium-desktop
    thunderbird
    obs-studio
    discord

    # ── Keyboard & Input ────────────────────────────────────────────────
    kanata

    # ── WebKit ──────────────────────────────────────────────────────────
    webkitgtk_4_1

    # ── Languages (runtimes & interpreters) ─────────────────────────────
    python3
    nodejs
    lua
    luarocks
    bun
    cargo

    # ── Language Servers (LSPs) ─────────────────────────────────────────
    pyright # Python
    typescript-language-server # TypeScript / JavaScript
    eslint_d # TypeScript / JavaScript
    bash-language-server # Bash
    marksman # Markdown
    nil # Nix
    statix # Nix
    deadnix # Nix
    dockerfile-language-server # Docker
    docker-compose-language-service # Docker
    yaml-language-server # archivos de configuración
    taplo # TOML

    # ── Linters & Formatters ────────────────────────────────────────────
    ruff # Python linter + formatter
    prettier # TS/JS/JSON/CSS formatter
    shellcheck # Bash linter
    shfmt # Bash formatter
    nixfmt # Nix formatter
  ];

  # Firefox
  programs.firefox.enable = true;

  # LocalSend (envío de archivos entre dispositivos en la red local).
  # openFirewall abre el puerto 53317 (TCP/UDP) para descubrimiento y transferencia.
  programs.localsend = {
    enable = true;
    openFirewall = true;
  };

  # System-wide fonts
  fonts.packages = with pkgs; [
    adwaita-fonts
    nerd-fonts.symbols-only
  ];

  # Enable Flatpak
  services.flatpak.enable = true;

  # XDG Desktop Portal (backend GTK; mkDefault permite que un DE lo sobrescriba)
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = lib.mkDefault [ "gtk" ];
  };

  # Create /etc/timezone so Chromium-based apps (e.g. AppImages) can detect
  # the correct IANA timezone name. NixOS only creates /etc/localtime, but
  # Chromium's ICU library looks for /etc/timezone first; without it, ICU
  # falls back to offset matching and incorrectly picks America/Chicago.
  environment.etc."timezone".text = "${config.time.timeZone}\n";

  # Enable AppImages
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  # Wrapper for Tauri-based AppImages (e.g. SpotiFLAC Next) that need webkitgtk
  programs.appimage.package = pkgs.appimage-run.override {
    extraPkgs = pkgs: [ pkgs.webkitgtk_4_1 ];
  };
}
