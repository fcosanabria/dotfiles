# My never ending dotfiles

Configuración de NixOS declarativa (flakes + home-manager).

## Hosts

| Host          | Equipo              | Desktop          |
|---------------|---------------------|------------------|
| `synnax`      | Desktop principal   | COSMIC           |
| `zbook`       | Laptop              | XFCE             |
| `synnax-dev`  | VM de prueba (qtile)| Qtile (básico)   |

Estructura: `hosts/` (config por máquina), `modules/base.nix` (compartido),
`modules/des/` (desktops), `modules/home/` (home-manager), `modules/system/`
(servicios y paquetes). Ver `cheatsheet.md` para comandos de mantenimiento.

En este momento estoy usando NixOS como mi OS principal, en ambos desktop y laptop. Desde hace mucho tiempo tenia muchas ganas de probar NixOS, pero por algun motivo, siempre tenia prisa, y nunca le di la oportunidad de poder manejar mis pequenas configuraciones de manera declarativa, apesar de que ya estaba documentando mis dotfiles desde hace muchos annos. Y como precisamente esas pequenas configuraciones o apliaciones, me hacian "perder" el tiempo en Nix, entonces siempre lo evitaba. Honestamente gracias a los AI agents, esto ha cambiado, por que me ha hecho tener un setup entendible, y efectivo. Y ahora, siento que he llegado al peak de mis dotfiles y otras configuraciones.