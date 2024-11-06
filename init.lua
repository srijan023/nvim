-- base 46 config
-- this is to be placed before lazy.nvim
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"

require("creatio.options")
require("creatio.autocmds")
require("creatio.keymaps")
require("creatio.lazy")

-- this is to be placed after lazy.nvim
for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
  dofile(vim.g.base46_cache .. v)
end
