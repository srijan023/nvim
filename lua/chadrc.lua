local M = {}

M.base46 = {
    theme = "gruvchad",
    -- theme = "everblush",
    -- theme = "nightfox",
    -- theme = "onenord",
    -- theme = "pastelDark",
    -- theme = "tokyodark",
    transparency = true,
    hl_override = {
        CursorLine = {
            bg = "one_bg",
        },
    },
}

M.ui = {
    -- cmp = {
    --     format_colors = {
    --         tailwind = true,
    --     },
    -- },
    tabufline = {
        enabled = false,
    },
    statusline = {
        enabled = false,
        separator_style = "round",
        theme = "minimal",
    },
    telescope = {
        style = "bordered",
    },
}

return M
