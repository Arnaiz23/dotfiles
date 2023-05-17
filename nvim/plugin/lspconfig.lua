local status, lspconfig = pcall(require, "lspconfig")
if not status then return end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  --buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

--
-- Languages servers
--

-- LUA config
lspconfig.lua_ls.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    -- enable_format_on_save(client, bufnr)
  end,
  settings = {
    Lua = {
      diagnostics = {
	-- Get the language server to recognize the `vim` global
	globals = { "vim" },
      },
      workspace = {
	-- Make the server aware of Neovim runtime files
	library = vim.api.nvim_get_runtime_file("", true),
	checkThirdParty = false,
      },
    },
  },
})

-- TS config
lspconfig.tsserver.setup({
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities,
})

-- Python
lspconfig.pyright.setup({})

-- HTML
lspconfig.html.setup({
  capabilities = capabilities,
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true,
    },
    provideFormatter = true,
  },
})

-- CSS
lspconfig.cssls.setup({
  capabilities = capabilities,
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
  settings = {
    css = {
      validate = true,
    },
    less = {
      validate = true,
    },
    scss = {
      validate = true,
    },
  },
})

lspconfig.cssmodules_ls.setup({
  cmd = { "cssmodules-language-server" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
})

-- Docker
lspconfig.docker_compose_language_service.setup({
  filetypes = { "yaml", "yml" },
})

lspconfig.dockerls.setup({})

-- Tailwind

local tw_highlight = require("tailwind-highlight")

lspconfig.tailwindcss.setup({
  on_attach = function(client, bufnr)
    -- rest of you config
    tw_highlight.setup(client, bufnr, {
      single_column = false,
      mode = "background",
      debounce = 200,
    })
  end,
})

-- Package.json
lspconfig.jsonls.setup({
  on_attach = on_attach,
  settings = {
    json = {
      schemas = {
	{
	  fileMatch = { 'package.json' },
	  url = 'https://json.schemastore.org/package.json',
	},
      },
    },
  },
})

--
-- Diagnostics
--

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
  },
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  },
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 4, prefix = "●" },
  severity_sort = true,
})


-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250
vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
