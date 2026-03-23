# KMonad Config

Caps Lock as a Hyper layer for the built-in laptop keyboard.

## Mappings

| Input | Output |
|-------|--------|
| Caps Lock (tap) | Escape |
| Caps Lock (hold) | Hyper layer |
| Hyper + H | Left arrow |
| Hyper + J | Down arrow |
| Hyper + K | Up arrow |
| Hyper + L | Right arrow |
| Hyper + M | Return |
| Hyper + Space | Backspace |

> This is not a Hyper Key itself. It is just the way I called the layer.

## Setup

### 1. Install KMonad

Install via your package manager. 

> Using Aurora (Universal Blue) I prefer to use `rpm-ostree` to install it. 

### 2. Create the system service

```bash
sudo tee /etc/systemd/system/kmonad.service << 'EOF'
[Unit]
Description=KMonad keyboard remapper
After=systemd-udev-settle.service

[Service]
ExecStart=/usr/bin/kmonad /home/fsanabria/.config/kmonad/config.kbd
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
```

### 3. Enable and start the service

```bash
sudo systemctl enable --now kmonad.service
```

### 4. Verify it's running

```bash
sudo systemctl status kmonad.service
```

## Managing the service

```bash
# Start
sudo systemctl start kmonad.service

# Stop
sudo systemctl stop kmonad.service

# Restart (after config changes)
sudo systemctl restart kmonad.service

# View logs
journalctl -u kmonad.service -f
```
