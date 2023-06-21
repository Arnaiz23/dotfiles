local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.setup = function()
	local signs = {

		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		virtual_text = false, -- disable virtual text
		signs = {
			active = signs, -- show signs
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function lsp_keymaps(bufnr)
	function options(desc)
		local opts = { noremap = true, silent = true, desc = desc }
		return opts
	end

	local keymap = vim.api.nvim_buf_set_keymap
	keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", options())
	-- keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", options("Format code"))
	keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", options("LSP info"))
	keymap(
		bufnr,
		"n",
		"<leader>lj",
		"<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>",
		options("Go to the next error")
	)
	keymap(
		bufnr,
		"n",
		"<leader>lk",
		"<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
		options("Go to the prev error")
	)
	keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", options("Rename"))
end

M.on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
	end

	if client.name == "sumneko_lua" then
		client.server_capabilities.documentFormattingProvider = false
	end

	if client.name == "tailwindcss" then
		require("tailwind-highlight").setup(client, bufnr, {
			single_column = false,
			mode = "background",
			debounce = 200,
		})
	end

	lsp_keymaps(bufnr)
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
end

return M
