local status, telescope = pcall(require, "telescope")
if not status then return end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  extensions = {
    file_browser = {
      theme = "ivy",
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          ["<C-a>"] = fb_actions.create
        },
      },
    },
  },
}
