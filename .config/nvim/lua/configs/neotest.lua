require("neotest").setup {
  adapters = {
    require "neotest-go" {
      recursive_run = true,
    },
  },
}
