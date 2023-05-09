vim.g.mapleader = ","

-- define a variable to create maps

function Map(mode, shorcut, command, desc)
	vim.api.nvim_set_keymap(mode, shorcut, command, { noremap = true, silent = true, desc = desc })
end

function Nmap(shorcut, command, desc)
	Map('n', shorcut, command, desc)
end

-- move beetween panels
Nmap('<C-h>', '<C-w>h', 'Change left panel')
Nmap('<C-l>', '<C-w>l', 'Change right panel')
Nmap('<C-j>', '<C-w>j', 'Change down panel')
Nmap('<C-k>', '<C-w>k', 'Change top panel')

-- Work with the nvim tree
Nmap('<leader>e', ':NvimTreeToggle<CR>', 'Toggle nvim tree')
Nmap('<leader>o', ':NvimTreeFocus<CR>', 'Focus nvim tree')

-- GIT
Nmap('<leader>gb', ':Telescope git_branches<CR>', 'Show git branches')
Nmap('<leader>gc', ':Telescope git_commits<CR>', 'Show git commits')
--map('<leader>gl', ':Lazygit<CR>', opts)

-- Save
Nmap('<C-s>', ':w<CR>', 'Save')

-- Quit
Nmap('<leader>q', ':q<CR>', 'Quit')

-- Find Files
Nmap('<leader>f', ':Telescope find_files hidden=true<CR>', 'Search files')

-- Change words
Nmap('<leader>c', ':% s/', 'Change words')

-- Open new tab
Nmap('<leader>t', ':tabnew<CR>', 'Open new tab')

-- Show all the maps
Nmap('<leader>m', ':Telescope keymaps<CR>')

-- Split the window
Nmap('<leader>sv', '<C-w>v', 'Split vertical the window')
Nmap('<leader>sh', '<C-w>s', 'Split horizontal the window')

-- Live grep
Nmap('<leader>w', ':Telescope live_grep<CR>', 'Ripgrep')

-- Fix prettier standard
Nmap('<leader>p', ':ALEFix standard<CR>', 'Format standard')
