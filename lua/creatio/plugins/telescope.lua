return{
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim"
	},
	config = function()
		require("telescope").setup({})
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
		vim.keymap.set("n", "<leader>fs", builtin.grep_string, {})
		vim.keymap.set("n", "<leader>fr", builtin.oldfiles, {})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>bb", builtin.buffers, {})
	end
}
