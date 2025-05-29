[com/github/wwmm/easyeffects]
window-fullscreen=false
window-height=1049
window-maximized=false
window-width=1908

[com/github/wwmm/easyeffects/spectrum]
color=(1.0, 1.0, 1.0, 1.0)
color-axis-labels=(1.0, 1.0, 1.0, 1.0)

[com/github/wwmm/easyeffects/streaminputs]
input-device='auto_null'
plugins=['stereo_tools#0', 'rnnoise#0']

[com/github/wwmm/easyeffects/streaminputs/limiter/0]
sidechain-input-device='alsa_input.usb-Burr-Brown_from_TI_USB_Audio_CODEC-00.analog-stereo-input'

[com/github/wwmm/easyeffects/streaminputs/loudness/0]
output-gain=14.800000000000001
volume=3.0

[com/github/wwmm/easyeffects/streaminputs/rnnoise/0]
enable-vad=true
output-gain=5.0
vad-thres=52.0

[com/github/wwmm/easyeffects/streaminputs/stereotools/0]
mode='LR > L+R (Mono Sum L+R)'
output-gain=36.0

[com/github/wwmm/easyeffects/streamoutputs]
output-device='alsa_output.usb-Burr-Brown_from_TI_USB_Audio_CODEC-00.analog-stereo-output'

[com/mattjakeman/ExtensionManager]
height=1049
width=1908

[io/github/nokse22/minitext]
font-size=16

[org/gnome/Connections]
first-run=false

[org/gnome/Console]
custom-font='Berkeley Mono 15'
ignore-scrollback-limit=true
last-window-maximised=false
last-window-size=(1908, 1049)
use-system-font=false

[org/gnome/Extensions]
window-height=2107
window-width=3824

[org/gnome/Snapshot]
capture-mode='qr-detection'
is-maximized=false
window-height=2107
window-width=1908

[org/gnome/SoundRecorder]
audio-channel='stereo'
audio-profile='mp3'

[org/gnome/TextEditor]
highlight-current-line=true
show-line-numbers=true
show-map=false

[org/gnome/Weather]
window-height=422
window-maximized=false
window-width=513

[org/gnome/calendar]
active-view='month'
window-maximized=false
window-size=(1908, 2107)

[org/gnome/clocks]
world-clocks=[{'location': <(uint32 2, <('Minneapolis', 'KMSP', true, [(0.783357105556996, -1.6271510710263237)], [(0.78504848668181115, -1.627761011240018)])>)>}]

[org/gnome/clocks/state/window]
maximized=false
panel-id='world'
size=(870, 690)

[org/gnome/control-center]
last-panel='wifi'
window-state=(3824, 1049, false)

[org/gnome/desktop/a11y]
always-show-universal-access-status=false

[org/gnome/desktop/app-folders]
folder-children=['chrome-apps', 'wine', 'waydroid']

[org/gnome/desktop/app-folders/folders/05d69d51-667e-4be8-9a0e-d44aae65aced]
apps=['cachyos-hello.desktop', 'org.cachyos.KernelManager.desktop', 'cachyos-pi.desktop', 'octopi.desktop', 'octopi-cachecleaner.desktop', 'octopi-notifier.desktop', 'octopi-repoeditor.desktop', 'qv4l2.desktop', 'qvidcap.desktop', 'org.cachyos.scx-manager.desktop', 'btrfs-assistant.desktop']
name='CachyOS'
translate=false

[org/gnome/desktop/app-folders/folders/Pardus]
categories=['X-Pardus-Apps']
name='X-Pardus-Apps.directory'
translate=true

[org/gnome/desktop/app-folders/folders/System]
apps=['org.gnome.baobab.desktop', 'org.gnome.DiskUtility.desktop', 'org.gnome.Logs.desktop', 'org.freedesktop.MalcontentControl.desktop', 'org.gnome.tweaks.desktop', 'org.gnome.SystemMonitor.desktop', 'avahi-discover.desktop', 'bvnc.desktop', 'yelp.desktop', 'bssh.desktop', 'org.gnome.Tour.desktop', 'btop.desktop']
name='X-GNOME-Shell-System.directory'
translate=true

[org/gnome/desktop/app-folders/folders/Utilities]
apps=['org.gnome.Connections.desktop', 'org.gnome.Evince.desktop', 'org.gnome.FileRoller.desktop', 'org.gnome.font-viewer.desktop', 'org.gnome.Loupe.desktop', 'org.gnome.Snapshot.desktop']
name='X-GNOME-Shell-Utilities.directory'
translate=true

[org/gnome/desktop/app-folders/folders/YaST]
categories=['X-SuSE-YaST']
name='suse-yast.directory'
translate=true

