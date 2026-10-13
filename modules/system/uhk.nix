{ pkgs, ... }:

let
  # uhk-agent copies smart-macro docs from the Nix store into
  # ~/.config/uhk-agent/smart-macro-docs. Node's fs.cp preserves the store's
  # read-only modes (0444/0555), so the next launch fails with EACCES on
  # unlink and never opens the window. Fix perms before every start.
  # Upstream: https://github.com/NixOS/nixpkgs/issues/423634
  uhk-agent = pkgs.symlinkJoin {
    name = "uhk-agent";
    paths = [ pkgs.uhk-agent ];
    nativeBuildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram "$out/bin/uhk-agent" \
        --run 'docs="$HOME/.config/uhk-agent/smart-macro-docs"; if [ -d "$docs" ]; then chmod -R u+w "$docs" 2>/dev/null || true; fi'
    '';
  };
in
{
  # UHK (Ultimate Hacking Keyboard): reglas udev para acceso non-root al
  # firmware. Para flashear, el usuario debe estar en el grupo "input"
  # (se añade en hosts/synnax/default.nix).
  hardware.keyboard.uhk.enable = true;

  environment.systemPackages = [ uhk-agent ];
}
