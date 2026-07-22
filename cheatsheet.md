# Cheatsheet de mantenimiento NixOS (flakes)

Config en `~/nix`. Hosts disponibles: `synnax` (desktop), `zbook` (laptop), `writing-deck`.
home-manager está integrado como módulo de NixOS, así que `nixos-rebuild` reconstruye sistema **y** home a la vez.

## Actualizar el sistema

```bash
cd ~/nix
nix flake update                                  # actualiza inputs (flake.lock)
sudo nixos-rebuild switch --flake .#synnax        # reconstruye y aplica
```

## Reconstruir / aplicar config

```bash
sudo nixos-rebuild switch --flake ~/nix#synnax    # aplica ahora y en arranque
sudo nixos-rebuild boot   --flake ~/nix#synnax    # aplica en próximo arranque
sudo nixos-rebuild test   --flake ~/nix#synnax    # aplica ahora, NO persiste en boot
nixos-rebuild build       --flake ~/nix#synnax    # solo compila, no activa
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
nix flake check ~/nix            # valida el flake (errores de eval)
nix flake show ~/nix             # muestra outputs (hosts, etc.)
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
