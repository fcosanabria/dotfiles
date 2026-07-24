{ inputs, ... }:

{
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
