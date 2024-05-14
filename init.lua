require("user.autocmd")
require("user.keymaps")
require("user.launch")
require("user.options")
require("user.extras.competitiveProgramming")

-- setting up discipline
local discipline = require("user.extras.discipline")
discipline.cowboy()

vim.api.nvim_set_hl(0, "Comment", { italic = true })
spec("user.colorscheme.tundra")

-- core plugins
spec("user.autopairs")
spec("user.autotag")
spec("user.colorizer")
spec("user.comment")
spec("user.fugitive")
spec("user.gitsigns")
spec("user.indentline")
spec("user.lualine")
spec("user.mason")
spec("user.neotab")
spec("user.nvimtree")
spec("user.telescope")
spec("user.toggleterm")
spec("user.treeSitter")
spec("user.whichkey")
-- install neogit for better git integrations
-- install gitlinker for git blame and other options
-- skipped schemestore
-- also needs jsonls additional settings for schemastores to setup
-- learn about quick fix and go for better quick fix (bqf)

-- debugger extensions
spec("user.debug.dap-ui")
spec("user.debug.dap")
spec("user.debug.mason-nvimdap")

-- extra extensions
spec("user.extras.activitiy-watch")
spec("user.extras.alpha")
spec("user.extras.breadcrumps")
spec("user.extras.devIcons")
spec("user.extras.dressing")
spec("user.extras.fidget")
spec("user.extras.flash")
spec("user.extras.harpoon")
-- spec("user.extras.illuminate")
-- spec "user.lab"
-- spec("user.extras.leetcode")
spec("user.extras.markdown-preview")
-- spec "user.extras.modicator"
-- spec("user.extras.motions")
spec("user.extras.navic")

-- get real tabs using tabb)
-- get neo test for using nvim on tests
spec("user.extras.neoscroll")
-- spec("user.extras.noice")
-- spec("user.extras.obsidian")
spec("user.extras.silicon")
-- spec("user.extras.symbols-outline")
spec("user.extras.tint")
spec("user.extras.todoComments")
spec("user.extras.ufo")
spec("user.extras.venn")
spec("user.extras.vim-tmux-navigator")

-- lspsetting plugins
spec("user.lspsettings.tabnine")
spec("user.lspsettings.cmp")
spec("user.lspsettings.javasettings")
spec("user.lspsettings.lspconfig")
spec("user.lspsettings.none-ls")
spec("user.lspsettings.rust-tools")
spec("user.lspsettings.tsserver")

-- this has to be at the end
require("user.lazy")
