return {
  "jbyuki/nabla.nvim",
  config = function()
    vim.keymap.set("n", "<leader>mp", ":lua require('nabla').popup()<CR>", { noremap = true, silent = true })
  end
}
