local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  -- Your plugins go here
  -- Theme
  use 'joshdick/onedark.vim'
  -- File Explorer
  use {
    'nvim-tree/nvim-tree.lua',
    config = "require('nvim-tree-config')"
  }
  -- Autocomplete parenthesis and others
  use 'jiangmiao/auto-pairs'
  -- Icons
  use 'kyazdani42/nvim-web-devicons'
end)
