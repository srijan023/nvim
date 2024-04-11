local M = {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
	},
}

function M.config()
	require("nvim-treesitter.configs").setup({
		modules = {},
		auto_install = true,
		ensure_installed = {
			"lua",
			"markdown",
			"markdown_inline",
			"bash",
			"python",
			"c",
			"javascript",
			"cpp",
			"vimdoc",
			"css",
			"html",
			"tsx",
		}, -- put the language you want in this array
		ignore_install = { "" },
		sync_install = false,
		highlight = {
			enable = true,
			disable = { "markdown" },
			additional_vim_regex_highlighting = false,
			-- for performance reasons
		},
		indent = {
			enable = true,
		},
	})
	require("treesitter-context")
	local wk = require("which-key")
	wk.register({
		["<leader>lx"] = { "<cmd>TSContextToggle<CR>", "Toggle Context" },
	})
end

return M
