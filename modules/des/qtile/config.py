from libqtile import bar, hook, layout, widget
from libqtile.config import Drag, Group, Key, Screen
from libqtile.lazy import lazy
from qtile_extras import widget as ext_widget

mod = "mod4"
terminal = "alacritty"

keys = [
    Key([mod], "Return", lazy.spawn(terminal), desc="Terminal"),
    Key([mod], "d", lazy.spawn("rofi -show drun"), desc="App launcher"),
    Key([mod], "e", lazy.spawn("thunar"), desc="File manager"),
    Key([mod], "r", lazy.spawn("ristretto"), desc="Image previewer"),
    Key([mod], "z", lazy.spawn("xarchiver"), desc="Archive manager"),
    Key([mod], "j", lazy.layout.down(), desc="Focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Focus up"),
    Key([mod], "h", lazy.layout.left(), desc="Focus left"),
    Key([mod], "l", lazy.layout.right(), desc="Focus right"),
    Key([mod], "space", lazy.next_layout(), desc="Next layout"),
    Key([mod], "w", lazy.window.kill(), desc="Close window"),
    Key([mod], "Tab", lazy.next_screen(), desc="Next screen"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Exit qtile"),
    Key([mod, "control"], "l", lazy.spawn("slock"), desc="Lock screen"),
]

groups = [Group(str(i)) for i in range(1, 5)]
for g in groups:
    keys.append(Key([mod], g.name, lazy.group[g.name].toscreen(), desc=f"Go to group {g.name}"))
    keys.append(Key([mod, "shift"], g.name, lazy.window.togroup(g.name), desc=f"Move window to group {g.name}"))

layouts = [
    layout.MonadTall(margin=4, border_width=2, border_focus="#33b1ff"),
    layout.Max(),
]

widget_defaults = dict(font="sans", fontsize=13, padding=4)
extension_defaults = widget_defaults.copy()

# Colores estilo XFCE dark panel
PANEL_BG = "#383c4a"
SEP_FG = "#4a4f5c"
FG = "#ffffff"

screens = [
    Screen(
        top=bar.Bar(
            [
                # ── Izquierda: workspaces + prompt ──
                widget.GroupBox(highlight_method="line"),
                widget.Prompt(),
                # ── Centro: nombre de la ventana (app activa) ──
                widget.Spacer(length=bar.STRETCH),
                widget.WindowName(max_chars=80),
                widget.Spacer(length=bar.STRETCH),
                # ── Derecha: pomodoro, volumen, fecha, hora, power ──
                widget.Pomodoro(
                    width=130,
                    prefix_work="Work: ",
                    prefix_break="Break: ",
                    prefix_inactive="Idle: ",
                    color_work="#42be65",
                    color_break="#33b1ff",
                    color_inactive="#888888",
                ),
                widget.Separator(linewidth=1, foreground=SEP_FG),
                widget.PulseVolume(limit=100, scroll_step=5),
                widget.Separator(linewidth=1, foreground=SEP_FG),
                ext_widget.Calendar(
                    format="%d %b",
                    foreground=FG,
                    background=PANEL_BG,
                    padding=4,
                    show_week_numbers=True,
                ),
                widget.Clock(format="%I:%M %p", foreground=FG),
                widget.Separator(linewidth=1, foreground=SEP_FG),
                widget.QuickExit(
                    default_text="⏻",
                    foreground=FG,
                    countdown_start=5,
                    shutdown_command="systemctl poweroff",
                    restart_command="systemctl reboot",
                    logout_command="qtile cmd-obj -o cmd -f shutdown",
                    lock_command="slock",
                    suspend_command="systemctl suspend",
                ),
                widget.Systray(),
            ],
            26,
            background=PANEL_BG,
        )
    ),
]

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
]


@hook.subscribe.startup_once
def autostart():
    # Servicios del entorno: red, polkit, compositor, notificaciones y clipboard.
    lazy.spawn("nm-applet --indicator")
    lazy.spawn("polkit-kde-authentication-agent-1")
    lazy.spawn("picom")
    lazy.spawn("xfce4-notifyd")
    lazy.spawn("xfce4-clipman")


dgroups_key_handler = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
wmname = "qtile"