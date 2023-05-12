-- Variables
local opt = vim.opt

opt.number = true -- show numbers
opt.relativenumber = true -- relative numbers
opt.mouse = "a" -- Activate the mouse
opt.clipboard = "unnamedplus" -- Copy to the clipboard
opt.showcmd = true -- show command when I writted
opt.encoding = "utf-8" -- codification
opt.showmatch = true -- Show the start and the end of the parenthesis...
opt.laststatus = 2 -- Bottom menu visible
opt.numberwidth = 1 -- The width of the numbers
opt.sw = 2 -- Indent with 2 spaces
opt.autoindent = true

vim.cmd 'syntax enable' -- Active the syntax
opt.termguicolors = true

-- Disable netrw for the nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
