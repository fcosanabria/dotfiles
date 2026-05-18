{ pkgs, ... }:

{
  home-manager.users.fsanabria = {
    home.packages = with pkgs; [
      (emacs29.pkgs.withPackages (
        epkgs: with epkgs; [
          vterm
          treesit
        ]
      ))
    ];

    home.activation.installDoomEmacs = pkgs.lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      if [ ! -d "$HOME/.config/emacs" ]; then
        git clone --depth 1 https://github.com/doomemacs/doomemacs "$HOME/.config/emacs"
      fi
      if [ ! -d "$HOME/.config/emacs/bin" ]; then
        echo "Doom Emacs already installed, skipping clone."
      fi
    '';
  };
}
