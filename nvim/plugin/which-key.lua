local wk = require("which-key")

local mappings = {
  g = {
    name = "Git"
  },
  s = {
    name = "Split"
  },
  q = {
    name = "Quit"
  },
  c = {
    name = "Code"
  },
  n = {
    name = "Neovim"
  },
  f = {
    name = "Find"
  },
  l = {
    name = "LSP"
  }
}

local opts = { prefix = '<leader>' }

wk.register(mappings, opts)
