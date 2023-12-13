local status, oil = pcall(require, "oil")
if not status then
	return
end

oil.setup({
	view_options = {
		show_hidden = true,
	},
})
