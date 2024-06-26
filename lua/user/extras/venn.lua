local M = {

	"jbyuki/venn.nvim",
	event = { "VeryLazy" },
	dependencies = {
		{ "anuvyklack/hydra.nvim" },
	},
}

function M.config()
	local hydra = require("hydra")
	local hint = [[
 Arrow^^^^^^   Select region with <C-v> 
 ^ ^ _K_ ^ ^   _f_: surround it with box
 _H_ ^ ^ _L_
 ^ ^ _J_ ^ ^                      _<Esc>_
]]
	hydra({
		name = "Draw Diagram",
		hint = hint,
		config = {
			color = "pink",
			invoke_on_body = true,
			hint = {
				border = "rounded",
			},
			on_enter = function()
				vim.o.virtualedit = "all"
			end,
		},
		mode = "n",
		body = "<leader>V",
		heads = {
			{ "H", "<C-v>h:VBox<CR>" },
			{ "J", "<C-v>j:VBox<CR>" },
			{ "K", "<C-v>k:VBox<CR>" },
			{ "L", "<C-v>l:VBox<CR>" },
			{ "f", ":VBox<CR>", { mode = "v" } },
			{ "<Esc>", nil, { exit = true } },
		},
	})
end

return M