[org/gnome/desktop/app-folders/folders/chrome-apps]
categories=['chrome-apps']
name='Chrome Apps'

[org/gnome/desktop/app-folders/folders/waydroid]
categories=['Waydroid', 'X-WayDroid-App']
name='Waydroid'

[org/gnome/desktop/app-folders/folders/wine]
categories=['Wine', 'X-Wine', 'Wine-Programs-Accessories']
name='Wine'

[org/gnome/desktop/background]
color-shading-type='solid'
picture-options='zoom'
picture-uri='file:///usr/share/backgrounds/gnome/geometrics-l.jxl'
picture-uri-dark='file:///usr/share/backgrounds/gnome/geometrics-d.jxl'
primary-color='#26a269'
secondary-color='#000000'

[org/gnome/desktop/break-reminders]
selected-breaks=@as []

[org/gnome/desktop/break-reminders/eyesight]
play-sound=true

[org/gnome/desktop/break-reminders/movement]
duration-seconds=uint32 300
interval-seconds=uint32 1800
play-sound=true

[org/gnome/desktop/calendar]
show-weekdate=true

[org/gnome/desktop/datetime]
automatic-timezone=true

[org/gnome/desktop/input-sources]
sources=[('xkb', 'us')]
xkb-options=['compose:ralt', 'lv3:switch']

[org/gnome/desktop/interface]
accent-color='blue'
clock-show-seconds=false
color-scheme='prefer-dark'
cursor-theme='Adwaita'
enable-animations=true
enable-hot-corners=false
font-antialiasing='grayscale'
font-hinting='slight'
gtk-enable-primary-paste=false
gtk-theme='Adwaita'
icon-theme='Adwaita'
text-scaling-factor=1.1499999999999999

[org/gnome/desktop/notifications]
application-children=['vesktop', 'org-gnome-console', 'org-gnome-software', 'zen', 'eu-betterbird-betterbird', 'espanso', 'tutanota-desktop', 'steam', 'gnome-power-panel', 'cider', 'com-stremio-stremio', 'gnome-wellbeing-panel', 'jetbrains-toolbox', 'org-gnome-connections', 'syncthing-gtk', 'org-gnome-extensions']

[org/gnome/desktop/notifications/application/cider]
application-id='cider.desktop'

[org/gnome/desktop/notifications/application/com-stremio-stremio]
application-id='com.stremio.stremio.desktop'

[org/gnome/desktop/notifications/application/espanso]
application-id='espanso.desktop'

[org/gnome/desktop/notifications/application/eu-betterbird-betterbird]
application-id='eu.betterbird.Betterbird.desktop'

[org/gnome/desktop/notifications/application/gnome-power-panel]
application-id='gnome-power-panel.desktop'

[org/gnome/desktop/notifications/application/gnome-wellbeing-panel]
application-id='gnome-wellbeing-panel.desktop'

[org/gnome/desktop/notifications/application/jetbrains-toolbox]
application-id='jetbrains-toolbox.desktop'

[org/gnome/desktop/notifications/application/org-gnome-connections]
application-id='org.gnome.Connections.desktop'

[org/gnome/desktop/notifications/application/org-gnome-console]
application-id='org.gnome.Console.desktop'

[org/gnome/desktop/notifications/application/org-gnome-extensions]
application-id='org.gnome.Extensions.desktop'

[org/gnome/desktop/notifications/application/org-gnome-software]
application-id='org.gnome.Software.desktop'

[org/gnome/desktop/notifications/application/steam]
application-id='steam.desktop'

[org/gnome/desktop/notifications/application/syncthing-gtk]
application-id='syncthing-gtk.desktop'

[org/gnome/desktop/notifications/application/tutanota-desktop]
application-id='tutanota-desktop.desktop'

[org/gnome/desktop/notifications/application/vesktop]
application-id='vesktop.desktop'

[org/gnome/desktop/notifications/application/zen]
application-id='zen.desktop'

[org/gnome/desktop/peripherals/keyboard]
delay=uint32 240
repeat-interval=uint32 30

[org/gnome/desktop/peripherals/mouse]
accel-profile='flat'

[org/gnome/desktop/peripherals/touchpad]
two-finger-scrolling-enabled=true

[org/gnome/desktop/screensaver]
color-shading-type='solid'
picture-options='zoom'
picture-uri='file:///usr/share/backgrounds/gnome/geometrics-l.jxl'
primary-color='#26a269'
secondary-color='#000000'

[org/gnome/desktop/search-providers]
sort-order=['org.gnome.Settings.desktop', 'org.gnome.Contacts.desktop', 'org.gnome.Nautilus.desktop']

