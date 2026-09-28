# Nota: VM synnax-dev con Qtile (dev/stage para el desktop)

> Fecha: 2026-09-28 · Host: `synnax-dev` · Config: `~/nix`

VM de prueba/desarrollo para iterar config antes de aplicarla al desktop
(`synnax`). Corre Qtile en su versión más básica (X11), desde donde se irá
complicando la config.

## Contexto

- VM creada con **virt-manager** en `synnax` (libvirt/QEMU/KVM).
- Nombre en libvirt: `nixos-26.05-devenv` (IP `192.168.122.124`, red NAT default).
- NixOS instalado con el instalador gráfico: **SeaBIOS (BIOS)** → GRUB en
  `/dev/vda`, disco virtio, filesystem **ext4** (`/dev/vda1`).
- El firmware se detectó con `virsh dumpxml` (ausencia de `<loader>` UEFI).

## Estructura agregada al repo

```
modules/des/qtile.nix              # módulo: lightdm + qtile (configFile) + paquetes mínimos
modules/des/qtile/config.py        # config básica de Qtile (4 groups, MonadTall/Max, keys, bar)
hosts/synnax-dev/configuration.nix # host de la VM (GRUB /dev/vda, SSH, guest agent, home-manager)
hosts/synnax-dev/hardware-configuration.nix  # estática (qemu-guest, /dev/vda1 ext4)
flake.nix                          # + nixosConfigurations.synnax-dev
```

Particularidad: el módulo qtile de nixpkgs (unstable) ya **no usa
`extraConfig`**; ahora es `configFile` apuntando a un `.py`.

## Deploy

### Primer deploy (desde la VM)

La VM no tenía SSH; la config nueva lo habilita. Dentro de la VM:

```bash
git clone git@github.com:fcosanabria/dotfiles.git ~/nix && cd ~/nix
sudo nixos-rebuild switch --flake .#synnax-dev
```

### Deploys siguientes (desde el desktop)

```bash
cd ~/nix
sudo nixos-rebuild switch --flake .#synnax-dev \
  --target-host fsanabria@192.168.122.124 \
  --elevate=sudo --ask-elevate-password
```

- `--elevate=sudo` es el reemplazo de `--use-remote-sudo` (deprecated).
- `--ask-elevate-password` pide la password de `fsanabria` de la VM para el
  sudo remoto (el SSH por llave no alcanza: `nix-env` en la VM requiere root).
- La llave pública del desktop (`~/.ssh/id_ed25519.pub`) está autorizada para
  `fsanabria` en la VM.

## Qtile básico (config.py)

- Terminal: `ghostty` · Launcher: `rofi -show drun` (`mod+d`)
- Layouts: `MonadTall` + `Max` · 4 grupos · barra con GroupBox/Clock/Systray
- Mod = Super. Atajos: `mod+Enter` terminal, `mod+j/k/h/l` foco,
  `mod+space` layout, `mod+w` cerrar, `mod+Ctrl+r` reload, `mod+Ctrl+q` salir.

## Notas / pendientes

- Si el instalador creó swapfile (`/var/swapfile`), descomentar `swapDevices`
  en `hosts/synnax-dev/hardware-configuration.nix`.
- La VM no tiene home-manager completo: solo fish, ghostty, git, starship
  (mínimo + dotfiles esenciales).
- Sin `modules/system` (sin tailscale, syncthing, flatpak, etc.) — VM mínima.
- Para ver la IP si cambia: `virsh -c qemu:///system domifaddr nixos-26.05-devenv`.

## Checklist rápida

```bash
# ¿La VM corre?
virsh -c qemu:///system list --all

# ¿Evalúa el host nuevo?
nix eval .#nixosConfigurations.synnax-dev.config.system.build.toplevel.drvPath

# Deploy remoto (desde ~/nix)
sudo nixos-rebuild switch --flake .#synnax-dev --target-host fsanabria@192.168.122.124 --elevate=sudo --ask-elevate-password
```