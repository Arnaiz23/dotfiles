local status_mason, mason = pcall(require, "mason")
if not status_mason then return end

local status_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_mason_lspconfig then return end

mason.setup {}

mason_lspconfig.setup {
  ensure_installed = { "quick_lint_js", "tailwindcss", "cssls", "jsonls", "eslint", "cssmodules_ls",
    "tsserver", "lua_ls", "html" },
  automatic_installation = true
}
