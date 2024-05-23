return{
  "danymat/neogen",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "L3MON4D3/LuaSnip",
  },
  config = function()
    local neogen = require("neogen").setup({
      snippet_engine="luasnip"
    })
    vim.keymap.set("n", "<leader>xf", function ()
      neogen.generate({type = "func"})
    end)

    vim.keymap.set("n", "<leader>xt", function ()
      neogen.generate({type = "type"})
    end)

    vim.keymap.set("n", "<leader>xc", function ()
      neogen.generate({type = "class"})
    end)
  end
}
