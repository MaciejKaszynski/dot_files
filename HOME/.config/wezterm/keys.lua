local wezterm = require("wezterm")
local act = wezterm.action

local M = {
    {
        key = "|",
        mods = "LEADER",
        action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },
    {
        key = "-",
        mods = "LEADER",
        action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
    },
    {
        key = "c",
        mods = "LEADER",
        action = act.SpawnTab("CurrentPaneDomain"),
    },
    {
        key = ",",
        mods = "LEADER",
        action = act.PromptInputLine({
            description = "Enter new name for tab",
            action = wezterm.action_callback(function(window, _, line)
                if line then
                    window:active_tab():set_title(line)
                end
            end),
        }),
    },
}

local function split_nav(key)
    return {
        key = key .. "Arrow",
        mods = "LEADER",
        action = wezterm.action_callback(function(win, pane)
            win:perform_action({ ActivatePaneDirection = key }, pane)
        end),
    }
end

for _, v in ipairs({ "Right", "Left", "Down", "Up" }) do
    table.insert(M, split_nav(v))
end

for i = 1, 9 do
    table.insert(M, {
        key = tostring(i),
        mods = "LEADER",
        action = act.ActivateTab(i - 1),
    })
end

return M
