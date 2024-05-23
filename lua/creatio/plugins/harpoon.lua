return{
  "ThePrimeagen/harpoon",
  config = function()
    local harpoon = require("harpoon")
    vim.keymap.set("n", "<leader>hm", function()
      require("harpoon.mark").add_file()
      vim.notify "󱡅  marked file"
    end)
    vim.keymap.set("n", "<leader>ha", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>")

    vim.api.nvim_create_autocmd({ "filetype" }, {
      pattern = "harpoon",
      callback = function()
        vim.cmd [[highlight link HarpoonBorder TelescopeBorder]]
      end,

    })
  end

}
