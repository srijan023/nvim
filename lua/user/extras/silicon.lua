local M = {
	"michaelrommel/nvim-silicon",
	lazy = true,
	cmd = "Silicon",
}

function M.config()
	require("silicon").setup({
		-- Configuration here, or leave empty to use defaults
		font = "JetBrainsMono NF=34;Noto Emoji=34",
	})
	local wk = require("which-key")
	wk.register({})
end

return M
