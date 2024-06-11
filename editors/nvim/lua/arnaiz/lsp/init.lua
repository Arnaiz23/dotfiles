local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("arnaiz.lsp.mason")
require("arnaiz.lsp.handlers").setup()
require("arnaiz.lsp.null-ls")

-- Errors hover
vim.o.updatetime = 250
vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])

-- Autoformat
-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = vim.api.nvim_create_augroup("lsp", { clear = true }),
--   callback = function(args)
--     vim.api.nvim_create_autocmd("BufWritePre", {
--       buffer = args.buf,
--       callback = function()
--         -- vim.lsp.buf.format { async = false, id = args.data.client_id }
--         vim.lsp.buf.format { async = true }
--       end,
--     })
--   end
-- })
