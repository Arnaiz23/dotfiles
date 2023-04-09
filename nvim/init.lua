-- Set the true colors in the terminal
vim.opt.termguicolors = true

-- Set the colorscheme
-- vim.cmd.colorscheme('onedark')
local colorscheme = "onedark"
local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
vim.o.background = "dark" -- or "light" for light mode
if not ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

-- Plugins
require("arnaiz.plugins")

-- Keybindings
require("arnaiz.keybindings")

-- Base vim settings
require("arnaiz.base")
