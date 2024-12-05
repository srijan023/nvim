return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("telescope").setup({})
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
        vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Git files" })
        vim.keymap.set("n", "<leader>fs", builtin.grep_string, { desc = "Grep string" })
        vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Old files" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
        vim.keymap.set("n", "<leader>bb", builtin.buffers, { desc = "List of buffers" })
        vim.keymap.set("n", "gi", builtin.lsp_incoming_calls, { desc = "Go to implementations" })
        vim.keymap.set("n", "<leader>td", builtin.diagnostics, { desc = "Telescope diagnostics" })
    end,
}
