{
  # Flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Deduplicación del store (hard-links)
  nix.settings.auto-optimise-store = true;

  # Garbage Collector automático
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}
