vim.g.mapleader = ","

local options = {
  number = true,
  relativenumber = true,
  numberwidth = 1,
  shiftwidth = 2
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

function Nmap(shortcut, command, desc)
  local options = { noremap = true, silent = true, desc = desc}
  vim.api.nvim_set_keymap("n", shortcut, command, options)
end

Nmap("<leader>e", ":Ex<CR>", "Open Explorer")
Nmap("<leader>cf", "gg=G", "Format Code")
