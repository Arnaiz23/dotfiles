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
  use 'nvim-tree/nvim-tree.lua'
  -- Autocomplete parenthesis and others
  use 'jiangmiao/auto-pairs'
end)
