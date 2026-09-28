# Qtile Roadmap — de WM básico a "desktop environment" potente

> Host: `synnax-dev` (VM). Estado al 2026-09-28. Módulo: `modules/des/qtile.nix`
> + config en `modules/des/qtile/config.py`.

## ✅ Hecho

- [x] Barra: workspaces + prompt (izq), nombre de ventana centrado, fecha (`28 Sept`) + hora (`AM/PM`) + systray (der)
- [x] Barra estilo XFCE: fondo `#383c4a`, separadores entre secciones
- [x] Layouts: `MonadTall` + `Max`
- [x] Terminal: alacritty (tema oxocarbon, Berkeley Mono 14)
- [x] Launcher: rofi (`mod+d`)
- [x] File manager: thunar + volman + archive plugin + tumbler (`mod+e`)
- [x] Previewers: ristretto (imágenes, `mod+r`), zathura (PDF)
- [x] Archivos comprimidos: xarchiver + unzip/zip/p7zip (`mod+z`)
- [x] Samba/GVFS: shares en Thunar, cifs-utils
- [x] Audio: pavucontrol, pamixer; Red: nm-applet; Bluetooth: blueman
- [x] Polkit agent, picom (compositor), udiskie (auto-mount USB)
- [x] Autostart: nm-applet + polkit agent + picom
- [x] Widget Pomodoro (trabajo/descanso con colores oxocarbon)
- [x] Calendario en el clock (widget Calendar de qtile-extras, click → popup)
- [x] Notificaciones: xfce4-notifyd (las mismas de XFCE)
- [x] Clipboard manager: xfce4-clipman (tray, el mismo de XFCE)
- [x] Power en la barra: widget QuickExit (⏻ → shutdown/reboot/logout/lock/suspend)
- [x] PulseVolume en la barra (scroll para volumen)
- [x] Screen locker: slock (`mod+ctrl+l`) + lock en QuickExit

## 🔲 Pendiente — Barra y widgets

- [ ] Widgets extra: CPU, RAM, red (conexión/velocidad), batería (si aplica)
- [ ] Botón de power (logout/lock/suspend) en la barra o en rofi

## 🔲 Pendiente — Sesión y seguridad

- [ ] Screen locker: `xscreensaver` o `slock` (mod+ctrl+l)
- [ ] Idle: `xss-lock` + `xset` (bloquear tras N min)
- [ ] Sesión X: `dex` o `~/.config/autostart` para apps del usuario
- [ ] Keyring: `gnome-keyring` + libsecret (Wi-Fi, SSH, GPG)
- [ ] `setxkbmap`/`xkbset`: compose key (`compose:rwin` como en el resto de hosts)

## 🔲 Pendiente — Apps de productividad

- [ ] Editor: nvim (ya en home-manager) — falta verificar integración
- [ ] Visor de PDF alternativo: `okular` o `mupdf`
- [ ] Notas rápidas: `xpad` (sticky notes) o mantener siyuan
- [ ] Calculadora: `qalculate-gtk`
- [ ] Screenshot: `maim` + `xclip` (`mod+shift+s` → región → clipboard/archivo)
- [ ] Grabación de pantalla: `ffmpeg` + `x11grab` (maim/ffmpeg script)
- [ ] Torrents: `transmission-gtk`
- [ ] Calendario/email: thunderbird (ya en packages.nix global)

## 🔲 Pendiente — Tema y look & feel

- [ ] GTK theme: `adw-gtk3-dark` + Adwaita icons + `gtk-3.0/settings.ini` (vía home-manager)
- [ ] Cursor: Adwaita 24 (vía home-manager `home.pointerCursor`)
- [ ] Fondos de pantalla: `feh` o `hsetroot` + `nitrogen` (selector GUI)
- [ ] Picom: config con blur, redondeo y opacidad (asemejar COSMIC/KDE)
- [ ] Fuente UI en widgets de qtile: Berkeley Mono (hoy usa `sans`)
- [ ] Rofi theme: `teide-dark` (ya existe en `modules/home/sway.nix` → reusar)

## 🔲 Pendiente — Archivos y red

- [ ] Monteo automático de SMB: entradas `fileSystems` por share del NAS
- [ ] `nemo` o `pcmanfm` como alternativa a thunar (prueba A/B)
- [ ] Navegador de archivos por terminal: `yazi` / `nnn` / `ranger`
- [ ] Descargas: `aria2` + integración con rofi

## 🔲 Pendiente — Dev / power user

- [ ] `dex` para autostart XDG
- [ ] Monitor de sistema en barra: `qtile.widget.SystemTray` + `btop` en terminal
- [ ] Hotkeys de brillo/volumen con OSD: `avizo` no es Wayland-only, probar `volumeicon`
- [ ] Gestor de energía: `xfce4-power-manager` (batería, brillo, suspender)
- [ ] `nmcli` alias + widgets de red en barra

## 🔲 Pendiente — Servicios del sistema (VM)

- [ ] `services.openssh` ya activo — evaluar firewall
- [ ] Tailscale en la VM (si se quiere acceso desde fuera de libvirt NAT)
- [ ] Syncthing si se quiere sincronizar configs entre hosts
- [ ] Aumentar RAM/vCPUs de la VM en virt-manager si la carga lo pide

---

## Prioridad sugerida (próximos 3 pasos)

1. **Tema completo**: GTK + cursor + picom config + rofi theme → se siente "fino" de una
2. **Sesión**: screenshots (maim), screen locker, notifications (dunst), power menu
3. **Barra rica**: CPU/RAM/red widgets + clipboard manager