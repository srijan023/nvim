return {
    "folke/trouble.nvim",
    config = function()
        require("trouble").setup({})

        vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>")
        vim.keymap.set("n", "<leader>tb", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>")
    end
}
