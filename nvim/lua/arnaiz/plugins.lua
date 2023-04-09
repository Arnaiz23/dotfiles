local status, packer = pcall(require, "packer")
if (not status) then
	print("Packer is not installed")
	return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
	use 'wbthomason/packer.nvim'
	-- Your plugins go here
	-- use 'joshdick/onedark.vim'                -- Theme
	use 'folke/tokyonight.nvim'               -- Theme
	use 'nvim-tree/nvim-tree.lua'             -- File Explorer
	use 'jiangmiao/auto-pairs'                -- Autocomplete parenthesis and others
	use 'kyazdani42/nvim-web-devicons'        -- Icons
	use 'nvim-lualine/lualine.nvim'           -- Lualine
	use 'nvim-treesitter/nvim-treesitter'     -- Colorized sintax
	use 'dense-analysis/ale'                  -- Prettier when save the file
	use 'alvan/vim-closetag'                  -- Close the tags automatic
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'       -- Telescope
	-- use 'nvim-telescope/telescope-file-browser.nvim' -- File browser <F3>
	use 'lewis6991/gitsigns.nvim'             -- Gitsigns
	use 'norcalli/nvim-colorizer.lua'         -- Background color to the hex code #fff
	use 'princejoogie/tailwind-highlight.nvim' -- Background color tailwind
	use 'neovim/nvim-lspconfig'               -- Configurations for Nvim LSP
	use 'hrsh7th/cmp-nvim-lsp'                -- Provide nvim_lsp source for language servers
	use 'hrsh7th/cmp-buffer'                  -- provides buffer source for completion from the opened buffer
	use 'hrsh7th/cmp-path'                    -- provides path source for the completion of filepaths
	use 'hrsh7th/cmp-cmdline'                 -- provides cmdline source for vim's comamnds
	use 'hrsh7th/nvim-cmp'                    -- Autocompletion engine
	use 'onsails/lspkind.nvim'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use 'jose-elias-alvarez/null-ls.nvim'    -- Inject actions with LSP
	use 'MunifTanjim/prettier.nvim'          -- Prettier with LSP
	use 'glepnir/lspsaga.nvim'               -- LSP UI
	use 'lukas-reineke/indent-blankline.nvim' -- Indent plugin configuration
	use 'williamboman/mason.nvim'            -- Mason
	use 'williamboman/mason-lspconfig.nvim'  -- Mason LSP
	use 'akinsho/bufferline.nvim'            -- Tabs custom
end)