[org/gnome/desktop/session]
idle-delay=uint32 0

[org/gnome/desktop/sound]
event-sounds=true
theme-name='__custom'

[org/gnome/desktop/wm/keybindings]
close=['<Super>q', '<Alt>F4']
maximize=@as []
minimize=['<Super>comma']
move-to-monitor-down=@as []
move-to-monitor-left=@as []
move-to-monitor-right=@as []
move-to-monitor-up=@as []
move-to-workspace-1=['<Shift><Control><Alt><Super>1']
move-to-workspace-2=['<Shift><Control><Alt><Super>2']
move-to-workspace-3=['<Shift><Control><Alt><Super>3']
move-to-workspace-4=['<Shift><Control><Alt><Super>4']
move-to-workspace-down=@as []
move-to-workspace-up=@as []
switch-to-workspace-1=['<Shift><Control><Alt><Super>q']
switch-to-workspace-2=['<Shift><Control><Alt><Super>w']
switch-to-workspace-3=['<Shift><Control><Alt><Super>e']
switch-to-workspace-4=['<Shift><Control><Alt><Super>r']
switch-to-workspace-down=['<Primary><Super>Down', '<Primary><Super>j']
switch-to-workspace-left=@as []
switch-to-workspace-right=@as []
switch-to-workspace-up=['<Primary><Super>Up', '<Primary><Super>k']
toggle-maximized=['<Super>m']
unmaximize=@as []

[org/gnome/desktop/wm/preferences]
action-double-click-titlebar='toggle-maximize'
action-middle-click-titlebar='none'
action-right-click-titlebar='menu'
button-layout='appmenu:minimize,close'
focus-mode='click'
num-workspaces=4

[org/gnome/epiphany]
ask-for-default=false
default-search-engine='DuckDuckGo'
homepage-url='homepage.fcosanabria.com'
search-engine-providers=[{'url': <'https://www.bing.com/search?q=%s'>, 'bang': <'!b'>, 'name': <'Bing'>}, {'url': <'https://duckduckgo.com/?q=%s&t=epiphany&kd=-1'>, 'bang': <'!ddg'>, 'name': <'DuckDuckGo'>}, {'url': <'https://www.google.com/search?q=%s'>, 'bang': <'!g'>, 'name': <'Google'>}]

[org/gnome/epiphany/state]
is-maximized=false
window-size=(3824, 2107)

[org/gnome/epiphany/web]
default-zoom-level=1.0
remember-passwords=false
use-gnome-fonts=true

[org/gnome/evince/default]
continuous=true
dual-page=false
dual-page-odd-left=false
enable-spellchecking=true
fullscreen=false
inverted-colors=false
show-sidebar=true
sidebar-page='thumbnails'
sidebar-size=132
sizing-mode='automatic'
window-ratio=(3.1176470588235294, 1.3244949494949494)

[org/gnome/evolution-data-server]
migrated=true

[org/gnome/file-roller/listing]
list-mode='as-folder'
name-column-width=400
show-path=false
sort-method='name'
sort-type='ascending'

[org/gnome/file-roller/ui]
sidebar-width=200
window-height=520
window-width=950

[org/gnome/gedit/state/window]
bottom-panel-size=140
height=1002
maximized=false
side-panel-active-page='GeditWindowDocumentsPanel'
side-panel-size=200
width=1908

[org/gnome/gnome-screenshot]
delay=0
include-pointer=true
last-save-directory='file:///home/fcosanabria/Pictures'

[org/gnome/gnome-system-monitor]
cpu-colors=[(uint32 0, '#e01b24'), (1, '#ff7800'), (2, '#f6d32d'), (3, '#33d17a'), (4, '#26a269'), (5, '#62a0ea'), (6, '#1c71d8'), (7, '#613583'), (8, '#9141ac'), (9, '#c061cb'), (10, '#ffbe6f'), (11, '#f9f06b'), (12, '#8ff0a4'), (13, '#2ec27e'), (14, '#1a5fb4'), (15, '#c061cb'), (16, '#7999f332aab5'), (17, '#f332873a7999'), (18, '#79998f73f332'), (19, '#b2eef3327999'), (20, '#f3327999d66a'), (21, '#7999f332ec7e'), (22, '#f332c9037999'), (23, '#a5887999f332'), (24, '#7999f332820c'), (25, '#f332799994a0'), (26, '#7999b81cf332'), (27, '#db97f3327999'), (28, '#e7517999f332'), (29, '#7999f332c3d6'), (30, '#f332a05b7999'), (31, '#7cdf7999f332')]
current-tab='processes'
maximized=false
show-dependencies=false
show-whose-processes='user'
window-height=2107
window-width=1908

