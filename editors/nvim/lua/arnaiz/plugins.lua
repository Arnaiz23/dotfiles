return {
  -- Theme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      pcall(require("nvim-treesitter.install").update({ with_sync = true }))
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "folke/neodev.nvim",
    },
  },

  -- Lua LSP
  "folke/neodev.nvim",

  -- cmp plugins
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-nvim-lsp",

  -- snippets
  {
    "L3MON4D3/LuaSnip",
    version = "v1.*",
    event = "VeryLazy",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
  },

  -- Mason
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  -- NullLS
  -- "jose-elias-alvarez/null-ls.nvim",
  -- "nvimtools/none-ls.nvim",

  -- Conform (prettier, eslint...)
  "stevearc/conform.nvim",

  -- Telescope
  "nvim-telescope/telescope.nvim",
  "nvim-lua/plenary.nvim",

  -- Indent
  { "lukas-reineke/indent-blankline.nvim", version = "2.20.8" },

  -- Autopairs
  -- "jiangmiao/auto-pairs",
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },

  -- Lualine
  "nvim-lualine/lualine.nvim",

  -- CMD UI
  "MunifTanjim/nui.nvim",
  "folke/noice.nvim",

  -- Notify
  "rcarriga/nvim-notify",

  -- Custom tabs
  "akinsho/bufferline.nvim",

  -- Comments
  "numToStr/Comment.nvim",

  -- Which key
  "folke/which-key.nvim",

  -- Which key icons
  'echasnovski/mini.icons',
  -- LSP UI
  "glepnir/lspsaga.nvim",

  -- Tailwind background colors
  "princejoogie/tailwind-highlight.nvim",

  -- Background color hex
  "norcalli/nvim-colorizer.lua",

  -- Gitsigns
  "lewis6991/gitsigns.nvim",

  -- Autotag
  "windwp/nvim-ts-autotag",

  -- Lazygit
  "kdheepak/lazygit.nvim",

  -- Database
  "tpope/vim-dadbod",
  "kristijanhusak/vim-dadbod-ui",

  -- -- Oil
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Dashboard
  "goolord/alpha-nvim"
}
