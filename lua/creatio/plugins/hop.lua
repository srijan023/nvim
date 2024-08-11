return {
  'smoka7/hop.nvim',
  version = "*",
  opts = {
    keys = 'etovxqpdygfblzhckisuran'
  },
  vim.keymap.set("", "f", function()
    require("hop").hint_char1({ direction = require("hop.hint").HintDirection.AFTER_CURSOR })
  end, { remap = true }),

  vim.keymap.set("", "F", function()
    require("hop").hint_char1({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR })
  end, { remap = true }),

  vim.keymap.set("n", "<leader>hw", ":HopWord<cr>"),
}