[org/gnome/gnome-system-monitor/proctree]
col-26-visible=false
col-26-width=0
columns-order=[0, 12, 1, 2, 3, 4, 6, 7, 8, 9, 10, 11, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26]
sort-col=15
sort-order=0

[org/gnome/mutter]
dynamic-workspaces=false
edge-tiling=false
experimental-features=@as []
workspaces-only-on-primary=true

[org/gnome/mutter/keybindings]
toggle-tiled-left=@as []
toggle-tiled-right=@as []

[org/gnome/mutter/wayland/keybindings]
restore-shortcuts=@as []

[org/gnome/nautilus/preferences]
default-folder-viewer='icon-view'
migrated-gtk-settings=true
search-filter-time-type='last_modified'

[org/gnome/nautilus/window-state]
initial-size=(950, 1049)
initial-size-file-chooser=(890, 550)

[org/gnome/nm-applet/eap/e7d5de65-7872-4ece-90df-20f343697ab6]
ignore-ca-cert=false
ignore-phase2-ca-cert=false

[org/gnome/portal/filechooser/bitwarden]
last-folder-path='/home/fcosanabria/Downloads'

[org/gnome/portal/filechooser/brave-browser]
last-folder-path='/home/fcosanabria/Downloads'

[org/gnome/portal/filechooser/org.geany.Geany]
last-folder-path='/home/fcosanabria/Downloads'

[org/gnome/portal/filechooser/org.raspberrypi.rpi-imager]
last-folder-path='/home/fcosanabria/Downloads'

[org/gnome/portal/filechooser/siyuan-note]
last-folder-path='/home/fcosanabria/SiYuan'

[org/gnome/portal/filechooser/tutanota-desktop]
last-folder-path='/home/fcosanabria/Downloads'

[org/gnome/portal/filechooser/vesktop]
last-folder-path='/home/fcosanabria/Downloads'

[org/gnome/power-manager]
info-history-type='charge'
info-stats-type='discharge-accuracy'

[org/gnome/settings-daemon/plugins/color]
night-light-enabled=false
night-light-schedule-automatic=false

[org/gnome/settings-daemon/plugins/media-keys]
email=['<Super>e']
home=['<Super>f']
rotate-video-lock-static=@as []
screensaver=['<Super>Escape']
terminal=['<Super>t']
www=['<Super>b']

[org/gnome/settings-daemon/plugins/power]
sleep-inactive-ac-timeout=3600
sleep-inactive-ac-type='suspend'

