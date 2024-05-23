local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- nohl search in neovim when ESC pressed
keymap("n", "<ESC>", "<cmd>nohlsearch<CR>")

-- Splitting window
keymap("n", "<leader>wh", ":split<CR>", { noremap = true, silent = true, desc = "[H]orizontal split" })
keymap("n", "<leader>wv", ":vsplit<CR>", { noremap = true, silent = true, desc = "[V]ertical split" })

-- center everything we search
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)

keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)

keymap("n", "g#", "g#zz", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- when we yank something and paste over something else, this changes the register value to the replaced value
keymap("x", "p", [["_dP]])

keymap("n", "<RightMouse>", "")

-- more good
keymap({ "n", "o", "x" }, "<s-h>", "^", opts)
keymap({ "n", "o", "x" }, "<s-l>", "g_", opts)

-- tailwind bearable to work with
keymap({ "n", "x" }, "j", "gj", opts)
keymap({ "n", "x" }, "k", "gk", opts)

-- keymaps for debugging, here becuase we have F keys.
keymap("n", "<F3>", "<cmd>DapStepInto<cr>", opts)
keymap("n", "<F2>", "<cmd>DapStepOut<cr>", opts)
keymap("n", "<F1>", "<cmd>DapStepOver<cr>", opts)

keymap("n", "<leader>cw", ":lua vim.wo.wrap = not vim.wo.wrap<CR>", opts)

vim.api.nvim_set_keymap("t", "<C-;>", "<C-\\><C-n>", opts)

-- move line up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

vim.keymap.set("n", "<leader>bn", ":bn<cr>")
vim.keymap.set("n", "<leader>bp", ":bp<cr>")

vim.keymap.set("n", "<leader>e", ":Ex<cr>")
vim.keymap.set("n", "<leader>.", ":Ex .<cr>")