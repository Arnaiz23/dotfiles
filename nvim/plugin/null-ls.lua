local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

local formatting = null_ls.builtins.formatting

local sources = {
	formatting.eslint_d,
	formatting.autopep8,
	formatting.stylua,
}

null_ls.setup({
	sources = sources,
})

-- local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })

-- null_ls.setup {
-- 	sources = {
-- 		null_ls.builtins.diagnostics.eslint_d.with({
-- 			diagnostics_format = '[eslint] #{m}\n(#{c})'
-- 		}),
-- 		null_ls.builtins.diagnostics.fish
-- 	},
-- 	on_attach = function(client, bufnr)
-- 		if client.server_capabilities.documentFormattingProvider then
-- 			vim.api.nvim_clear_autocmds { buffer = 0, group = augroup_format }
-- 			--vim.api.nvim_create_autocmd("BufWritePre", {
-- 			--	group = augroup_format,
-- 			--	buffer = 0,
-- 			--callback = function() vim.lsp.buf.formatting_seq_sync() end
-- 			--})
-- 		end
-- 	end,
-- }

-- null_ls.setup({
-- 	-- root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
-- 	sources = {
-- 		null_ls.builtins.formatting.fish_indent,
-- 		null_ls.builtins.diagnostics.fish,
-- 		null_ls.builtins.formatting.stylua,
-- 		null_ls.builtins.formatting.shfmt,
-- 		null_ls.builtins.formatting.eslint_d,
-- 		-- null_ls.builtins.diagnostics.flake8,
-- 	},
-- })
