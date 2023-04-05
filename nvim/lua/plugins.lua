local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  -- Your plugins go here
  use 'joshdick/onedark.vim'            -- Theme
  use 'nvim-tree/nvim-tree.lua'         -- File Explorer
  use 'jiangmiao/auto-pairs'            -- Autocomplete parenthesis and others
  use 'kyazdani42/nvim-web-devicons'    -- Icons
  use 'nvim-lualine/lualine.nvim'       -- Lualine
  use 'nvim-treesitter/nvim-treesitter' -- Colorized sintax
end)