[org/gnome/shell]
app-picker-layout=[{'com.jeffser.Alpaca.desktop': <{'position': <0>}>, 'ardour8.desktop': <{'position': <1>}>, 'org.gnome.Decibels.desktop': <{'position': <2>}>, 'bssh.desktop': <{'position': <3>}>, 'bvnc.desktop': <{'position': <4>}>, 'avahi-discover.desktop': <{'position': <5>}>, 'eu.betterbird.Betterbird.desktop': <{'position': <6>}>, 'Blasphemous.desktop': <{'position': <7>}>, 'blender.desktop': <{'position': <8>}>, 'brave-browser.desktop': <{'position': <9>}>, 'com.usebruno.Bruno.desktop': <{'position': <10>}>, 'btop.desktop': <{'position': <11>}>, 'btrfs-assistant.desktop': <{'position': <12>}>, 'cachyos-hello.desktop': <{'position': <13>}>, 'org.cachyos.KernelManager.desktop': <{'position': <14>}>, 'cachyos-pi.desktop': <{'position': <15>}>, 'calf.desktop': <{'position': <16>}>, 'org.gnome.Snapshot.desktop': <{'position': <17>}>, 'org.gnome.Characters.desktop': <{'position': <18>}>, 'cider.desktop': <{'position': <19>}>, 'org.gnome.clocks.desktop': <{'position': <20>}>, 'cmake-gui.desktop': <{'position': <21>}>, 'org.gnome.Connections.desktop': <{'position': <22>}>, 'org.gnome.Console.desktop': <{'position': <23>}>}, {'org.gnome.Contacts.desktop': <{'position': <0>}>, 'org.gnome.baobab.desktop': <{'position': <1>}>, 'org.gnome.DiskUtility.desktop': <{'position': <2>}>, 'org.gnome.SimpleScan.desktop': <{'position': <3>}>, 'org.gnome.Evince.desktop': <{'position': <4>}>, 'com.github.wwmm.easyeffects.desktop': <{'position': <5>}>, 'electron34.desktop': <{'position': <6>}>, 'electron35.desktop': <{'position': <7>}>, 'espanso.desktop': <{'position': <8>}>, 'com.mattjakeman.ExtensionManager.desktop': <{'position': <9>}>, 'org.gnome.Extensions.desktop': <{'position': <10>}>, 'org.gnome.eog.desktop': <{'position': <11>}>, 'org.gnome.FileRoller.desktop': <{'position': <12>}>, 'filezilla.desktop': <{'position': <13>}>, 'fish.desktop': <{'position': <14>}>, 'com.github.johnfactotum.Foliate.desktop': <{'position': <15>}>, 'org.gnome.font-viewer.desktop': <{'position': <16>}>, 'org.geany.Geany.desktop': <{'position': <17>}>, 'gimp.desktop': <{'position': <18>}>, 'io.github.benjamimgois.goverlay.desktop': <{'position': <19>}>, 'lstopo.desktop': <{'position': <20>}>, 'yelp.desktop': <{'position': <21>}>, 'heroic.desktop': <{'position': <22>}>, 'org.gnome.Loupe.desktop': <{'position': <23>}>}, {'jetbrains-toolbox.desktop': <{'position': <0>}>, 'org.kde.kate.desktop': <{'position': <1>}>, 'info.febvre.Komikku.desktop': <{'position': <2>}>, 'org.kde.kwrite.desktop': <{'position': <3>}>, 'libreoffice-startcenter.desktop': <{'position': <4>}>, 'libreoffice-base.desktop': <{'position': <5>}>, 'libreoffice-calc.desktop': <{'position': <6>}>, 'libreoffice-draw.desktop': <{'position': <7>}>, 'libreoffice-impress.desktop': <{'position': <8>}>, 'libreoffice-math.desktop': <{'position': <9>}>, 'libreoffice-writer.desktop': <{'position': <10>}>, 'librewolf.desktop': <{'position': <11>}>, 'org.gnome.Logs.desktop': <{'position': <12>}>, 'org.gnome.Lollypop.desktop': <{'position': <13>}>, 'net.lutris.Lutris.desktop': <{'position': <14>}>, 'org.gnome.Maps.desktop': <{'position': <15>}>, 'org.gnome.Meld.desktop': <{'position': <16>}>, 'io.github.nokse22.minitext.desktop': <{'position': <17>}>, 'mpv.desktop': <{'position': <18>}>, 'org.gnome.Music.desktop': <{'position': <19>}>, 'nvim.desktop': <{'position': <20>}>, 'gnome-nettool.desktop': <{'position': <21>}>, 'nvidia-settings.desktop': <{'position': <22>}>, 'com.obsproject.Studio.desktop': <{'position': <23>}>}, {'octopi.desktop': <{'position': <0>}>, 'octopi-cachecleaner.desktop': <{'position': <1>}>, 'octopi-notifier.desktop': <{'position': <2>}>, 'octopi-repoeditor.desktop': <{'position': <3>}>, 'org.freedesktop.MalcontentControl.desktop': <{'position': <4>}>, 'org.freedesktop.Piper.desktop': <{'position': <5>}>, 'org.gnome.PowerStats.desktop': <{'position': <6>}>, 'protontricks.desktop': <{'position': <7>}>, 'jetbrains-pycharm-f9de0bf1-703f-4eb3-a7f1-36c7f524b76c.desktop': <{'position': <8>}>, 'qv4l2.desktop': <{'position': <9>}>, 'qvidcap.desktop': <{'position': <10>}>, 'org.qutebrowser.qutebrowser.desktop': <{'position': <11>}>, 'Rauniot.desktop': <{'position': <12>}>, 'Red Dead Redemption 2.desktop': <{'position': <13>}>, 'page.tesk.Refine.desktop': <{'position': <14>}>, 'org.remmina.Remmina.desktop': <{'position': <15>}>, 'org.cachyos.scx-manager.desktop': <{'position': <16>}>, 'org.gnome.Screenshot.desktop': <{'position': <17>}>, 'org.gnome.Settings.desktop': <{'position': <18>}>, 'siyuan-note.desktop': <{'position': <19>}>, 'org.gnome.SoundRecorder.desktop': <{'position': <20>}>, 'steam.desktop': <{'position': <21>}>, 'steam-native.desktop': <{'position': <22>}>, 'com.stremio.stremio.desktop': <{'position': <23>}>}, {'syncthing-gtk.desktop': <{'position': <0>}>, 'org.gnome.SystemMonitor.desktop': <{'position': <1>}>, 'Terraria.desktop': <{'position': <2>}>, 'tModLoader.desktop': <{'position': <3>}>, 'org.gnome.Tour.desktop': <{'position': <4>}>, 'tutanota-desktop.desktop': <{'position': <5>}>, 'org.gnome.tweaks.desktop': <{'position': <6>}>, 'uhk-agent.desktop': <{'position': <7>}>, 'universal-access': <{'position': <8>}>, 'org.gnome.Usage.desktop': <{'position': <9>}>, 'vesktop.desktop': <{'position': <10>}>, 'org.gnome.Totem.desktop': <{'position': <11>}>, 'vim.desktop': <{'position': <12>}>, 'virt-manager.desktop': <{'position': <13>}>, 'org.pulseaudio.pavucontrol.desktop': <{'position': <14>}>, 'vscodium.desktop': <{'position': <15>}>, 'vscodium-wayland.desktop': <{'position': <16>}>, 'org.gnome.Weather.desktop': <{'position': <17>}>, 'winetricks.desktop': <{'position': <18>}>, 'zen.desktop': <{'position': <19>}>}]
disable-user-extensions=false
disabled-extensions=['workspace-indicator@gnome-shell-extensions.gcampax.github.com', 'screenshot-window-sizer@gnome-shell-extensions.gcampax.github.com', 'system-monitor@gnome-shell-extensions.gcampax.github.com', 'window-list@gnome-shell-extensions.gcampax.github.com', 'windowsNavigator@gnome-shell-extensions.gcampax.github.com', 'Vitals@CoreCoding.com', 'apps-menu@gnome-shell-extensions.gcampax.github.com', 'auto-move-windows@gnome-shell-extensions.gcampax.github.com', 'places-menu@gnome-shell-extensions.gcampax.github.com', 'app-grid-wizard@mirzadeh.pro', 'trayIconsReloaded@selfmade.pl', 'vertical-workspaces@G-dH.github.com']
enabled-extensions=['status-icons@gnome-shell-extensions.gcampax.github.com', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'native-window-placement@gnome-shell-extensions.gcampax.github.com', 'pop-shell@system76.com', 'no-overview@fthx', 'clipboard-indicator@tudmotu.com', 'caffeine@patapon.info', 'gnome-fuzzy-app-search@gnome-shell-extensions.Czarlie.gitlab.com', 'appmenu-is-back@fthx', 'appindicatorsupport@rgcjonas.gmail.com', 'unmess@ezix.org', 'AlphabeticalAppGrid@stuarthayhurst', 'power-profile@fthx', 'Bluetooth-Battery-Meter@maniacx.github.com', 'just-perfection-desktop@just-perfection', 'blur-my-shell@aunetx']
last-selected-power-profile='performance'
welcome-dialog-last-shown-version='48.1'

