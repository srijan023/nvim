local M = {
	"folke/which-key.nvim",
}

function M.config()
	local mappings = {
		q = { "<cmd>confirm q<CR>", "Quit" },
		-- h = { "<cmd>nohlsearch<CR>", "NOHL" },
		[";"] = { "<cmd>tabnew | terminal<CR>", "Term" },

		-- name of groups
		b = {
			name = "[B]uffers",
			n = { "<cmd>bnext<cr>", "[B]uffer [N]ext" },
			p = { "<cmd>bprev<cr>", "[B]uffer [P]revious" },
		},
		d = { name = "[D]ebug" },
		f = { name = "[F]ind" },
		g = { name = "[G]it" },
		l = { name = "[L]SP" },
		p = { name = "[P]lugins" },
		t = { name = "[T]est" },
		h = { name = "[H]arpoon" },
		o = { name = "[O]ther" },
		t = {
			name = "[T]ab",
			N = { "<cmd>tabnew %<cr>", "[N]ew Tab" },
			o = { "<cmd>tabnew<cr>", "[O]nly Tab" },
			h = { "<cmd>-tabmove<cr>", "Move Left" },
			l = { "<cmd>+tabmove<cr>", "Move Right" },
			n = { "<cmd>tabn<cr>", "[N]ext tab" },
			p = { "<cmd>tabp<cr>", "[P]revious tab" },
		},
		T = { name = "Treesitter" },
	}

	local which_key = require("which-key")
	which_key.setup()
	-- which_key.setup({
	-- 	plugins = {
	-- 		marks = true,
	-- 		registers = true,
	-- 		spelling = {
	-- 			enabled = true,
	-- 			suggestions = 20,
	-- 		},
	-- 		presets = {
	-- 			operators = false,
	-- 			motions = false,
	-- 			text_objects = false,
	-- 			windows = false,
	--
	-- 			nav = false,
	-- 			z = false,
	-- 			g = false,
	-- 		},
	-- 	},
	-- 	triggers_nowait = {
	-- 		"g",
	-- 		-- marks
	-- 		"`",
	-- 		"'",
	-- 		"g`",
	-- 		"g'",
	-- 		-- registers
	-- 		'"',
	-- 		"<c-r>",
	-- 		-- spelling
	-- 		"z=",
	-- 	},
	-- 	window = {
	-- 		border = "rounded",
	-- 		position = "bottom",
	-- 		padding = { 2, 2, 2, 2 },
	-- 	},
	-- 	ignore_missing = true,
	-- 	show_help = false,
	-- 	show_keys = false,
	-- 	disable = {
	-- 		buftypes = {},
	-- 		filetypes = { "TelescopePrompt" },
	-- 	},
	-- })

	local opts = {
		mode = "n", -- NORMAL mode
		prefix = "<leader>", -- Leader key is space
	}

	which_key.register(mappings, opts)
end

return M
