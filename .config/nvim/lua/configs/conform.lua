local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "goimports" },
  },

  format_on_save = {
    timeout_ms = 500,
  },
}

return options