[org/gnome/shell/extensions/blur-my-shell]
settings-version=2

[org/gnome/shell/extensions/blur-my-shell/appfolder]
brightness=0.59999999999999998
sigma=30

[org/gnome/shell/extensions/blur-my-shell/dash-to-dock]
blur=true
brightness=0.59999999999999998
sigma=30
static-blur=true
style-dash-to-dock=0

[org/gnome/shell/extensions/blur-my-shell/panel]
brightness=0.59999999999999998
sigma=30

[org/gnome/shell/extensions/blur-my-shell/window-list]
brightness=0.59999999999999998
sigma=30

[org/gnome/shell/extensions/caffeine]
indicator-position-max=2
user-enabled=false

[org/gnome/shell/extensions/clipboard-indicator]
history-size=25
move-item-first=true
strip-text=true

[org/gnome/shell/extensions/just-perfection]
accent-color-icon=false
accessibility-menu=false
activities-button=true
alt-tab-window-preview-size=0
animation=4
background-menu=true
clock-menu=true
clock-menu-position=1
clock-menu-position-offset=20
controls-manager-spacing-size=0
dash=true
dash-icon-size=0
double-super-to-appgrid=true
keyboard-layout=false
max-displayed-search-results=0
notification-banner-position=2
osd=true
osd-position=0
overlay-key=true
panel=true
panel-icon-size=0
panel-in-overview=true
panel-notification-icon=true
power-icon=true
quick-settings=true
quick-settings-airplane-mode=true
quick-settings-dark-mode=false
quick-settings-night-light=false
ripple-box=false
search=true
show-apps-button=true
startup-status=0
support-notifier-showed-version=34
support-notifier-type=0
switcher-popup-delay=true
theme=false
top-panel-position=0
weather=false
window-demands-attention-focus=false
window-picker-icon=true
window-preview-caption=true
window-preview-close-button=true
workspace=true
workspace-background-corner-size=0
workspace-popup=true
workspace-switcher-should-show=false
workspaces-in-app-grid=true

