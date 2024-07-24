local wezterm = require("wezterm")
local config = {}

-- Fonts --
config.font = wezterm.font({ family = "JetBrainsMono Nerd Font", weight = "ExtraLight" })

config.font_rules = {
	-- Regular Bold
	{
		intensity = "Bold",
		font = wezterm.font({ family = "JetBrainsMono Nerd Font", weight = "DemiBold" }),
	},

	-- Italic
	{
		italic = true,
		font = wezterm.font({ family = "VictorMono Nerd Font", italic = true }),
	},

	-- Bold Italic
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font({ family = "VictorMono Nerd Font", italic = true, weight = "Bold" }),
	},
}
config.font_size = 14
config.line_height = 1.3
---------------------------------------------------------

-- Window decors --

config.window_decorations = "NONE"
config.enable_tab_bar = false
config.animation_fps = 60
config.window_padding = {
	left = 50,
	right = 40,
	top = 60,
	bottom = 0,
}
---------------------------------------------------------

-- Colors
config.color_scheme = "flexoki-light"
---------------------------------------------------------

-- Term
config.term = "wezterm"
config.default_prog = { "zsh", "-l" }
config.window_close_confirmation = "NeverPrompt"
---------------------------------------------------------

config.keyboard_layout = "en-US-intl"

return config
