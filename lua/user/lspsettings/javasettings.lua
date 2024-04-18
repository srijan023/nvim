local M = {
	"mfussenegger/nvim-jdtls",
	event = "VeryLazy",
}

function M.config()
	local myconfig = {
		cmd = { "/home/creatio/.local/share/nvim/mason/bin/jdtls" },
		root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
	}
end

return M
