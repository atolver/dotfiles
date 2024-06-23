local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font = wezterm.font 'Fira Code'
config.color_scheme = 'tokyonight_night'

return config
