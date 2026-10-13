# Cheatsheet de mantenimiento NixOS (flakes)

Config en `~/nix`. Hosts: `synnax` (desktop, COSMIC) y `zbook` (laptop, XFCE).
Sin home-manager: los dotfiles (git, fish, starship, tmux) viven en `modules/user/`
como módulos nativos de NixOS. nvim se gestiona a mano (ver `nvim-config.md`).

> El `hardware-configuration.nix` de cada host vive en `/etc/nixos/` (generado
> por máquina, fuera de git) y se importa por path absoluto. Los flakes evalúan
> en modo puro y prohíben leer fuera del tree: por eso **todo comando que
> evalúe la config necesita `--impure`**.

## Actualizar el sistema

```bash
cd ~/nix
nix flake update                                  # actualiza inputs (flake.lock)
sudo nixos-rebuild switch --flake .#synnax --impure   # reconstruye y aplica
```

## Reconstruir / aplicar config

```bash
sudo nixos-rebuild switch --flake ~/nix#synnax --impure  # aplica ahora y en arranque
sudo nixos-rebuild boot   --flake ~/nix#synnax --impure  # aplica en próximo arranque
sudo nixos-rebuild test   --flake ~/nix#synnax --impure  # aplica ahora, NO persiste en boot
nixos-rebuild build       --flake ~/nix#synnax --impure  # solo compila, no activa
```

## Actualizar inputs

```bash
nix flake update                                  # actualiza todos los inputs
nix flake update nixpkgs                           # actualiza solo un input
```

## Generaciones (rollback)

```bash
sudo nixos-rebuild switch --rollback                      # vuelve a la anterior
nixos-rebuild list-generations                            # lista generaciones
sudo nix-env --list-generations -p /nix/var/nix/profiles/system
# Para arrancar en una generación previa: elígela en el menú de GRUB/systemd-boot
```

## Limpieza (liberar espacio)

```bash
nix-collect-garbage -d                                    # borra basura (user)
sudo nix-collect-garbage -d                               # incluye generaciones del sistema
sudo nix-collect-garbage --delete-older-than 14d          # borra >14 días
sudo nix store gc                                         # GC del store
nix store optimise                                        # deduplica hard-links
```

## Diagnóstico / desarrollo

```bash
nix flake check ~/nix --impure   # valida el flake (errores de eval)
nix flake show ~/nix --impure    # muestra outputs (hosts, etc.)
nix repl                         # REPL para explorar
nix search nixpkgs <paquete>     # busca paquetes
nix shell nixpkgs#<paquete>      # shell temporal con un paquete
journalctl -b -p err             # errores del arranque actual
```

## Git (la config está versionada)

```bash
cd ~/nix && git status && git add -A && git commit -m "update"
```

> Con flakes, los archivos **no rastreados por git** se ignoran en el build.
> Recuerda hacer `git add` de los archivos nuevos antes de reconstruir.

## Instalación desde cero (fresh install)

El flake importa `/etc/nixos/hardware-configuration.nix` por **path absoluto**:
ese archivo debe existir en el entorno donde se evalúa (el instalador).

```bash
# 1. Bootear el ISO minimal, red arriba, preparar discos y montar.
#    synnax: NO tocar el ESP de Windows (nvme0n1p1, UUID 6243-2DC7);
#    formatear solo las particiones de NixOS (ext4 /, vfat /boot, swap).
mount /dev/<raiz> /mnt
mount /dev/<esp> /mnt/boot
swapon /dev/<swap>

# 2. Generar el hardware config (UUIDs nuevos) y hacerlo visible al flake:
nixos-generate-config --root /mnt
mkdir -p /etc/nixos                                        # en el instalador (tmpfs)
cp /mnt/etc/nixos/hardware-configuration.nix /etc/nixos/   # el flake lee ESTE path
# (el configuration.nix template que genera no se usa; se puede borrar)

# 3. Traer el repo CON .git (el flake exige archivos trackeados por git):
git clone <tu-remote> /mnt/root/nix    # o copiar por scp/USB incluyendo .git

# 4. Instalar:
nixos-install --flake /mnt/root/nix#synnax --impure

# 5. Rebootear sin el ISO. El usuario fsanabria ya viene declarado en
#    modules/core/users.nix. En el sistema instalado, /etc/nixos/... ya
#    existe → los rebuilds normales (con --impure) funcionan igual que aquí.
```

> En un fresh install **no hay inhibidores**: el sistema arranca directo en la
> config nueva (dbus-broker incluido). Los inhibidores (`dbus → broker`) solo
> saltan al migrar un sistema corriendo: ahí usa `nixos-rebuild boot` + reboot.
