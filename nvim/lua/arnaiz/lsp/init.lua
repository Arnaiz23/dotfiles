local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("arnaiz.lsp.mason")
require("arnaiz.lsp.handlers").setup()
require("arnaiz.lsp.null-ls")