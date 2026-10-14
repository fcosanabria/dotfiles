{ ... }:

{
  # Config de kitty system-wide (/etc/xdg/kitty/kitty.conf). kitty la lee
  # vía XDG_CONFIG_DIRS; ~/.config/kitty/kitty.conf (si existe) la sobrescribe.
  environment.etc."xdg/kitty/kitty.conf".text = ''
    font_family Berkeley Mono
    font_size 12.5

    background_opacity 0.85
    background_blur 20
  '';
}
