{ pkgs, ... }:

{
  # ── PC/SC Smart Card Daemon ──────────────────────────────────────────
  # Required for YubiKey OpenPGP smartcard communication.
  # Without pcscd, ykman/gpg report "PC/SC not available".
  services.pcscd.enable = true;

  # ── udev rules for YubiKey ────────────────────────────────────────────
  # yubikey-personalization: sets ID_SECURITY_TOKEN for ACLs.
  # Custom rule: grant pcscd group rw access to the USB device node,
  # so pcscd (running as user pcscd) can open the CCID interface.
  services.udev.packages = [ pkgs.yubikey-personalization ];
  services.udev.extraRules = ''
    # YubiKey: allow pcscd group to access the USB device for CCID
    ATTRS{idVendor}=="1050", GROUP="pcscd", MODE="0660"
  '';

  # ── Disable system ssh-agent ──────────────────────────────────────────
  # gpg-agent handles SSH via enableSSHSupport (configured in home-manager).
  # Running both causes SSH_AUTH_SOCK conflicts.
  programs.ssh.startAgent = false;

  # ── GnuPG + pinentry packages ─────────────────────────────────────────
  # gnupg: GPG binaries (gpg, gpg-agent, scdaemon, gpgconf)
  # pinentry-curses: fallback for TTY-only sessions (writing-deck, SSH)
  # pinentry-gtk2: for XFCE (no native GNOME/KDE dialog)
  # pinentry-gnome3: for GNOME (native dialog integration)
  environment.systemPackages = with pkgs; [
    gnupg
    pinentry-curses
    pinentry-gtk2
    pinentry-gnome3
  ];
}
