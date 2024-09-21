local status_ok, wk = pcall(require, "which-key")
if not status_ok then
	return
end

local mappings = {
  { "<leader>g", group = "Git" },
  { "<leader>e", desc = "Open netrw", icon = "" },
  { "<leader>o", desc = "Open vertical netrw", icon = "" },
  { "<leader>b", group = "Buffers", icon = "" },
  { "<leader>s", group = "Split", icon = "󰨑" },
  { "<leader>q", group = "Quit" },
  { "<leader>c", group = "Code" },
  { "<leader>ct", group = "TreeSitter" },
  { "<leader>n", group = "Neovim", icon = "" },
  { "<leader>nq", desc = "Quit terminal <C-\\><C-n>" },
  { "<leader>f", group = "Find" },
  { "<leader>l", group = "LSP", icon = "󰰍" },
  { "<leader>ld", desc = "Open definition" },
}

local opts = { prefix = "<leader>" }

wk.add(mappings, opts)
