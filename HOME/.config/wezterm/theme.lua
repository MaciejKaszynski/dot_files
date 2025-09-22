local wezterm = require("wezterm")
local theme = require("themes/rose-pine")

local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

if get_appearance():find  'Dark' then
    return theme.main
else
    return theme.dawn
end

