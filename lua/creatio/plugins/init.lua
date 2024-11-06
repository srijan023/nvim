return {
  -- plugin for activity watcher
  -- "ActivityWatch/aw-watcher-vim",

  -- notifier (minimal alternative to notify.nvim and similar to fidget)
  { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' },

  -- nv-chad colorscheme
  {
    "nvchad/ui",
    config = function()
      require "nvchad"
    end
  },

  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end
  },

  -- now we need to change the init.lua file for base46 config

  {
    "vigoux/notifier.nvim",
    config = function()
      require 'notifier'.setup {
        -- You configuration here
      }
    end
  },

  -- indent guide
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    opts = {}
  },

  -- dressing for better input for renames and change
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },

  -- fidget loader
  {
    "j-hui/fidget.nvim",

    config = function()
      require("fidget").setup({})
    end,
  },

  -- auto html tags
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- nvim colorizer
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   config = function()
  --     require("colorizer").setup({
  --       user_default_options = {
  --         tailwind = true,
  --       },
  --     })
  --   end,
  -- },

  -- automatically pair brackets
  {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,
        disable_filetype = { "TelescopePrompt", "spectre_panel" },
      })
    end,
  },

  -- installing plenary though not necessary
  {
    "nvim-lua/plenary.nvim",
  },

  -- luarocks for neorg
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },

  -- other plugins
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle)
    end,
  },
  "tpope/vim-fugitive",
  "folke/zen-mode.nvim",

  -- useless fun plugin
  "eandrju/cellular-automaton.nvim",
}
