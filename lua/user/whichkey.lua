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
		a = {
			name = "T[a]b",
			n = { "<cmd>$tabnew<cr>", "[N]ew [E]mpty Tab" },
			N = { "<cmd>tabnew %<cr>", "[N]ew Tab" },
			o = { "<cmd>tabonly<cr>", "[O]nly" },
			h = { "<cmd>-tabmove<cr>", "Move Left" },
			l = { "<cmd>+tabmove<cr>", "Move Right" },
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
