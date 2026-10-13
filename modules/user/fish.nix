{ pkgs, ... }:

{
  # Fish shell (módulo nativo de NixOS, system-wide).
  programs.fish.enable = true;

  programs.fish.shellAliases = {
    # eza replacements
    ls = "eza -al --color=always --group-directories-first --icons";
    la = "eza -a --color=always --group-directories-first --icons";
    ll = "eza -la --color=always --group-directories-first --icons";
    lt = "eza -aT --color=always --group-directories-first --icons";

    grep = "grep --color=auto";
    fgrep = "fgrep --color=auto";
    egrep = "egrep --color=auto";
    cat = "bat";
    cd = "z";

    # Quick directories
    nn = "cd ~/nix/";
    homelab = "cd ~/git/homelab/";
    notes = "cd ~/vault/";
    repos = "cd ~/git/";
  };

  programs.fish.shellFunctions = {
    unzip-there = {
      modifiers.description = "Extract zip file into a directory named after the archive";
      body = ''
        if test (count $argv) -eq 0
            echo "Usage: unzip-there <archive.zip>"
            return 1
        end

        set -l zipfile $argv[1]

        if not test -f "$zipfile"
            echo "Error: File '$zipfile' does not exist"
            return 1
        end

        if not string match -q "*.zip" "$zipfile"
            echo "Error: File must have .zip extension"
            return 1
        end

        set -l dirname (basename -s .zip "$zipfile")

        if mkdir "$dirname"
            echo "Extracting to: $dirname/"
            unzip -d "$dirname" -qqnXK "$zipfile"
            echo "Done!"
        else
            echo "Error: Directory '$dirname' already exists. Skipping extraction to avoid conflicts."
            return 1
        end
      '';
    };
  };

  programs.fish.interactiveShellInit = ''
    # Environment
    set -gx EDITOR nvim

    # PATH additions
    if test -d ~/.local/bin
        if not contains -- ~/.local/bin $PATH
            set -p PATH ~/.local/bin
        end
    end

    # npm global prefix (NixOS workaround)
    if test -d ~/.npm-global/bin
        if not contains -- ~/.npm-global/bin $PATH
            set -p PATH ~/.npm-global/bin
        end
    end
  '';

  # Integraciones nativas de NixOS: añaden su init a fish automáticamente.
  # (starship se configura en modules/user/starship.nix)
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.atuin = {
    enable = true;
    enableFishIntegration = true;
  };
}
