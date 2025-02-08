local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- nohl search in neovim when ESC pressed
keymap("n", "<ESC>", "<cmd>nohlsearch<CR>")

-- Splitting window
keymap("n", "<leader>wh", ":split<CR>", { noremap = true, silent = true, desc = "[H]orizontal split" })
keymap("n", "<leader>wv", ":vsplit<CR>", { noremap = true, silent = true, desc = "[V]ertical split" })

-- moving between windows
keymap("n", "<leader>sh", "<C-w>h", { noremap = true, silent = true, desc = "go to left" })
keymap("n", "<leader>sl", "<C-w>l", { noremap = true, silent = true, desc = "go to right" })
keymap("n", "<leader>sj", "<C-w>j", { noremap = true, silent = true, desc = "go down" })
keymap("n", "<leader>sk", "<C-w>k", { noremap = true, silent = true, desc = "go up" })

keymap(
    "n",
    "<leader>nts",
    ":silent !tmux neww tmux-sessionizer<cr>",
    { noremap = true, silent = true, desc = "tmux sessionizer" }
)

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
keymap("n", "<F3>", "<cmd>DapStepInto<cr>", { noremap = true, silent = true, desc = "Step into function" })
keymap("n", "<F2>", "<cmd>DapStepOut<cr>", { noremap = true, silent = true, desc = "Step out of function" })
keymap("n", "<F1>", "<cmd>DapStepOver<cr>", { noremap = true, silent = true, desc = "Step over to next line" })

keymap(
    "n",
    "<leader>cw",
    ":lua vim.wo.wrap = not vim.wo.wrap<CR>",
    { noremap = true, silent = true, desc = "Toggle wrap" }
)

vim.api.nvim_set_keymap("t", "<C-;>", "<C-\\><C-n>", opts)

-- moving through the splits
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)

-- move line up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>bn", ":bn<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bp<cr>", { desc = "Previous buffer" })

-- for todo
vim.keymap.set("n", "<leader>oa", ":TodoTelescope<cr>", { desc = "Todo using telescope" })

vim.keymap.set("n", "<leader>e", ":Neotree toggle<cr>", { desc = "Toggle noetree" })
-- vim.keymap.set("n", "<leader>e", ":Neotree float<cr>", { desc = "Floating neotree" })

vim.keymap.set("n", "<leader>jr", ":w<CR>:!g++ -Wall -Wextra -DLOCAL % -o %:r && ./%:r<CR>", { noremap = true })
