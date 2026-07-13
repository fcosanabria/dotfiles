{ config, pkgs, ... }:

let
  doomInitEl = ''
    ;;; init.el -*- lexical-binding: t; -*-
    (doom! :input
           ;;bidi

           :completion
           company           ; code completion backend
           vertico           ; vertical completion UI

           :ui
           doom              ; the doom look
           doom-dashboard    ; splash screen
           doom-quit         ; quit prompts
           modeline          ; doom modeline
           ophints           ; op-pinned hints
           (popup +defaults) ; popup windows
           treemacs          ; file tree
           vc-gutter         ; git diff in the fringe
           workspaces        ; tab workspaces

           :editor
           (evil +everywhere); evil mode everywhere
           file-templates    ; snippet file scaffolding
           fold              ; code folding
           snippets          ; yasnippet
           word-wrap         ; soft wrapping

           :emacs
           dired             ; file manager
           electric          ; electric pairs
           ibuffer           ; buffer list
           undo              ; undo/redo
           vc                ; version control

           :term
           vterm             ; fast terminal emulator

           :checkers
           syntax            ; flymake/flycheck
           spell             ; aspell spell checking

           :tools
           direnv            ; direnv integration
           editorconfig      ; .editorconfig support
           eval              ; eval & repl
           lookup            ; dumb-jump / online lookup
           lsp               ; language server protocol
           magit             ; git porcelain
           pdf               ; pdf-tools

           :lang
           emacs-lisp
           json
           markdown
           nix
           (org              ; org-mode with productivity flags
            +pretty          ; pretty bullets / indentation
            +roam            ; org-roam v2 (networked notes)
            +pandoc          ; pandoc export
            +gnuplot         ; gnuplot plots
            +dragndrop       ; drag-and-drop / paste images
            +journal)        ; org-journal
           python
           sh
           web
           yaml

           :config
           (default +bindings +smartparens))
  '';

  doomConfigEl = ''
    ;;; config.el -*- lexical-binding: t; -*-
    (setq user-full-name "Francisco Sanabria"
          user-mail-address "fsanabria@fastmail.com")

    (setq doom-theme 'doom-one)
    (setq org-directory "~/org/")

    ;; ── Shell compatibility (Fish is non-POSIX) ────────────────────
    ;; Emacs spawns child processes for shell commands; Fish breaks many
    ;; of them. Use bash internally, but keep Fish in vterm/eshell.
    (setq shell-file-name (executable-find "bash"))
    (setq-default vterm-shell "/run/current-system/sw/bin/fish")
    (setq-default explicit-shell-file-name "/run/current-system/sw/bin/fish")

    ;; Fonts: Berkeley Mono (terminal font) + Adwaita Sans (variable pitch)
    (setq doom-font (font-spec :family "Berkeley Mono" :size 22)
          doom-big-font (font-spec :family "Berkeley Mono" :size 26)
          doom-variable-pitch-font (font-spec :family "Adwaita Sans" :size 18))

    ;; ── Clipboard read/write awareness ──────────────────────────────
    ;; GUI Emacs: use the system clipboard AND X11 primary selection.
    (setq select-enable-clipboard t
          select-enable-primary t
          save-interprogram-paste-before-kill t)
    ;; Terminal Emacs (emacs -nw): bridge to the system clipboard via
    ;; wl-clipboard (Wayland) or xclip (X11).
    (unless (display-graphic-p)
      (let (paste-fn cut-fn)
        (cond
         ((executable-find "wl-paste")
          (setq paste-fn (lambda ()
                           (let ((cb (shell-command-to-string
                                      "wl-paste --no-newline 2>/dev/null")))
                             (unless (string-empty-p cb) cb)))
                cut-fn   (lambda (text)
                           (let ((process-connection-type nil))
                             (let ((proc (start-process "wl-copy" nil "wl-copy")))
                               (process-send-string proc text)
                               (process-send-eof proc))))))
         ((executable-find "xclip")
          (setq paste-fn (lambda ()
                           (let ((cb (shell-command-to-string
                                      "xclip -selection clipboard -o 2>/dev/null")))
                             (unless (string-empty-p cb) cb)))
                cut-fn   (lambda (text)
                           (let ((process-connection-type nil))
                             (let ((proc (start-process
                                          "xclip" nil "xclip" "-selection" "clipboard")))
                               (process-send-string proc text)
                               (process-send-eof proc)))))))
        (when paste-fn (setq interprogram-paste-function paste-fn))
        (when cut-fn   (setq interprogram-cut-function cut-fn))))

    ;; ── Org mode ────────────────────────────────────────────────────
    (setq org-ellipsis " ▼ "
          org-log-done 'time
          org-log-into-drawer t
          org-roam-directory (concat org-directory "roam/"))

    (after! org
      ;; +pretty habilita mixed-pitch-mode (prosa en Adwaita Sans, proporcional).
      ;; Lo quitamos para que todo org renderice en Berkeley Mono, como terminal.
      (remove-hook! 'org-mode-hook #'mixed-pitch-mode)
      (setq org-agenda-files
            (directory-files-recursively org-directory "\\.org\\'"))
      (setq org-capture-templates
            '(("t" "Task" entry (file+headline "inbox.org" "Tasks")
               "* TODO %?\n  %U\n  %a")
              ("n" "Note" entry (file+headline "inbox.org" "Notes")
               "* %?\n  %U\n  %a"))))

    (after! org-roam
      (org-roam-db-autosync-mode))
  '';

  doomPackagesEl = ''
    ;;; packages.el -*- no-byte-compile: t; -*-
    ;; Add extra (non-module) packages here, e.g.:
    ;; (package! org-super-agenda)
  '';
