vim.g.mapleader = ","

-- define a variable to create maps

local opts = { noremap = true, silent = true }

local function map(mode, shorcut, command)
	vim.api.nvim_set_keymap(mode, shorcut, command, opts)
end

local function nmap(shorcut, command)
	map(shorcut, command)
end

-- move beetween panels
nmap('<C-h>', '<C-w>h')
nmap('<C-l>', '<C-w>l')
nmap('<C-j>', '<C-w>j')
nmap('<C-k>', '<C-w>k')

-- Work with the nvim tree
nmap('<leader>e', ':NvimTreeToggle<CR>')
nmap('<leader>o', ':NvimTreeFocus<CR>')

-- GIT
nmap('<leader>gb', ':Telescope git_branches<CR>')
nmap('<leader>gc', ':Telescope git_commits<CR>')
--map('<leader>gl', ':Lazygit<CR>', opts)

-- Save
nmap('<C-s>', ':w<CR>')

-- Quit
nmap('<leader>q', ':q<CR>')

-- Find Files
nmap('<leader>f', ':Telescope find_files hidden=true<CR>')

-- Change words
nmap('<leader>g', ':% s/')

-- Open new tab
nmap('<leader>t', ':tabnew<CR>')

-- Show all the maps
nmap('<leader>m', ':Maps<CR>')
