local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- theme
local theme = require("theme")
config.colors = theme.colors()
config.window_frame = theme.window_frame()

-- font
local myFont = require("fonts")
myFont:setup({name = "ComicShannsMono Nerd Font", size = 18})
config.font_rules = myFont:fontRules()
config.font_size = myFont:size()

-- keymaps
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = require("keys")

-- tabs
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.enable_tab_bar = true
-- config.show_close_tab_button_in_tabs = false

--  window
config.window_decorations = "RESIZE"
config.check_for_updates = false
config.max_fps = 120
config.window_close_confirmation = "NeverPrompt"
config.window_padding = {
    bottom = 30,
}

return config
