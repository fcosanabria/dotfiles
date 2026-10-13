{ lib, ... }:

let
  entries = builtins.attrNames (builtins.readDir ./.);
  # Archivos .nix del directorio + subdirectorios con default.nix (ej. services/)
  importable = f:
    f != "default.nix"
    && (lib.hasSuffix ".nix" f || builtins.pathExists (./. + "/${f}/default.nix"));
in
{
  # Agregador: importa automáticamente todos los .nix del directorio y los
  # subdirectorios que contengan un default.nix.
  imports = builtins.map (f: ./. + "/${f}") (builtins.filter importable entries);
}
