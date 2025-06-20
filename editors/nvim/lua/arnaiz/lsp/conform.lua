local status, conform = pcall(require, "conform")
if not status then
  return
end

local M = {}

function M.setup()
  conform.setup({
    formatters_by_ft = {
      lua = { "stylua" },
      -- You can customize some of the format options for the filetype (:help conform.format)
      -- Conform will run the first available formatter
      javascript = { "prettierd", "prettier", "eslint", stop_after_first = true },
    },
  })
end

return M
