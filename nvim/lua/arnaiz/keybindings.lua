vim.g.mapleader = ","

-- define a variable to create maps

function Map(mode, shorcut, command, desc)
	vim.api.nvim_set_keymap(mode, shorcut, command, { noremap = true, silent = true, desc = desc })
end

function Nmap(shorcut, command, desc)
	Map("n", shorcut, command, desc)
end

-- move beetween panels
Nmap("<C-h>", "<C-w>h", "Change left panel")
Nmap("<C-l>", "<C-w>l", "Change right panel")
Nmap("<C-j>", "<C-w>j", "Change down panel")
Nmap("<C-k>", "<C-w>k", "Change top panel")

-- Nvim Tree
Nmap("<leader>e", ":NvimTreeToggle<CR>", "Toggle nvim tree")
Nmap("<leader>o", ":NvimTreeFocus<CR>", "Focus nvim tree")

-- Save file
Nmap("<C-s>", ":w<CR>", "Save file")

-- Quit tab
Nmap("<leader>qq", ":q<CR>", "Quit tab")

-- Quit neovim
Nmap("<leader>qa", ":qa<CR>", "Quit neovim")

-- Format document
Nmap("<leader>cf", ":lua vim.lsp.buf.format()<CR>", "Format document")

-- Tabnew
Nmap("<leader>t", ":tabnew<CR>", "Open new tab")

-- Show maps
Nmap("<leader>nm", ":Telescope keymaps<CR>", "Show maps")

-- Split the window
Nmap("<leader>sv", "<C-w>v", "Split vertical the window")
Nmap("<leader>sh", "<C-w>s", "Split horizontal the window")

-- Find files
Nmap("<leader>ff", ":Telescope find_files hidden=true<CR>", "Find files")
Nmap("<leader>fg", ":Telescope live_grep<CR>", "Find words")

-- LSP
Nmap("<leader>lr", ":Telescope lsp_references<CR>", "LSP References")
Nmap("<leader>ld", ":Telescope lsp_definitions<CR>", "LSP Definitions")

-- Change words
Nmap("<leader>cc", ":% s/", "Change words")

-- Lazygit
Nmap("<leader>gl", ":LazyGit<CR>", "Lazygit")
Nmap("<leader>gh", ":LazyGitFilter<CR>", "Lazygit commits")
