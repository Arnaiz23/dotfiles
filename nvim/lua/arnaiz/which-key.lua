local status_ok, wk = pcall(require, "which-key")
if not status_ok then
	return
end

local mappings = {
	g = {
		name = "Git",
	},
	s = {
		name = "Split",
	},
	q = {
		name = "Quit",
	},
	c = {
		name = "Code",
	},
	n = {
		name = "Neovim",
	},
	f = {
		name = "Find",
	},
	l = {
		name = "LSP",
	},
}

local opts = { prefix = "<leader>" }

wk.register(mappings, opts)
