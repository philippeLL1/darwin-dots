-- Pull in the wezterm API
require"tabStyle"
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- tab bar

-- window
config.adjust_window_size_when_changing_font_size = false
config.window_background_opacity = 0.3
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0
}

-- COLORS
config.color_scheme = 'Monokai Pro Ristretto (Gogh)'
config.colors = {
  tab_bar = {
    background = 'rgba(0,0,0,0)'
  }
}
-- TAB BAR 
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.macos_window_background_blur = 20
config.show_new_tab_button_in_tab_bar = false

-- This causes `wezterm` to act as though it was started as
-- `wezterm connect unix` by default, connecting to the unix
-- domain on startup.
-- If you prefer to connect manually, leave out this line.
config.unix_domains = {
  {
    name = 'unix',
  },
}
config.default_gui_startup_args = { 'connect', 'unix' }

return config
