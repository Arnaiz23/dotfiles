local status, icons = pcall(require, "nvim-web-devicons")
if not status then
	return
end

icons.setup({
	-- your personnal icons can go here (to override)
	-- DevIcon will be appended to `name`
	default = true,
	strict = true,
	override_by_extension = {
		["astro"] = {
			icon = "",
			color = "#fff",
			name = "Astro",
		},
	}
})
