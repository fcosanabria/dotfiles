#!/bin/bash

echo "---------------- Installing Flatpak Apps --------------------"
flatpak install -y flathub com.discordapp.Discord
flatpak install -y flathub com.spotify.Client
flatpak install -y flathub com.valvesoftware.Steam
flatpak install -y flathub org.fedoraproject.MediaWriter
flatpak install -y flathub de.haeckerfelix.Fragments
flatpak install -y flathub org.gnome.SoundRecorder
flatpak install -y flathub com.obsproject.Studio
flatpak install -y flathub com.orama_interactive.Pixelorama
flatpak install -y flathub org.darktable.Darktable
flatpak install -y flathub org.flameshot.Flameshot
flatpak install -y flathub com.bitwarden.desktop
flatpak install -y flathub com.github.tchx84.Flatseal
flatpak install -y flathub org.zotero.Zotero
flatpak install -y flathub org.gustavoperedo.FontDownloader
flatpak install flathub org.flameshot.Flameshot

echo "---------------- Installing Snaps Apps --------------------"

sudo snap install code ----classic
