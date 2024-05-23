return{
  "L3MON4D3/LuaSnip",
  event = "InsertEnter",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  config = function()
    require("luasnip/loaders/from_vscode").lazy_load()
    local ls = require("luasnip")

    vim.keymap.set({"i", "s"}, "<C-j>", function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end, {silent = true})

    vim.keymap.set({"i", "s"}, "<C-k>", function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end, {silent = true})

    vim.keymap.set({"i", "s"}, "<C-E>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, {silent = true})
  end
}
