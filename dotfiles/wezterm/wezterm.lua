-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end
-- config options
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.adjust_window_size_when_changing_font_size = false
config.use_fancy_tab_bar = false
config.window_background_opacity = 0.3
config.macos_window_background_blur = 30
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0
}
config.colors = {
  tab_bar = {
    background = '#181818'
  }
}

config.unix_domains = {
  {
    name = 'unix',
  },
}

-- This causes `wezterm` to act as though it was started as
-- `wezterm connect unix` by default, connecting to the unix
-- domain on startup.
-- If you prefer to connect manually, leave out this line.
config.default_gui_startup_args = { 'connect', 'unix' }

config.color_scheme = 'Zenburn'
return config
