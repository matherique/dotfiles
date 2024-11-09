local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font('JetBrains Mono', { weight = 'Regular', italic = false })
config.font_size = 20.0
config.enable_tab_bar = false
config.window_background_opacity = 0.96
config.macos_window_background_blur = 10
config.color_scheme = 'Guezwhoz'
config.enable_scroll_bar = true
config.scrollback_lines = 35000



return config
