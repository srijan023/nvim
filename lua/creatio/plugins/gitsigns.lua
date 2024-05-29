return {
	"lewis6991/gitsigns.nvim",
	-- event = "BufEnter",
	-- cmd = "Gitsigns",
	config = function()
		local icons = require("creatio.icons")
		local opts = { noremap = true, silent = true }
		vim.keymap.set(
			"n",
			"<leader>gj",
			"<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>",
			opts
		)
		vim.keymap.set(
			"n",
			"<leader>gk",
			"<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>",
			opts
		)
		vim.keymap.set("n", "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", opts)
		vim.keymap.set("n", "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", opts)
		vim.keymap.set("n", "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", opts)
		vim.keymap.set("n", "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", opts)
		vim.keymap.set("n", "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", opts)
		vim.keymap.set("n", "<leader>go", "<cmd>Telescope git_status<cr>", opts)
		vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", opts)
		vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", opts)
		vim.keymap.set("n", "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", opts)
		vim.keymap.set("n", "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", opts)
		vim.keymap.set("n", "<leader>gC", "<cmd>Telescope git_b[c]ommits<cr>", opts)

		require("gitsigns").setup({
			signs = {
				add = {
					hl = "GitSignsAdd",
					text = icons.ui.BoldLineMiddle,
					numhl = "GitSignsAddNr",
					linehl = "GitSignsAddLn",
				},
				change = {
					hl = "GitSignsChange",
					text = icons.ui.BoldLineDashedMiddle,
					numhl = "GitSignsChangeNr",
					linehl = "GitSignsChangeLn",
				},
				delete = {

					hl = "GitSignsDelete",
					text = icons.ui.TriangleShortArrowRight,
					numhl = "GitSignsDeleteNr",
					linehl = "GitSignsDeleteLn",
				},
				topdelete = {
					hl = "GitSignsDelete",
					text = icons.ui.TriangleShortArrowRight,
					numhl = "GitSignsDeleteNr",
					linehl = "GitSignsDeleteLn",
				},
				changedelete = {
					hl = "GitSignsChange",
					text = icons.ui.BoldLineMiddle,

					numhl = "GitSignsChangeNr",
					linehl = "GitSignsChangeLn",
				},
			},
			watch_gitdir = {

				interval = 1000,
				follow_files = true,
			},
			attach_to_untracked = true,
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			update_debounce = 200,
			max_file_length = 40000,
			preview_config = {
				border = "rounded",
				style = "minimal",

				relative = "cursor",
				row = 0,

				col = 1,
			},
		})
	end,
}
