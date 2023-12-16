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

Nmap("<C-w><left>", "<C-w><", "Resize - Decrease width")
Nmap("<C-w><right>", "<C-w>>", "Resize - Increase width")
Nmap("<C-w><up>", "<C-w>+", "Resize - Increase height")
Nmap("<C-w><down>", "<C-w>-", "Resize - Decrease height")

-- Nvim Tree
Nmap("<leader>e", ":NvimTreeToggle<CR>", "Toggle nvim tree")
Nmap("<leader>o", ":NvimTreeFocus<CR>", "Focus nvim tree")

-- Save file
Nmap("<C-s>", ":w<CR>", "Save file")

-- Quit window
Nmap("<leader>qq", ":q<CR>", "Quit window")

-- Quit tab
Nmap("<leader>qt", ":tabclose<CR>", "Quit tab")

-- Quit neovim
Nmap("<leader>qa", ":qa<CR>", "Quit neovim")

-- Format document
Nmap("<leader>cf", ":lua vim.lsp.buf.format{ async = true }<CR>", "Format document")

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
Nmap("<leader>li", ":LspInfo<CR>", "LSP Info")
Nmap("<leader>ln", ":NullLsInfo<CR>", "NullLs Info")
Nmap("<leader>lR", ":LspRestart<CR>", "Restart LSP")

-- Change words
Nmap("<leader>cc", ":% s/", "Change words")

-- Lazygit / Git
Nmap("<leader>gl", ":LazyGit<CR>", "Lazygit")
Nmap("<leader>gh", ":LazyGitFilter<CR>", "Lazygit commits")
Nmap("<leader>gc", ":Telescope git_commits<CR>", "Git commits")

-- Terminal
Nmap("<leader>nt", ":terminal<CR>", "Open a terminal in a tab")

-- Databases
Nmap("<leader>nd", ":DBUI<CR>", "Open database clients")

-- Lazy
Nmap("<leader>nl", ":Lazy<CR>", "Open Lazy")

-- Oil
Nmap("<leader>nf", ":Oil --float<CR>", "Open Oil float")
Nmap("<leader>no", ":Oil<CR>", "Open Oil")

-- TreeSitter
Nmap("<leader>tb", ":TSBufToggle highlight<CR>", "Toggle the buf highlight")
