{ pkgs, ... }:

{
  # ── PC/SC Smart Card Daemon ──────────────────────────────────────────
  # Required for YubiKey OpenPGP smartcard communication.
  # Without pcscd, ykman/gpg report "PC/SC not available".
  services.pcscd.enable = true;

  # ── udev rules for YubiKey ────────────────────────────────────────────
  # Allows non-root access to the YubiKey for ykman and gpg.
  services.udev.packages = [ pkgs.yubikey-personalization ];

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
