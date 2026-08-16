{ inputs, ... }:

{
  # Patch lazy.nvim to skip helptags generation on read-only /nix/store paths.
  # Without this, lazy.nvim's plugin.docs task tries to write doc/tags into
  # the store (E152) for every dev plugin managed by lazyvim-nix.
  nixpkgs.overlays = [
    (final: prev: {
      vimPlugins = prev.vimPlugins // {
        lazy-nvim = prev.vimPlugins.lazy-nvim.overrideAttrs (old: {
          patches = (old.patches or []) ++ [ ./nvim/patches/lazy-nvim-no-helptags.patch ];
        });
        vim_tmux_navigator = prev.vimPlugins.vim-tmux-navigator;
        line-numbers-nvim = prev.vimUtils.buildVimPlugin {
          pname = "line-numbers.nvim";
          version = "2024-01-01";
          src = prev.fetchFromGitHub {
            owner = "shrynx";
            repo = "line-numbers.nvim";
            rev = "main";
            sha256 = "sha256-I/S8EnXTC+y+utzUMoqVDDpk7JT9zfuXKsKBAJzcIgo=";
          };
        };
      };
    })
  ];

  home-manager.sharedModules = [ inputs.lazyvim-nix.homeManagerModules.default ];

  home-manager.users.fsanabria = { lib, ... }: {
    programs.lazyvim = {
      enable = true;
      installCoreDependencies = true;
      configFiles = ./nvim;

      extras = {
        dap.core.enable = true;
        lang.json.enable = true;
        lang.markdown.enable = true;
        lang.nix.enable = true;
        lang.python = {
          enable = true;
          installDependencies = true;
        };
        lang.toml.enable = true;
        lang.yaml.enable = true;
      };
    };

    home.activation.cleanupNvimState = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      $DRY_RUN_CMD rm -f $VERBOSE_ARG $HOME/.config/nvim/lazyvim.json
      $DRY_RUN_CMD rm -f $VERBOSE_ARG $HOME/.config/nvim/lazy-lock.json
    '';
  };
}