[org/gnome/shell/extensions/pop-shell]
active-hint=true
active-hint-border-radius=uint32 5
gap-inner=uint32 2
gap-outer=uint32 2
hint-color-rgba='rgb(227,204,46)'
mouse-cursor-focus-location=uint32 4
tile-by-default=true

[org/gnome/shell/extensions/trayIconsReloaded]
icon-padding-vertical=4
icon-size=20
icons-limit=16
position-weight=4
tray-margin-left=7
tray-position='left'

[org/gnome/shell/extensions/unmess]
classgroup='{"zen":1,"vesktop":3,"Cider":3}'
classinstance='{"zen":1,"vesktop":3,"cider":3}'

[org/gnome/shell/extensions/vertical-workspaces]
animation-speed-factor=50
app-grid-animation=0
app-grid-columns=0
app-grid-icon-size=-1
app-grid-incomplete-pages=false
app-grid-order=4
app-grid-page-height-scale=90
app-grid-page-width-scale=70
app-grid-performance=true
app-grid-rows=0
app-grid-spacing=12
center-app-grid=false
click-empty-close=true
dash-bg-color=1
dash-bg-gs3-style=false
dash-bg-opacity=30
dash-position=0
dash-position-adjust=0
highlighting-style=1
overview-esc-behavior=1
overview-mode=0
panel-overview-style=1
profile-data-1={'workspaceThumbnailsPosition': '0', 'wsMaxSpacing': '350', 'wsPreviewScale': '95', 'secWsPreviewScale': '95', 'secWsPreviewShift': 'false', 'wsThumbnailsFull': 'false', 'secWsThumbnailsPosition': '2', 'dashPosition': '0', 'dashPositionAdjust': '-100', 'wsTmbPositionAdjust': '-100', 'showWsTmbLabels': '3', 'showWsTmbLabelsOnHover': 'false', 'closeWsButtonMode': '2', 'secWsTmbPositionAdjust': '0', 'dashMaxIconSize': '0', 'centerDashToWs': 'false', 'showAppsIconPosition': '0', 'wsThumbnailScale': '13', 'wsThumbnailScaleAppGrid': '13', 'secWsThumbnailScale': '13', 'showSearchEntry': 'false', 'centerSearch': 'true', 'centerAppGrid': 'false', 'dashBgOpacity': '20', 'dashBgColor': '1', 'dashBgRadius': '18', 'dashBgGS3Style': 'false', 'runningDotStyle': '0', 'enablePageShortcuts': 'false', 'showWsSwitcherBg': 'false', 'showWsPreviewBg': 'true', 'wsPreviewBgRadius': '30', 'showOverviewBackground': '1', 'overviewBgBrightness': '60', 'appGridBgBrightness': '60', 'searchBgBrightness': '30', 'overviewBgBlurSigma': '100', 'appGridBgBlurSigma': '100', 'smoothBlurTransitions': 'false', 'appGridAnimation': '4', 'searchViewAnimation': '0', 'searchResultsBgStyle': '0', 'workspaceAnimation': '1', 'animationSpeedFactor': '100', 'winPreviewIconSize': '1', 'winTitlePosition': '0', 'startupState': '0', 'overviewMode': '0', 'workspaceSwitcherAnimation': '1', 'wsSwitcherMode': '0', 'searchIconSize': '0', 'searchViewScale': '100', 'appGridIconSize': '-1', 'appGridColumns': '0', 'appGridRows': '0', 'appGridFolderIconSize': '-1', 'appGridFolderColumns': '0', 'appGridFolderRows': '0', 'appGridFolderIconGrid': '3', 'appGridContent': '2', 'appGridIncompletePages': 'false', 'appGridOrder': '0', 'appFolderOrder': '0', 'appGridNamesMode': '1', 'appGridActivePreview': 'false', 'appGridFolderCenter': 'false', 'appGridPageWidthScale': '90', 'appGridPageHeightScale': '90', 'appGridSpacing': '12', 'appGridFolderSpacing': '12', 'appGridRememberPage': 'false', 'appFolderRemoveButton': '1', 'appFolderCloseButton': 'true', 'appGridShowPageArrows': 'true', 'searchWindowsOrder': '1', 'searchFuzzy': 'false', 'searchMaxResultsRows': '5', 'searchAppGridMode': '1', 'searchIncludeSettings': 'true', 'dashShowWindowsBeforeActivation': '1', 'dashIconScroll': '1', 'dashIsolateWorkspaces': 'false', 'appMenuForceQuit': 'true', 'appMenuCloseWinsWs': 'true', 'appMenuMoveApp': 'true', 'appMenuWindowTmb': 'true', 'searchWindowsIconScroll': '1', 'panelVisibility': '0', 'panelPosition': '0', 'panelOverviewStyle': '1', 'windowAttentionMode': '0', 'wsSwPopupHPosition': '50', 'wsSwPopupVPosition': '95', 'wsSwPopupMode': '1', 'wsSwitcherWraparound': 'false', 'wsSwitcherIgnoreLast': 'false', 'favoritesNotify': '1', 'notificationPosition': '2', 'osdPosition': '6', 'hotCornerAction': '1', 'hotCornerPosition': '0', 'hotCornerFullscreen': 'true', 'hotCornerRipples': 'true', 'alwaysActivateSelectedWindow': 'false', 'winPreviewSecBtnAction': '3', 'winPreviewMidBtnAction': '0', 'winPreviewShowCloseButton': 'true', 'windowIconClickAction': '1', 'winPreviewHeightCompensation': '50', 'overlayKeyPrimary': '1', 'overlayKeySecondary': '1', 'overviewEscBehavior': '0', 'overviewSortWindows': '0', 'overviewSelectWindow': '0', 'clickEmptyClose': 'false', 'newWindowFocusFix': 'false', 'newWindowMonitorFix': 'false', 'appGridPerformance': 'false', 'highlightingStyle': '1', 'delayStartup': 'false', 'workspaceSwitcherPopupModule': 'true', 'workspaceAnimationModule': 'true', 'workspaceModule': 'true', 'windowManagerModule': 'true', 'windowPreviewModule': 'true', 'windowAttentionHandlerModule': 'true', 'swipeTrackerModule': 'true', 'searchControllerModule': 'true', 'searchModule': 'true', 'panelModule': 'true', 'overlayKeyModule': 'true', 'osdWindowModule': 'true', 'messageTrayModule': 'true', 'layoutModule': 'true', 'dashModule': 'true', 'appFavoritesModule': 'true', 'appDisplayModule': 'true'}
profile-name-1='GNOME 3 Layout (Vertical WS)'
profile-name-2='GNOME 4x Layout, Bottom Hot Edge (Horizontal WS)'
running-dot-style=0
search-fuzzy=true
search-max-results-rows=10
show-overview-background=0
show-search-entry=false
show-ws-preview-bg=true
show-ws-switcher-bg=false
show-wst-labels=0
show-wst-labels-on-hover=false
win-preview-icon-size=1
workspace-animation=0
workspace-animation-module=true
ws-max-spacing=350
ws-preview-scale=95
ws-thumbnail-scale=7
ws-thumbnail-scale-appgrid=7
ws-thumbnails-full=true
ws-thumbnails-position=5
wst-position-adjust=0

