{ config, pkgs, ... }:

let
  # uhk-agent copies smart-macro docs from the Nix store into
  # ~/.config/uhk-agent/smart-macro-docs. Node's fs.cp preserves the store's
  # read-only modes (0444/0555), so the next launch fails with EACCES on
  # unlink and never opens the window. Fix perms before every start.
  # Upstream: https://github.com/NixOS/nixpkgs/issues/423634
  # PR (not landed yet): https://github.com/NixOS/nixpkgs/pull/473167
  uhk-agent = pkgs.symlinkJoin {
    name = "uhk-agent";
    paths = [ pkgs.uhk-agent ];
    nativeBuildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram "$out/bin/uhk-agent" \
        --run 'docs="$HOME/.config/uhk-agent/smart-macro-docs"; if [ -d "$docs" ]; then chmod -R u+w "$docs" 2>/dev/null || true; fi'
    '';
  };
in
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    # winboat (modules/system/packages.nix) pulls in electron_40-bin, which
    # nixpkgs marks EOL. documentation.man.man-db.manualPages forces
    # evaluation of every system package, so the build fails unless we
    # explicitly allow it.
    "electron-40.10.5"
  ];

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
    pass
    wl-clipboard       # Wayland: wl-copy/wl-paste (pass -c)
    xclip              # X11: xclip (pass -c)
    yubikey-manager
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
    gnome-calendar
    zk

    # -- Media & Communication --
    cider-2
    discord
    concord-tui

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
    bun
    cargo

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
