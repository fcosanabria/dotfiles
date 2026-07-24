{ inputs, ... }:

{
  home-manager.sharedModules = [ inputs.lazyvim-nix.homeManagerModules.default ];

  home-manager.users.fsanabria = {
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
  };
}
