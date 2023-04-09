local wk = require("which-key")

local mappings = {
	g = {
		name = "Git",
		b = { "<cmd>:Telescope git_branches<cr>", "Show git branches" }
	}
}

local opts = { prefix = '<leader>' }

wk.register(mappings, opts)
