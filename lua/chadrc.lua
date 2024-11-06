local M = {}

M.base46 = {
  theme = 'onedark',
  transparency = true,
  hl_override = {
    CursorLine = {
      bg = "one_bg",
    },
  },
}

M.ui = {
  cmp = {
    format_colors = {
      tailwind = true
    },
  },
  tabufline = {
    enabled = false,
  },
  statusline = {
    separator_style = "round",
    theme = "minimal"
  },
  telescope = {
    style = "bordered"
  },
}

return M