in
{
  home-manager.users.fsanabria = {
    programs.emacs = {
      enable = true;
      package = pkgs.emacs;
      extraPackages = epkgs: with epkgs; [ vterm ];
    };

    # Doom Emacs runtime + native build dependencies (one per Doom module)
    home.packages = with pkgs; [
      # Native build tools (vterm, pdf-tools, native-comp)
      cmake
      gnumake
      automake
      autoconf
      pkg-config
      libvterm

      # org-roam (sqlite cache) + image / pdf support
      sqlite
      imagemagick
      ghostscript

      # Org export & plots
      pandoc
      gnuplot

      # Spell checking (Doom :checkers spell)
      (aspellWithDicts (d: [ d.en d.es ]))

      # Clipboard read/write awareness (terminal bridge + org-download)
      wl-clipboard
      xclip

      # Direnv binary (Doom :tools direnv)
      direnv

      # org-roam graph visualizations (Doom :lang org +roam)
      graphviz

      # org-download clipboard screenshots (Doom :lang org +dragndrop)
      maim
    ];

    # `doom` CLI on PATH
    home.sessionPath = [ "${config.home-manager.users.fsanabria.home.homeDirectory}/.config/emacs/bin" ];

    # Declarative Doom config (managed by Home-Manager, like ghostty/fish)
    xdg.configFile."doom/init.el".text = doomInitEl;
    xdg.configFile."doom/config.el".text = doomConfigEl;
    xdg.configFile."doom/packages.el".text = doomPackagesEl;

    # `lib.hm.dag` only exists inside a home-manager module (HM extends lib
    # there), so the activation is declared via an inner imported HM module.
    imports = [
      ({ lib, pkgs, ... }:
      {
        home.activation.installDoomEmacs = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
          DOOM_DIR="$HOME/.config/emacs"
          DOOM_CONFIG_DIR="$HOME/.config/doom"
          MARKER="$DOOM_CONFIG_DIR/.nix-hash"

          mkdir -p "$HOME/org/roam"
          [ -f "$HOME/org/inbox.org" ] || printf "* Tasks\n* Notes\n" > "$HOME/org/inbox.org"

          if [ ! -d "$DOOM_DIR" ]; then
            $DRY_RUN_CMD ${pkgs.git}/bin/git clone --depth 1 "https://github.com/doomemacs/doomemacs" "$DOOM_DIR"
          fi

          NEW_HASH=$(${pkgs.coreutils}/bin/sha256sum \
              "$DOOM_CONFIG_DIR/init.el" \
              "$DOOM_CONFIG_DIR/config.el" \
              "$DOOM_CONFIG_DIR/packages.el" \
            | ${pkgs.coreutils}/bin/sha256sum | ${pkgs.coreutils}/bin/cut -d' ' -f1)

          if [ ! -f "$MARKER" ] || [ "$(cat "$MARKER" 2>/dev/null)" != "$NEW_HASH" ]; then
            "$DOOM_DIR/bin/doom" sync || echo "warning: doom sync failed — run '$DOOM_DIR/bin/doom sync' manually" >&2
            echo "$NEW_HASH" > "$MARKER"
          fi
        '';
      })
    ];
  };
}
