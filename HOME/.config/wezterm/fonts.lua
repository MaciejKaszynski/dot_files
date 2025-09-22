local wezFont = require("wezterm").font
local M = {}

function M:setup(opts)
    self.m_name = opts.name
    self.m_size = opts.size
end

function M:fontRules()
    return
    {
        {
            font = wezFont(self.m_name)
        },
        {
            italic = true,
            font = wezFont(self.m_name, { style = "Italic"})
        },
        {
            intensity = "Bold",
            font = wezFont(self.m_name, { weight = "Bold"})
        },
        {
            italic = true,
            intensity = "Bold",
            font = wezFont(self.m_name, { style = "Italic", weight = "Bold"})
        }
    }
end

function M:size()
    return self.m_size
end

return M
