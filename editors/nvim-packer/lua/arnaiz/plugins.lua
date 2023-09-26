local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- Theme
	use("folke/tokyonight.nvim")

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- Mason
	use("williamboman/mason.nvim") -- Mason
	use("williamboman/mason-lspconfig.nvim") -- MasonLSP

	-- NullLS
	use("jose-elias-alvarez/null-ls.nvim") -- For formatters and linters

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-lua/plenary.nvim") -- Telescope requirement

	-- Indent
	use("lukas-reineke/indent-blankline.nvim")

	-- Treesitter
	use("nvim-treesitter/nvim-treesitter")

	-- Autopairs
	use("jiangmiao/auto-pairs")

	-- File Explorer
	use("nvim-tree/nvim-tree.lua")

	-- Lualine
	use("nvim-lualine/lualine.nvim")

	-- Icons
	use("kyazdani42/nvim-web-devicons")

	-- CMD UI
	use("MunifTanjim/nui.nvim")
	use("folke/noice.nvim")

	-- Notify
	use("rcarriga/nvim-notify")

	-- Custom tabs
	use("akinsho/bufferline.nvim")

	-- Comments
	use("numToStr/Comment.nvim")

	-- Which key
	use("folke/which-key.nvim")

	-- LSP UI
	use("glepnir/lspsaga.nvim")

	-- Tailwind background colors
	use("princejoogie/tailwind-highlight.nvim")

	-- Background color hex
	use("norcalli/nvim-colorizer.lua")

	-- Gitsigns
	use("lewis6991/gitsigns.nvim")

	-- Autotag
	use("windwp/nvim-ts-autotag")

	-- Lazygit
	use("kdheepak/lazygit.nvim")
end)
