{
  config,
  pkgs,
  lib,
  ...
}:

let
  # ── Panel Configuration ────────────────────────────────────────────
  panelXml = ''
    <?xml version="1.1" encoding="UTF-8"?>
    <channel name="xfce4-panel" version="1.0">
      <property name="configver" type="int" value="2"/>
      <property name="panels" type="array">
        <value type="int" value="1"/>
        <property name="dark-mode" type="bool" value="true"/>
        <property name="panel-1" type="empty">
          <property name="position" type="string" value="p=6;x=0;y=0"/>
          <property name="length" type="uint" value="100"/>
          <property name="output-name" type="string" value="Primary"/>
          <property name="position-locked" type="bool" value="true"/>
          <property name="icon-size" type="uint" value="16"/>
          <property name="size" type="uint" value="26"/>
          <property name="plugin-ids" type="array">
            <value type="int" value="19"/>
            <value type="int" value="4"/>
            <value type="int" value="2"/>
            <value type="int" value="3"/>
            <value type="int" value="6"/>
            <value type="int" value="20"/>
            <value type="int" value="21"/>
            <value type="int" value="22"/>
            <value type="int" value="23"/>
            <value type="int" value="9"/>
            <value type="int" value="8"/>
            <value type="int" value="7"/>
            <value type="int" value="10"/>
            <value type="int" value="27"/>
          </property>
        </property>
      </property>
      <property name="plugins" type="empty">
        <property name="plugin-19" type="string" value="whiskermenu"/>
        <property name="plugin-4" type="string" value="pager">
          <property name="rows" type="uint" value="1"/>
          <property name="miniature-view" type="bool" value="false"/>
          <property name="numbering" type="bool" value="false"/>
          <property name="wrap-workspaces" type="bool" value="false"/>
        </property>
        <property name="plugin-2" type="string" value="tasklist">
          <property name="grouping" type="uint" value="1"/>
          <property name="flat-buttons" type="bool" value="false"/>
          <property name="show-labels" type="bool" value="true"/>
          <property name="show-handle" type="bool" value="true"/>
          <property name="show-tooltips" type="bool" value="true"/>
          <property name="middle-click" type="uint" value="3"/>
          <property name="include-all-workspaces" type="bool" value="true"/>
          <property name="show-only-minimized" type="bool" value="false"/>
          <property name="sort-order" type="uint" value="1"/>
        </property>
        <property name="plugin-3" type="string" value="separator">
          <property name="expand" type="bool" value="true"/>
          <property name="style" type="uint" value="0"/>
        </property>
        <property name="plugin-6" type="string" value="systray">
          <property name="square-icons" type="bool" value="true"/>
        </property>
        <property name="plugin-20" type="string" value="xfce4-clipman-plugin"/>
        <property name="plugin-21" type="string" value="notification-plugin"/>
        <property name="plugin-22" type="string" value="power-manager-plugin"/>
        <property name="plugin-23" type="string" value="pulseaudio">
          <property name="enable-keyboard-shortcuts" type="bool" value="true"/>
        </property>
        <property name="plugin-9" type="string" value="separator">
          <property name="style" type="uint" value="0"/>
        </property>
        <property name="plugin-8" type="string" value="clock">
          <property name="digital-date-font" type="string" value="Adwaita Sans Medium 8"/>
          <property name="digital-time-font" type="string" value="Adwaita Sans Medium 10"/>
          <property name="digital-time-format" type="string" value="%T"/>
          <property name="digital-layout" type="uint" value="3"/>
          <property name="mode" type="uint" value="2"/>
          <property name="show-week-numbers" type="bool" value="true"/>
          <property name="tooltip-format" type="string" value="%A %d %B %Y"/>
        </property>
        <property name="plugin-7" type="string" value="separator">
          <property name="style" type="uint" value="0"/>
        </property>
        <property name="plugin-10" type="string" value="actions">
          <property name="appearance" type="uint" value="1"/>
          <property name="button-title" type="uint" value="1"/>
          <property name="custom-title" type="string" value="NixOS"/>
          <property name="items" type="array">
            <value type="string" value="+lock-screen"/>
            <value type="string" value="-switch-user"/>
            <value type="string" value="+separator"/>
            <value type="string" value="+suspend"/>
            <value type="string" value="-hibernate"/>
            <value type="string" value="-hybrid-sleep"/>
            <value type="string" value="-separator"/>
            <value type="string" value="+shutdown"/>
            <value type="string" value="+restart"/>
            <value type="string" value="+separator"/>
            <value type="string" value="-logout"/>
            <value type="string" value="-logout-dialog"/>
          </property>
        </property>
        <property name="plugin-27" type="string" value="separator">
          <property name="expand" type="bool" value="false"/>
        </property>
      </property>
    </channel>
  '';

  # ── Window Manager Configuration ───────────────────────────────────
  xfwm4Xml = ''
    <?xml version="1.1" encoding="UTF-8"?>
    <channel name="xfwm4" version="1.0">
      <property name="general" type="empty">
        <property name="activate_action" type="string" value="bring"/>
        <property name="borderless_maximize" type="bool" value="true"/>
        <property name="box_move" type="bool" value="false"/>
        <property name="box_resize" type="bool" value="false"/>
        <property name="button_layout" type="string" value="O|SHMC"/>
        <property name="button_offset" type="int" value="0"/>
        <property name="button_spacing" type="int" value="0"/>
        <property name="click_to_focus" type="bool" value="true"/>
        <property name="cycle_apps_only" type="bool" value="false"/>
        <property name="cycle_draw_frame" type="bool" value="true"/>
        <property name="cycle_raise" type="bool" value="false"/>
        <property name="cycle_hidden" type="bool" value="true"/>
        <property name="cycle_minimum" type="bool" value="true"/>
        <property name="cycle_minimized" type="bool" value="false"/>
        <property name="cycle_preview" type="bool" value="true"/>
        <property name="cycle_tabwin_mode" type="int" value="0"/>
        <property name="cycle_workspaces" type="bool" value="true"/>
        <property name="double_click_action" type="string" value="maximize"/>
        <property name="double_click_distance" type="int" value="5"/>
        <property name="double_click_time" type="int" value="250"/>
        <property name="easy_click" type="string" value="Alt"/>
        <property name="focus_delay" type="int" value="250"/>
        <property name="focus_hint" type="bool" value="true"/>
        <property name="focus_new" type="bool" value="true"/>
        <property name="frame_opacity" type="int" value="100"/>
        <property name="frame_border_top" type="int" value="0"/>
        <property name="full_width_title" type="bool" value="true"/>
        <property name="horiz_scroll_opacity" type="bool" value="false"/>
        <property name="inactive_opacity" type="int" value="100"/>
        <property name="maximized_offset" type="int" value="0"/>
        <property name="mousewheel_rollup" type="bool" value="true"/>
        <property name="move_opacity" type="int" value="100"/>
        <property name="placement_mode" type="string" value="center"/>
        <property name="placement_ratio" type="int" value="20"/>
        <property name="popup_opacity" type="int" value="100"/>
        <property name="prevent_focus_stealing" type="bool" value="false"/>
        <property name="raise_delay" type="int" value="250"/>
        <property name="raise_on_click" type="bool" value="true"/>
        <property name="raise_on_focus" type="bool" value="false"/>
        <property name="raise_with_any_button" type="bool" value="true"/>
        <property name="repeat_urgent_blink" type="bool" value="false"/>
        <property name="resize_opacity" type="int" value="100"/>
        <property name="scroll_workspaces" type="bool" value="true"/>
        <property name="shadow_delta_height" type="int" value="0"/>
        <property name="shadow_delta_width" type="int" value="0"/>
        <property name="shadow_delta_x" type="int" value="0"/>
        <property name="shadow_delta_y" type="int" value="-3"/>
        <property name="shadow_opacity" type="int" value="50"/>
        <property name="show_app_icon" type="bool" value="false"/>
        <property name="show_dock_shadow" type="bool" value="true"/>
        <property name="show_frame_shadow" type="bool" value="true"/>
        <property name="show_popup_shadow" type="bool" value="true"/>
        <property name="snap_resist" type="bool" value="false"/>
        <property name="snap_to_border" type="bool" value="true"/>
        <property name="snap_to_windows" type="bool" value="false"/>
        <property name="snap_width" type="int" value="10"/>
        <property name="vblank_mode" type="string" value="auto"/>
        <property name="theme" type="string" value="Default"/>
        <property name="tile_on_move" type="bool" value="false"/>
        <property name="title_alignment" type="string" value="left"/>
        <property name="title_font" type="string" value="Adwaita Sans Bold 10"/>
        <property name="title_horizontal_offset" type="int" value="0"/>
        <property name="titleless_maximize" type="bool" value="false"/>
        <property name="title_shadow_active" type="string" value="false"/>
        <property name="title_shadow_inactive" type="string" value="false"/>
        <property name="title_vertical_offset_active" type="int" value="0"/>
        <property name="title_vertical_offset_inactive" type="int" value="0"/>
        <property name="toggle_workspaces" type="bool" value="false"/>
        <property name="unredirect_overlays" type="bool" value="true"/>
        <property name="urgent_blink" type="bool" value="false"/>
        <property name="use_compositing" type="bool" value="true"/>
        <property name="workspace_count" type="int" value="4"/>
        <property name="wrap_cycle" type="bool" value="true"/>
        <property name="wrap_layout" type="bool" value="true"/>
        <property name="wrap_resistance" type="int" value="10"/>
        <property name="wrap_windows" type="bool" value="false"/>
        <property name="wrap_workspaces" type="bool" value="false"/>
        <property name="zoom_desktop" type="bool" value="true"/>
        <property name="zoom_pointer" type="bool" value="true"/>
        <property name="workspace_names" type="array">
          <value type="string" value="1"/>
          <value type="string" value="2"/>
          <value type="string" value="3"/>
          <value type="string" value="4"/>
        </property>
      </property>
    </channel>
  '';

  # ── Appearance (xsettings) ─────────────────────────────────────────
  xsettingsXml = ''
    <?xml version="1.1" encoding="UTF-8"?>
    <channel name="xsettings" version="1.0">
      <property name="Net" type="empty">
        <property name="ThemeName" type="string" value="Adwaita-dark"/>
        <property name="IconThemeName" type="string" value="Rodent"/>
        <property name="DoubleClickTime" type="empty"/>
        <property name="DoubleClickDistance" type="empty"/>
        <property name="DndDragThreshold" type="empty"/>
        <property name="CursorBlink" type="empty"/>
        <property name="CursorBlinkTime" type="empty"/>
        <property name="SoundThemeName" type="empty"/>
        <property name="EnableEventSounds" type="bool" value="true"/>
        <property name="EnableInputFeedbackSounds" type="bool" value="true"/>
      </property>
      <property name="Xft" type="empty">
        <property name="DPI" type="int" value="120"/>
        <property name="Antialias" type="empty"/>
        <property name="Hinting" type="empty"/>
        <property name="HintStyle" type="empty"/>
        <property name="RGBA" type="empty"/>
      </property>
      <property name="Gtk" type="empty">
        <property name="CanChangeAccels" type="empty"/>
        <property name="ColorPalette" type="empty"/>
        <property name="FontName" type="string" value="Adwaita Sans 10"/>
        <property name="MonospaceFontName" type="string" value="Adwaita Mono 10"/>
        <property name="IconSizes" type="empty"/>
        <property name="KeyThemeName" type="empty"/>
        <property name="MenuImages" type="empty"/>
        <property name="ButtonImages" type="empty"/>
        <property name="MenuBarAccel" type="empty"/>
        <property name="CursorThemeName" type="string" value="Adwaita"/>
        <property name="CursorThemeSize" type="int" value="32"/>
        <property name="DecorationLayout" type="string" value="icon,menu:minimize,maximize,close"/>
        <property name="DialogsUseHeader" type="empty"/>
        <property name="TitlebarMiddleClick" type="empty"/>
      </property>
      <property name="Gdk" type="empty">
        <property name="WindowScalingFactor" type="empty"/>
      </property>
      <property name="Xfce" type="empty">
        <property name="LastCustomDPI" type="int" value="120"/>
      </property>
    </channel>
  '';

  # ── Keyboard Repeat Settings ───────────────────────────────────────
  keyboardsXml = ''
    <?xml version="1.1" encoding="UTF-8"?>
    <channel name="keyboards" version="1.0">
      <property name="Default" type="empty">
        <property name="KeyRepeat" type="empty">
          <property name="Delay" type="int" value="300"/>
        </property>
      </property>
    </channel>
  '';

  # ── Keyboard Shortcuts ─────────────────────────────────────────────
  shortcutsXml = ''
    <?xml version="1.1" encoding="UTF-8"?>
    <channel name="xfce4-keyboard-shortcuts" version="1.0">
      <property name="commands" type="empty">
        <property name="default" type="empty">
          <property name="&lt;Alt&gt;F1" type="empty"/>
          <property name="&lt;Alt&gt;F2" type="empty">
            <property name="startup-notify" type="empty"/>
          </property>
          <property name="&lt;Alt&gt;F3" type="empty">
            <property name="startup-notify" type="empty"/>
          </property>
          <property name="&lt;Primary&gt;&lt;Alt&gt;Delete" type="empty"/>
          <property name="&lt;Primary&gt;&lt;Alt&gt;l" type="empty"/>
          <property name="&lt;Primary&gt;&lt;Alt&gt;t" type="empty"/>
          <property name="XF86Display" type="empty"/>
          <property name="&lt;Primary&gt;Escape" type="empty"/>
          <property name="XF86WWW" type="empty"/>
          <property name="HomePage" type="empty"/>
          <property name="XF86Mail" type="empty"/>
          <property name="Print" type="empty"/>
          <property name="&lt;Alt&gt;Print" type="empty"/>
          <property name="&lt;Shift&gt;Print" type="empty"/>
          <property name="&lt;Super&gt;e" type="empty"/>
          <property name="&lt;Primary&gt;&lt;Alt&gt;f" type="empty"/>
          <property name="&lt;Primary&gt;&lt;Alt&gt;Escape" type="empty"/>
          <property name="&lt;Primary&gt;&lt;Shift&gt;Escape" type="empty"/>
          <property name="&lt;Super&gt;r" type="empty">
            <property name="startup-notify" type="empty"/>
          </property>
          <property name="&lt;Alt&gt;&lt;Super&gt;s" type="empty"/>
        </property>
        <property name="custom" type="empty">
          <!-- If true, the entries below replace XFCE defaults for these keys -->
          <property name="override" type="bool" value="true"/>

          <!-- Screenshot of active window -->
          <property name="&lt;Super&gt;&lt;Shift&gt;d" type="string" value="xfce4-screenshooter -w"/>

          <!-- Full-screen screenshot just use print. -->
          <property name="Print" type="string" value="xfce4-screenshooter"/>

          <!-- Region screenshot -->
          <property name="&lt;Super&gt;&lt;Shift&gt;s" type="string" value="xfce4-screenshooter -r"/>

          <!-- File manager -->
          <property name="&lt;Super&gt;f" type="string" value="thunar"/>

          <!-- Open Ghostty terminal -->
          <property name="&lt;Super&gt;t" type="string" value="ghostty"/>

          <!-- Open Helium browser -->
          <property name="&lt;Super&gt;b" type="string" value="helium"/>

          <!-- App finder with Super+Space (Spotlight-like) -->
          <property name="&lt;Super&gt;space" type="string" value="xfce4-appfinder">
            <property name="startup-notify" type="bool" value="true"/>
          </property>
        </property>
      </property>
      <property name="xfwm4" type="empty">
        <property name="default" type="empty">
          <property name="&lt;Alt&gt;Insert" type="empty"/>
          <property name="Escape" type="empty"/>
          <property name="Left" type="empty"/>
          <property name="Right" type="empty"/>
          <property name="Up" type="empty"/>
          <property name="Down" type="empty"/>
          <property name="&lt;Alt&gt;Tab" type="empty"/>
          <property name="&lt;Alt&gt;&lt;Shift&gt;Tab" type="empty"/>
          <property name="&lt;Alt&gt;Delete" type="empty"/>
          <property name="&lt;Alt&gt;F4" type="empty"/>
          <property name="&lt;Alt&gt;F6" type="empty"/>
          <property name="&lt;Alt&gt;F7" type="empty"/>
          <property name="&lt;Alt&gt;F8" type="empty"/>
          <property name="&lt;Alt&gt;F9" type="empty"/>
          <property name="&lt;Alt&gt;F10" type="empty"/>
          <property name="&lt;Alt&gt;F11" type="empty"/>
          <property name="&lt;Alt&gt;F12" type="empty"/>
          <property name="&lt;Alt&gt;space" type="empty"/>
          <property name="&lt;Primary&gt;&lt;Alt&gt;Down" type="empty"/>
          <property name="&lt;Primary&gt;&lt;Alt&gt;Left" type="empty"/>
          <property name="&lt;Primary&gt;&lt;Alt&gt;Right" type="empty"/>
          <property name="&lt;Primary&gt;&lt;Alt&gt;Up" type="empty"/>
          <property name="&lt;Primary&gt;&lt;Alt&gt;d" type="empty"/>
          <property name="&lt;Primary&gt;&lt;Alt&gt;End" type="empty"/>
          <property name="&lt;Primary&gt;&lt;Alt&gt;Home" type="empty"/>
          <property name="&lt;Primary&gt;&lt;Alt&gt;KP_1" type="empty"/>
          <property name="&lt;Primary&gt;&lt;Alt&gt;KP_2" type="empty"/>
          <property name="&lt;Primary&gt;&lt;Alt&gt;KP_3" type="empty"/>
          <property name="&lt;Primary&gt;&lt;Alt&gt;KP_4" type="empty"/>
          <property name="&lt;Primary&gt;&lt;Alt&gt;KP_5" type="empty"/>
          <property name="&lt;Primary&gt;&lt;Alt&gt;KP_6" type="empty"/>
          <property name="&lt;Primary&gt;&lt;Alt&gt;KP_7" type="empty"/>
          <property name="&lt;Primary&gt;&lt;Alt&gt;KP_8" type="empty"/>
          <property name="&lt;Primary&gt;&lt;Alt&gt;KP_9" type="empty"/>
          <property name="&lt;Primary&gt;F1" type="empty"/>
          <property name="&lt;Primary&gt;F2" type="empty"/>
          <property name="&lt;Primary&gt;F3" type="empty"/>
          <property name="&lt;Primary&gt;F4" type="empty"/>
          <property name="&lt;Primary&gt;F5" type="empty"/>
          <property name="&lt;Primary&gt;F6" type="empty"/>
          <property name="&lt;Primary&gt;F7" type="empty"/>
          <property name="&lt;Primary&gt;F8" type="empty"/>
          <property name="&lt;Primary&gt;F9" type="empty"/>
          <property name="&lt;Primary&gt;F10" type="empty"/>
          <property name="&lt;Primary&gt;F11" type="empty"/>
          <property name="&lt;Primary&gt;F12" type="empty"/>
          <property name="&lt;Primary&gt;&lt;Shift&gt;&lt;Alt&gt;Left" type="empty"/>
          <property name="&lt;Primary&gt;&lt;Shift&gt;&lt;Alt&gt;Right" type="empty"/>
          <property name="&lt;Primary&gt;&lt;Shift&gt;&lt;Alt&gt;Up" type="empty"/>
          <property name="&lt;Shift&gt;&lt;Alt&gt;Page_Down" type="empty"/>
          <property name="&lt;Shift&gt;&lt;Alt&gt;Page_Up" type="empty"/>
          <property name="&lt;Super&gt;Tab" type="empty"/>
          <property name="&lt;Super&gt;KP_Left" type="empty"/>
          <property name="&lt;Super&gt;KP_Right" type="empty"/>
          <property name="&lt;Super&gt;KP_Down" type="empty"/>
          <property name="&lt;Super&gt;KP_Up" type="empty"/>
          <property name="&lt;Super&gt;KP_Page_Up" type="empty"/>
          <property name="&lt;Super&gt;KP_Home" type="empty"/>
          <property name="&lt;Super&gt;KP_End" type="empty"/>
          <property name="&lt;Super&gt;KP_Next" type="empty"/>
          <property name="&lt;Super&gt;y" type="empty"/>
          <property name="&lt;Super&gt;u" type="empty"/>
          <property name="&lt;Super&gt;i" type="empty"/>
          <property name="&lt;Super&gt;o" type="empty"/>
        </property>
        <property name="custom" type="empty">
          <!-- If true, xfwm4 entries below replace XFWM default key map -->
          <property name="override" type="bool" value="true"/>

          <!-- Close focused window -->
          <property name="&lt;Alt&gt;F4" type="string" value="close_window_key"/>

          <!-- Switch between windows -->
          <property name="&lt;Alt&gt;Tab" type="string" value="switch_window_key"/>

          <!-- Reverse switch between windows -->
          <property name="&lt;Alt&gt;&lt;Shift&gt;Tab" type="string" value="cycle_reverse_windows_key"/>

          <!-- Cycle windows (Alt+Tab style) -->
          <property name="&lt;Super&gt;Tab" type="string" value="cycle_windows_key"/>

          <!-- Quick close focused window -->
          <property name="&lt;Super&gt;q" type="string" value="close_window_key"/>

          <!-- Tile focused window to left half -->
          <property name="&lt;Primary&gt;&lt;Super&gt;h" type="string" value="tile_left_key"/>

          <!-- Tile focused window to right half -->
          <property name="&lt;Primary&gt;&lt;Super&gt;l" type="string" value="tile_right_key"/>

          <!-- Cancel current WM keyboard action -->
          <property name="Escape" type="string" value="cancel_key"/>
          
          <!-- Tile focused window to top-left quarter -->
          <property name="&lt;Primary&gt;&lt;Super&gt;y" type="string" value="tile_up_left_key"/>

          <!-- Tile focused window to top-right quarter -->
          <property name="&lt;Primary&gt;&lt;Super&gt;o" type="string" value="tile_up_right_key"/>

          <!-- Tile focused window to bottom-left quarter -->
          <property name="&lt;Primary&gt;&lt;Super&gt;u" type="string" value="tile_down_left_key"/>

          <!-- Tile focused window to bottom-right quarter -->
          <property name="&lt;Primary&gt;&lt;Super&gt;p" type="string" value="tile_down_right_key"/>
          
          <!-- Jump directly to workspace 1 -->
          <property name="&lt;Super&gt;1" type="string" value="workspace_1_key"/>

          <!-- Jump directly to workspace 2 -->
          <property name="&lt;Super&gt;2" type="string" value="workspace_2_key"/>

          <!-- Jump directly to workspace 3 -->
          <property name="&lt;Super&gt;3" type="string" value="workspace_3_key"/>

          <!-- Jump directly to workspace 4 -->
          <property name="&lt;Super&gt;4" type="string" value="workspace_4_key"/>
          
          <!-- Send focused window to workspace 1 -->
          <property name="&lt;Super&gt;&lt;Shift&gt;1" type="string" value="move_window_workspace_1_key"/>

          <!-- Send focused window to workspace 2 -->
          <property name="&lt;Super&gt;&lt;Shift&gt;2" type="string" value="move_window_workspace_2_key"/>

          <!-- Send focused window to workspace 3 -->
          <property name="&lt;Super&gt;&lt;Shift&gt;3" type="string" value="move_window_workspace_3_key"/>

          <!-- Send focused window to workspace 4 -->
          <property name="&lt;Super&gt;&lt;Shift&gt;4" type="string" value="move_window_workspace_4_key"/>

          <!-- Maximize focused window -->
          <property name="&lt;Super&gt;m" type="string" value="maximize_window_key"/>

        </property>
      </property>
      <property name="providers" type="array">
        <value type="string" value="xfwm4"/>
        <value type="string" value="commands"/>
      </property>
    </channel>
  '';

  # ── Cortile Tiling WM ──────────────────────────────────────────────
  # Complete config (cortile zero-fills missing keys, so partial configs
  # would lose keybindings). Based on upstream v2.5.2 defaults.
  # Hot corners disabled: the top panel + whiskermenu would trigger them.
  cortileConfigToml = ''
    ################################################################################
    #                                                                              #
    #           https://github.com/leukipp/cortile/blob/main/config.toml           #
    #                                                                              #
    #        Managed by home-manager (modules/home/xfce.nix) - edit there.         #
    #                                                                              #
    ################################################################################

    #################################### Tiling ####################################

    # Initial tiling activation, will be cached afterwards (true | false).
    tiling_enabled = true

    # Initial tiling layout, will be cached afterwards ("vertical-left" | "vertical-right" | "horizontal-top" | "horizontal-bottom" | "maximized" | "fullscreen").
    tiling_layout = "vertical-right"

    # List of tiling layouts used for next/previous layout cycle ([] = default).
    tiling_cycle = [
        "vertical-left",
        "vertical-right",
        "horizontal-top",
        "horizontal-bottom",
    ]

    # An overlay window is displayed for this time period [ms] when the layout was changed (0 = disabled).
    tiling_gui = 1500

    # Menu entries in systray which shows the tiling state as icon ([] = disabled).
    # tiling_icon = [
    #   ["ACTION", "TEXT"] = ["action strings from [keys] section", "text to show in the menu"],
    #   ["", ""] = "show a separator line",
    # ]
    tiling_icon = [
        ["toggle", "Enabled"],
        ["decoration", "Decoration"],
        ["", ""],
        ["master_increase", "Add Master"],
        ["master_decrease", "Remove Master"],
        ["", ""],
        ["slave_increase", "Add Slave"],
        ["slave_decrease", "Remove Slave"],
        ["", ""],
        ["reset", "Reset"],
        ["", ""],
        ["exit", "Exit"],
    ]

    #################################### Window ####################################

    # Regex RE2 syntax to ignore windows (WM_CLASS string can be found by running `xprop WM_CLASS`).
    # window_ignore = [
    #   ["WM_CLASS", "WM_NAME"] = ["ignore all windows with this class", "but allow those with this name"]
    # ]
    window_ignore = [
        ["nm.*", ""],
        ["gcr.*", ""],
        ["polkit.*", ""],
        ["wrapper.*", ""],
        ["lightdm.*", ""],
        ["blueman.*", ""],
        ["pavucontrol.*", ""],
        ["firefox.*", ".*Mozilla Firefox"],
    ]

    # Maximum number of allowed master windows (0 - 5).
    window_masters_max = 3

    # Maximum number of allowed slave windows (1 - 5).
    window_slaves_max = 3

    # How much space should be left between windows (0 - 100).
    window_gap_size = 10

    # When hovered for this duration [ms] windows are focused (0 = disabled).
    window_focus_delay = 0

    # Initial rendering of window decorations, will be cached afterwards (true | false).
    window_decoration = true

    ################################## Proportion ##################################

    # How much to increment/decrement master-slave area (0.0 - 1.0).
    proportion_step = 0.05

    # Minimum window width/height in proportion to workspace (0.0 - 1.0).
    proportion_min = 0.2

    ##################################### Edge #####################################

    # Margin of the tiling area ([top, right, bottom, left]).
    edge_margin = [0, 0, 0, 0]

    # Margin of the tiling area on primary screen ([top, right, bottom, left]).
    edge_margin_primary = [0, 0, 0, 0]

    # Width and height of a hot-corner area within the edge corners (0 - 100).
    edge_corner_size = 10

    # Width or height of a hot-corner area within the edge centers (0 - 100).
    edge_center_size = 100

    ################################################################################
    [colors]                             # RGBA color values used for ui elements. #
    ################################################################################

    # Window text color.
    gui_text = [255, 255, 255, 255]

    # Window background color.
    gui_background = [30, 30, 40, 255]

    # Slave client layout color.
    gui_client_slave = [58, 58, 78, 255]

    # Master client layout color.
    gui_client_master = [98, 98, 128, 255]

    # Systray icon background color.
    icon_background = [0, 0, 0, 0]

    # Systray icon foreground color.
    icon_foreground = [255, 255, 255, 255]

    ################################################################################
    [keys]                            # Key symbols can be found by running `xev`. #
    ################################################################################

    # Enable tiling on the current screen (Home = Fn_Left).
    enable = "Control-Shift-Home"

    # Disable tiling on the current screen (End = Fn_Right).
    disable = "Control-Shift-End"

    # Toggle between enable and disable on the current screen.
    toggle = "Control-Shift-T"

    # Toggle window decoration on and off on the current screen.
    decoration = "Control-Shift-D"

    # Disable tiling and restore windows on the current screen.
    restore = "Control-Shift-R"

    # Reset layouts to default proportions (BackSpace = Delete_Left)
    reset = "Control-Shift-BackSpace"

    # Cycles through next layouts (Next = Page_Down).
    cycle_next = "Control-Shift-Next"

    # Cycles through previous layouts (Prior = Page_Up).
    cycle_previous = "Control-Shift-Prior"

    # Activates the vertical-left layout (Left = Arrow_Left).
    layout_vertical_left = "Control-Shift-Left"

    # Activates the vertical-right layout (Right = Arrow_Right).
    layout_vertical_right = "Control-Shift-Right"

    # Activates the horizontal-top layout (Up = Arrow_Up).
    layout_horizontal_top = "Control-Shift-Up"

    # Activates the horizontal-bottom layout (Down = Arrow_Down).
    layout_horizontal_bottom = "Control-Shift-Down"

    # Activates the maximized layout (Space = Blank).
    layout_maximized = "Control-Shift-Space"

    # Activates the fullscreen layout (Return = Enter).
    layout_fullscreen = "Control-Shift-Return"

    # Increase the number of slaves (Plus = +).
    slave_increase = "Control-Shift-Plus"

    # Decrease the number of slaves (Minus = -).
    slave_decrease = "Control-Shift-Minus"

    # Increase the number of masters (KP_Add = Num_+).
    master_increase = "Control-Shift-KP_Add"

    # Decrease the number of masters (KP_Subtract = Num_-).
    master_decrease = "Control-Shift-KP_Subtract"

    # Move focus to the next window (KP_2 = Num_2).
    window_next = "Control-Shift-KP_2"

    # Move focus to the previous window (KP_8 = Num_8).
    window_previous = "Control-Shift-KP_8"

    # Move the active window to the next screen (KP_9 = Num_9).
    screen_next = "Control-Shift-KP_9"

    # Move the active window to the previous screen (KP_7 = Num_7).
    screen_previous = "Control-Shift-KP_7"

    # Make the active window a master (KP_5 = Num_5).
    master_make = "Control-Shift-KP_5"

    # Make the next window a master (KP_6 = Num_6).
    master_make_next = "Control-Shift-KP_6"

    # Make the previous window a master (KP_4 = Num_4).
    master_make_previous = "Control-Shift-KP_4"

    # Increase the proportion of master-slave area (KP_3 = Num_3).
    proportion_increase = "Control-Shift-KP_3"

    # Decrease the proportion of master-slave area (KP_1 = Num_1).
    proportion_decrease = "Control-Shift-KP_1"

    # Some commands above will affect all screens if this key is pressed in addition (Mod1 = Alt_L).
    mod_screens = "Mod1"

    # Some commands above will affect all workspaces if this key is pressed in addition (Mod4 = Super_L).
    mod_workspaces = "Mod4"

    ################################################################################
    [corners]                                # Action strings from [keys] section. #
    ################################################################################
    # All disabled: hot corners conflict with the top panel / whiskermenu.

    # Corner at top left.
    top_left = ""

    # Corner at top center.
    top_center = ""

    # Corner at top right.
    top_right = ""

    # Corner at center right.
    center_right = ""

    # Corner at bottom right.
    bottom_right = ""

    # Corner at bottom center.
    bottom_center = ""

    # Corner at bottom left.
    bottom_left = ""

    # Corner at center left.
    center_left = ""

    ################################################################################
    [systray]                                # Action strings from [keys] section. #
    ################################################################################

    # Icon left click with pointer.
    click_left = ""

    # Icon middle click with pointer.
    click_middle = "toggle"

    # Icon right click with pointer.
    click_right = ""

    # Icon vertical scroll up with pointer.
    scroll_up = "cycle_previous"

    # Icon vertical scroll down with pointer.
    scroll_down = "cycle_next"

    # Icon horizontal scroll left with pointer.
    scroll_left = "proportion_decrease"

    # Icon horizontal scroll right with pointer.
    scroll_right = "proportion_increase"
  '';

  # ── Cortile Autostart ──────────────────────────────────────────────
  cortileAutostart = ''
    [Desktop Entry]
    Type=Application
    Name=Cortile
    Comment=Auto tiling manager on top of Xfwm
    Exec=cortile
    Terminal=false
    NoDisplay=true
    X-GNOME-Autostart-enabled=true
  '';

