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
