require("arnaiz.base")
require("arnaiz.plugins")
require("arnaiz.theme")
require("arnaiz.keybindings")

-- Plugins
require("arnaiz.cmp")
require("arnaiz.lsp")
require("arnaiz.indent")
require("arnaiz.treesitter")
-- require("arnaiz.nvim-tree")
require("arnaiz.lualine")
require("arnaiz.bufferline")
require("arnaiz.comment")
require("arnaiz.gitsigns")
require("arnaiz.nvim-ts-autotag")
require("arnaiz.noice")
require("arnaiz.notify")
require("arnaiz.lspsaga")
require("arnaiz.which-key")
require("arnaiz.web-devicons")


-- Nvim-tree setup (I don't know why nvim don't recognize the nvim-tree file setup)
require("nvim-tree").setup {
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true
  },
  filters = {
    dotfiles = false
  }
}
