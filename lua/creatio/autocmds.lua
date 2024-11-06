local augroup = vim.api.nvim_create_augroup
local TheCreatioGroup = augroup("TheCreatio", {})

local autocmd = vim.api.nvim_create_autocmd

-- remove comment after enter
autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd("set formatoptions-=cro")
  end,
})

-- q to close
autocmd({ "FileType" }, {
  pattern = {
    "netrw",
    "Jaq",
    "qf",
    "git",

    "help",

    "man",
    "lspinfo",
    "oil",
    "spectre_panel",
    "lir",
    "DressingSelect",
    "tsplayground",
    "",
  },
  callback = function()
    vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]])
  end,
})

-- removing trailing whitespaces
autocmd({ "BufWritePre" }, {
  group = TheCreatioGroup,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

autocmd({ "CmdWinEnter" }, {
  callback = function()
    vim.cmd("quit")
  end,
})

-- highlight feedback for yanking
autocmd({ "TextYankPost" }, {
  desc = "Highlight when yanking text",
  callback = function()
    vim.highlight.on_yank()
  end,
})

autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.env.JAVA_HOME = "/usr/lib/jvm/java-21-openjdk-amd64/"
    vim.env.PATH = vim.env.JAVA_HOME .. "/bin:" .. vim.env.PATH
  end,
})
