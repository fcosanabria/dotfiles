{ ... }:

{
  # Serein (cliente nativo de Discord) desde su repo flatpak propio.
  # Equivalente a: flatpak install --user <serein.flatpakref>
  services.flatpak = {
    enable = true;
    remotes = [
      {
        name = "serein";
        location = "https://viceverse-cz.github.io/Serein/flatpak/repo";
      }
    ];
    packages = [
      {
        appId = "cz.viceverse.serein";
        origin = "serein";
      }
    ];
  };
}