{ pkgs, lib, ... }:

{
  home-manager.users.fsanabria = { config, ... }: {

    # ── GPG ──────────────────────────────────────────────────────────────
    programs.gpg = {
      enable = true;

      # scdaemon: let pcscd handle smartcard communication.
      # Without disable-ccid, scdaemon and pcscd fight over the YubiKey.
      scdaemonSettings = {
        disable-ccid = true;
      };

      settings = {
        personal-cipher-preferences = "AES256 AES192 AES";
        personal-digest-preferences = "SHA512 SHA384 SHA256";
        personal-compress-preferences = "ZLIB BZIP2 ZIP Uncompressed";
        default-preference-list = "SHA512 SHA384 SHA256 AES256 AES192 AES ZLIB BZIP2 ZIP Uncompressed";
        cert-digest-algo = "SHA512";
        s2k-digest-algo = "SHA512";
        s2k-cipher-algo = "AES256";
        charset = "utf-8";
        fixed-list-mode = true;
        no-comments = true;
        no-emit-version = true;
        keyid-format = "0xlong";
        with-fingerprint = true;
        require-cross-certification = true;
        no-symkey-cache = true;
        use-agent = true;
      };
    };

    # ── GPG Agent ────────────────────────────────────────────────────────
    services.gpg-agent = {
      enable = true;

      # Cache TTL: short for security, long enough for workflows
      defaultCacheTtl = 300;       # 5 min
      defaultCacheTtlSsh = 300;    # 5 min
      maxCacheTtl = 900;           # 15 min
      maxCacheTtlSsh = 900;        # 15 min

      # Default: pinentry-curses (works in TTY).
      # Overridden per-DE via mkForce in modules/home/{gnome,xfce}.nix
      pinentry.package = lib.mkDefault pkgs.pinentry-curses;

      # SSH keys via GPG agent (YubiKey auth subkey)
      enableSshSupport = true;
    };

    # GPG_TTY and SSH_AUTH_SOCK are set in fish.nix shellInit
    # because fish doesn't support POSIX $(cmd) syntax in sessionVariables.

    # ── Pass (Password Store) ────────────────────────────────────────────
    programs.password-store = {
      enable = true;
      package = pkgs.pass.withExtensions (exts: [
        exts.pass-otp       # TOTP support (pass otp ...)
        exts.pass-import    # Import from Bitwarden/other managers
        exts.pass-audit     # Audit passwords against haveibeenpwned
        exts.pass-update    # Batch update passwords
      ]);
      settings = {
        PASSWORD_STORE_DIR = "${config.home.homeDirectory}/.password-store";
        PASSWORD_STORE_CLIP_TIME = "45";
        PASSWORD_STORE_GENERATED_LENGTH = "32";
      };
    };
  };
}
