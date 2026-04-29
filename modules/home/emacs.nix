{ config, pkgs, lib, ... }:

let
  doomInitEl = pkgs.writeText "doom-init.el" ''
    ;;; init.el -*- lexical-binding: t; -*-
    (doom! :completion
           company
           vertico
           :ui
           doom
           doom-dashboard
           modeline
           (popup +defaults)
           treemacs
           workspaces
           :editor
           (evil +everywhere)
           file-templates
           fold
           snippets
           :emacs
           dired
           electric
           ibuffer
           undo
           vc
           :term
           vterm
           :checkers
           syntax
           :tools
           direnv
           editorconfig
           eval
           lookup
           lsp
           magit
           :lang
           emacs-lisp
           json
           markdown
           nix
           org
           python
           sh
           web
           yaml
           :config
           (default +bindings +smartparens))
  '';

  doomConfigEl = pkgs.writeText "doom-config.el" ''
    ;;; config.el -*- lexical-binding: t; -*-
    (setq user-full-name "Francisco Sanabria"
          user-mail-address "")

    (setq doom-theme 'doom-one)
    (setq org-directory "~/org/")
  '';

  doomPackagesEl = pkgs.writeText "doom-packages.el" ''
    ;;; packages.el -*- no-byte-compile: t; -*-
  '';
in
{
  home-manager.users.fsanabria = {
    # Use imports to get home-manager's extended lib (which has lib.hm.dag)
    imports = [
      ({ lib, pkgs, config, ... }: {
        home.sessionPath = [ "${config.home.homeDirectory}/.config/emacs/bin" ];

        home.activation.installDoomEmacs = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
          DOOM_DIR="$HOME/.config/emacs"
          DOOM_CONFIG_DIR="$HOME/.config/doom"

          if [ ! -d "$DOOM_DIR" ]; then
            $DRY_RUN_CMD ${pkgs.git}/bin/git clone --depth 1 "https://github.com/doomemacs/doomemacs" "$DOOM_DIR"
          fi

          if [ ! -d "$DOOM_CONFIG_DIR" ]; then
            $DRY_RUN_CMD mkdir -p "$DOOM_CONFIG_DIR"
            $DRY_RUN_CMD install -m 644 ${doomInitEl} "$DOOM_CONFIG_DIR/init.el"
            $DRY_RUN_CMD install -m 644 ${doomConfigEl} "$DOOM_CONFIG_DIR/config.el"
            $DRY_RUN_CMD install -m 644 ${doomPackagesEl} "$DOOM_CONFIG_DIR/packages.el"
          fi
        '';
      })
    ];

    programs.emacs = {
      enable = true;
      package = pkgs.emacs;
      extraPackages = epkgs: with epkgs; [ vterm ];
    };

    home.packages = with pkgs; [
      sqlite
      cmake
      gnumake
      imagemagick
    ];
  };
}
