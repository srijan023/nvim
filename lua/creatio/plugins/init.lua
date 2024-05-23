return {
  -- plugin for activity watcher
  "ActivityWatch/aw-watcher-vim",

  -- fidget loader
  {
    "j-hui/fidget.nvim",

    config = function()
      require("fidget").setup({})
    end
  },

  -- auto html tags
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end
  },

  -- automatically pair brackets
  {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,
        disable_filetype = { "TelescopePrompt", "spectre_panel" },
      })
    end
  },

  -- installing plenary though not necessary
  {
    "nvim-lua/plenary.nvim", 
  },
  
  -- other plugins
  {
  "mbbill/undotree",
    config = function()
      vim.keymap.set("n","<leader>ut", vim.cmd.UndotreeToggle)
    end
  },
  "tpope/vim-fugitive",
  "folke/zen-mode.nvim",
  "eandrju/cellular-automaton.nvim",
}
