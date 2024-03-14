local M = {
  "windwp/nvim-autopairs",
  lazy = false,
}
M.config = function()
  require("nvim-autopairs").setup {
    check_ts = true,
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
  }
end

return M
