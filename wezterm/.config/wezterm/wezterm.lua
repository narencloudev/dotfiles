-- Pull in the wezterm API
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Font and appearance
config.font = wezterm.font 'FiraMono Nerd Font'
config.font_size = 12.0
config.color_scheme = 'GruvboxDarkHard'
config.enable_tab_bar = false



-- Initial window size
config.initial_cols = 150
config.initial_rows = 40

return config
