-- setting up leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- vim.g.netrw_bufsettings = "noma nomod nu nobl nowrap ro rnu"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.signcolumn = "yes"

vim.opt.list = true
-- vim.opt.listchars = { lead = "." }

vim.opt.backup = false                                              -- creates a backup file
-- vim.opt.clipboard = "unnamedplus" -- this makes the neovim clipboard and system clipboard one single unit
vim.opt.cmdheight = 1                                               -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menu", "menuone", "noinsert", "noselect" } -- mostly just for cmp
-- vim.opt.conceallevel = 2                                            -- so that `` is visible in markdown files
-- vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.hlsearch = true    -- highlight all matches on previous search pattern
vim.opt.ignorecase = true  -- ignore case in search patterns
vim.opt.mouse = "a"        -- allow the mouse to be used in neovim
vim.opt.pumheight = 10     -- pop up menu height
vim.opt.pumblend = 10      -- explained later cmp popup menu transparency
vim.opt.showmode = false   -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 1    -- always show tabs
vim.opt.smartcase = true   -- smart case
vim.opt.smartindent = true -- make indenting smarter again

vim.opt.termsync = false

vim.opt.splitbelow = true    -- force all horizontal splits to go below current window
vim.opt.splitright = true    -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false     -- creates a swapfile
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000    -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true      -- enable persistent undo
vim.opt.updatetime = 100     -- faster completion (4000ms default)
vim.opt.writebackup = false  -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

vim.opt.expandtab = true     -- convert tabs to spaces
vim.opt.shiftwidth = 4       -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4          -- insert 2 spaces for a tab
vim.opt.cursorline = true    -- highlight the current line
vim.opt.number = true        -- set numbered lines
vim.opt.laststatus = 2
vim.opt.wrap = false
vim.opt.linebreak = true

vim.opt.showcmd = false
vim.opt.ruler = false
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.numberwidth = 4       -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes"    -- always show the sign column, otherwise it would shift the text each time
-- vim.opt.wrap = false -- display lines as one long line
vim.opt.scrolloff = 19
vim.opt.sidescrolloff = 8
vim.opt.guifont = "monospace:h14" -- the font used in graphical neovim applications
vim.opt.title = false
vim.opt.colorcolumn = "120"
-- colorcolumn = "120",
vim.opt.fillchars = vim.opt.fillchars + "eob: "
vim.opt.fillchars:append({
    stl = " ",
})

vim.opt.shortmess:append("c")

-- how to show whitespace in neovim

vim.cmd("set whichwrap+=<,>,[,],h,l")

vim.cmd([[set iskeyword+=-]])

vim.g.netrw_banner = 1
vim.g.netrw_mouse = 2

-- color options from primegean
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- enabling undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- setting up environment variables for java
vim.env.JAVA_HOME = "/usr/lib/jvm/java-21-openjdk-amd64"
vim.env.PATH = vim.env.JAVA_HOME .. "/bin:" .. vim.env.PATH
