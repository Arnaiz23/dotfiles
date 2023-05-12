local status, packer = pcall(require, "packer")
if not status then
  print("Packer is not installed")
  return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
  use("wbthomason/packer.nvim")
  -- Your plugins go here
  use("folke/tokyonight.nvim") -- Theme
  use("jiangmiao/auto-pairs") -- Autopairs
  use("nvim-lualine/lualine.nvim") -- Lualine
  use("nvim-tree/nvim-tree.lua") -- File Explorer
  use("kyazdani42/nvim-web-devicons") -- Icons
  use("nvim-telescope/telescope.nvim") -- Telescope
  use("nvim-lua/plenary.nvim") -- Telescope requirement
  use("nvim-treesitter/nvim-treesitter") -- Nvim treesitter
  use("neovim/nvim-lspconfig") -- Configurations for Nvim LSP
  use("hrsh7th/cmp-nvim-lsp") -- Provide nvim_lsp source for language servers
  use("hrsh7th/cmp-buffer") -- provides buffer source for completion from the opened buffer
  use("hrsh7th/cmp-path") -- provides path source for the completion of filepaths
  use("hrsh7th/cmp-cmdline") -- provides cmdline source for vim's comamnds
  use("hrsh7th/nvim-cmp") -- Autocompletion engine
  use("L3MON4D3/LuaSnip") -- Snippets
  use("onsails/lspkind.nvim")
  use("williamboman/mason.nvim") -- Mason
  use("williamboman/mason-lspconfig.nvim") -- Mason LSP
  use("MunifTanjim/nui.nvim") -- Cmd UI requirement
  use("folke/noice.nvim") -- CMD UI
  use("rcarriga/nvim-notify") -- Nvim notify
  use("akinsho/bufferline.nvim") -- Tabs custom
  use("lukas-reineke/indent-blankline.nvim") -- Indent
  use("numToStr/Comment.nvim") -- Comments
  use("folke/which-key.nvim") -- Which key
  use("glepnir/lspsaga.nvim") -- LSP UI
  use("jose-elias-alvarez/null-ls.nvim") -- Inject actions with LSP
  use("MunifTanjim/prettier.nvim") -- Prettier
  use("princejoogie/tailwind-highlight.nvim") -- Background color tailwind
  use("norcalli/nvim-colorizer.lua") -- Background color hex
  use("lewis6991/gitsigns.nvim") -- Gitsigns
  use("windwp/nvim-ts-autotag") -- Autotag with treesitter
end)
