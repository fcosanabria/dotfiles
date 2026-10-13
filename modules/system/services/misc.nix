{
  # Nix-LD (ejecutar binarios Linux estándar no parcheados)
  programs.nix-ld.enable = true;

  # Accounts daemon (persistencia de perfil de usuario)
  services.accounts-daemon.enable = true;
}
