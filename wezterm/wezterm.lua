-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- Change the color scheme:
config.color_scheme = "nord"

-- Change the font:
config.font_size = 19
config.font = wezterm.font("RobotoMono Nerd Font Mono")

-- Change the window size and position
config.initial_cols = 127
config.initial_rows = 33
config.window_padding = {
	left = 15,
	right = 15,
	top = 0,
	bottom = 0,
}

-- Eliminate the window bar
config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.75
config.macos_window_background_blur = 8

-- Return the configuration to wezterm
return config
