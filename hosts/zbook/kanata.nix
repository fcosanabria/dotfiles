{
  # Kanata: remapeo de teclas (caps -> esc/nav, acentos españoles).
  # Exclusivo de zbook — el desktop (synnax) no lo usa.
  services.kanata = {
    enable = true;
    keyboards.default = {
      extraDefCfg = "process-unmapped-keys yes";
      config = ''
        (defsrc
          caps h j k l spc m lmet lalt ralt lsft rsft
          t    r w a   s c   v n   x e i o u
        )

        (defalias
          cap (tap-hold 100 200 esc (layer-while-held nav))
          spa (layer-while-held spanish)

          a-acc (fork (unicode á) (unicode Á) (lsft rsft))
          e-acc (fork (unicode é) (unicode É) (lsft rsft))
          i-acc (fork (unicode í) (unicode Í) (lsft rsft))
          o-acc (fork (unicode ó) (unicode Ó) (lsft rsft))
          u-acc (fork (unicode ú) (unicode Ú) (lsft rsft))
          n-acc (fork (unicode ñ) (unicode Ñ) (lsft rsft))
        )

        (deflayer base
          @cap h j k l spc m lalt lmet @spa _    _
          t    r w a   s c   v n   x e i o u
        )

        (deflayer nav
          _    left down up right bspc ret _    _    _    _    _
          C-t  C-r C-w C-a C-s C-c C-v C-n C-x e i o u
        )

        (deflayer spanish
          _    _    _    _    _    _    _    _    _    _    _    _
          _    _    _    @a-acc _    _    _    @n-acc _ @e-acc @i-acc @o-acc @u-acc
        )
      '';
    };
  };
}
