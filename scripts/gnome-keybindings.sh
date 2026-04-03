#!/bin/bash
set -euo pipefail

# Only run on GNOME
if [[ "${XDG_CURRENT_DESKTOP:-}" != *"GNOME"* ]]; then
    echo "Skipping GNOME keybindings (not a GNOME session)."
    exit 0
fi

# Super+1-4 → switch to workspace 1-4
# Shift+Super+1-4 → move window to workspace 1-4
for i in 1 2 3 4; do
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Super>$i']"
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$i "['<Super><Shift>$i']"
done

echo "GNOME workspace keybindings applied."
