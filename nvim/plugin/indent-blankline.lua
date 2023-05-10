local status, indent_blankline = pcall(require, "indent_blankline")
if (not status) then return end

-- indent_blankline.setup({
-- 	char = "┊",
-- 	show_trailing_blankline_indent = false
-- })
--
indent_blankline.setup({
  char = "┊",
  filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
  show_trailing_blankline_indent = false,
  show_current_context = false,
})