[org/gnome/shell/extensions/vitals]
icon-style=0
show-gpu=true

[org/gnome/shell/keybindings]
open-application-menu=@as []
switch-to-application-1=@as []
switch-to-application-2=@as []
toggle-message-tray=['<Super>v']
toggle-overview=@as []

[org/gnome/shell/weather]
automatic-location=true
locations=@av []

[org/gnome/shell/world-clocks]
locations=[<(uint32 2, <('Minneapolis', 'KMSP', true, [(0.783357105556996, -1.6271510710263237)], [(0.78504848668181115, -1.627761011240018)])>)>]

[org/gnome/software]
check-timestamp=int64 1748477150
first-run=false
flatpak-purge-timestamp=int64 1748395684

[org/gnome/tweaks]
show-extensions-notice=false

[org/gtk/gtk4/settings/file-chooser]
show-hidden=false
sort-directories-first=false

[org/gtk/settings/color-chooser]
custom-colors=[(0.8901960784313725, 0.79907260201377839, 0.1803921568627451, 1.0), (0.1803921568627451, 0.83137254901960789, 0.8901960784313725, 1.0), (0.1803921568627451, 0.83264440911499749, 0.8901960784313725, 1.0), (0.1803921568627451, 0.50196078431372548, 0.8901960784313725, 1.0), (0.1803921568627451, 0.50196078431372515, 0.8901960784313725, 1.0), (0.98431372549019602, 0.8666666666666667, 0.42352941176470588, 1.0), (0.98431372549019602, 0.86685214626391083, 0.42352941176470582, 1.0), (0.42352941176470588, 0.73333333333333328, 0.98431372549019602, 1.0)]
selected-color=(true, 0.8901960784313725, 0.79907260201377839, 0.1803921568627451, 1.0)

[org/gtk/settings/file-chooser]
date-format='regular'
location-mode='path-bar'
show-hidden=false
show-size-column=true
show-type-column=true
sidebar-width=182
sort-column='name'
sort-directories-first=false
sort-order='ascending'
type-format='category'
window-position=(26, 23)
window-size=(1609, 1186)
