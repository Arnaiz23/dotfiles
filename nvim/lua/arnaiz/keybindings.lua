vim.g.mapleader = ","

-- define a variable to create maps

local opts = { noremap = true, silent = true }

function Map(mode, shorcut, command)
	vim.api.nvim_set_keymap(mode, shorcut, command, opts)
end

function Nmap(shorcut, command)
	Map('n', shorcut, command)
end

-- move beetween panels
Nmap('<C-h>', '<C-w>h')
Nmap('<C-l>', '<C-w>l')
Nmap('<C-j>', '<C-w>j')
Nmap('<C-k>', '<C-w>k')

-- Work with the nvim tree
Nmap('<leader>e', ':NvimTreeToggle<CR>')
Nmap('<leader>o', ':NvimTreeFocus<CR>')

-- GIT
Nmap('<leader>gb', ':Telescope git_branches<CR>')
Nmap('<leader>gc', ':Telescope git_commits<CR>')
--map('<leader>gl', ':Lazygit<CR>', opts)

-- Save
Nmap('<C-s>', ':w<CR>')

-- Quit
Nmap('<leader>q', ':q<CR>')

-- Find Files
Nmap('<leader>f', ':Telescope find_files hidden=true<CR>')

-- Change words
Nmap('<leader>g', ':% s/')

-- Open new tab
Nmap('<leader>t', ':tabnew<CR>')

-- Show all the maps
Nmap('<leader>m', ':Maps<CR>')
