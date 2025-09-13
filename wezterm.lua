local wezterm = require("wezterm")
local config = wezterm.config_builder()
wezterm.log_info("reloading")

config.enable_wayland = true
config.webgpu_power_preference = "HighPerformance"

config.enable_kitty_graphics = true

config.color_scheme = "tokyonight_night"

config.window_decorations = "RESIZE"
config.enable_tab_bar = false

-- Fonts
config.font_size = 18
config.font = wezterm.font({ family = "Berkeley Mono" })
config.bold_brightens_ansi_colors = true
config.font_rules = {
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font({ family = "Berkeley Mono", weight = "Bold", style = "Italic" }),
	},
	{
		italic = true,
		intensity = "Half",
		font = wezterm.font({ family = "Berkeley Mono", weight = "DemiBold", style = "Italic" }),
	},
	{
		italic = true,
		intensity = "Normal",
		font = wezterm.font({ family = "Berkeley Mono", style = "Italic" }),
	},
}

return config