in
{
  config = lib.mkIf config.services.xserver.desktopManager.xfce.enable {
    home-manager.users.fsanabria = {

      # ── GPG Agent: pinentry-gnome3 for XFCE ───────────────────────────
      services.gpg-agent.pinentry.package = lib.mkForce pkgs.pinentry-gnome3;

      home.pointerCursor = {
        name = "Adwaita";
        package = pkgs.adwaita-icon-theme;
        size = 32;
        x11.enable = true;
        gtk.enable = true;
      };

      # ── Firefox UI Font ───────────────────────────────────────────────
      programs.firefox = {
        enable = true;
        configPath = ".mozilla/firefox";
        profiles.default = {
          id = 0;
          path = "5e71bnxm.default";
          isDefault = true;
          settings = {
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          };
          userChrome = ''
            * {
              font-family: "Adwaita Sans", sans-serif !important;
            }
          '';
        };
      };

      xdg.desktopEntries.kanata-toggle = {
        name = "Kanata Toggle";
        comment = "Activar o desactivar Kanata";
        exec = "kanata-toggle";
        icon = "input-keyboard";
        terminal = false;
        categories = [ "Utility" ];
      };

      xdg.configFile = {
        "xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml" = {
          text = panelXml;
          force = true;
        };
        "xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml" = {
          text = xfwm4Xml;
          force = true;
        };
        "xfce4/xfconf/xfce-perchannel-xml/xsettings.xml" = {
          text = xsettingsXml;
          force = true;
        };
        "xfce4/xfconf/xfce-perchannel-xml/keyboards.xml" = {
          text = keyboardsXml;
          force = true;
        };
        "xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml" = {
          text = shortcutsXml;
          force = true;
        };
        # Cortile tiling WM: config + autostart on XFCE login
        "cortile/config.toml" = {
          text = cortileConfigToml;
          force = true;
        };
        "autostart/cortile.desktop" = {
          text = cortileAutostart;
          force = true;
        };
      };

    };
  };
}
