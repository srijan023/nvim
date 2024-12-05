return {
    "ThePrimeagen/harpoon",
    config = function()
        local harpoon = require("harpoon")
        local ui = require("harpoon.ui")
        vim.keymap.set("n", "<leader>hm", function()
            require("harpoon.mark").add_file()
            vim.notify("󱡅  marked file")
        end)
        vim.keymap.set("n", "<leader>ha", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>")

        vim.api.nvim_create_autocmd({ "filetype" }, {
            pattern = "harpoon",
            callback = function()
                vim.cmd([[highlight link HarpoonBorder TelescopeBorder]])
            end,
        })

        vim.keymap.set("n", "<leader>hf", function()
            ui.nav_file(1)
        end, { desc = "First file" })
        vim.keymap.set("n", "<leader>hd", function()
            ui.nav_file(2)
        end, { desc = "Second file" })
        vim.keymap.set("n", "<leader>hj", function()
            ui.nav_file(3)
        end, { desc = "Third file" })
        vim.keymap.set("n", "<leader>hk", function()
            ui.nav_file(4)
        end, { desc = "Fourth file" })
    end,
}
