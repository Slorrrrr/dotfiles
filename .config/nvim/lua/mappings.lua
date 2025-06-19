require "nvchad.mappings"

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- general
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>sv", ":vsplit<CR>", opts)
map("n", "<leader>ss", ":split<CR>", opts)

-- DAP
-- map("n", "<F5>", function()
--   require("dap").continue()
-- end)
-- map("n", "<F10>", function()
--   require("dap").step_over()
-- end)
-- map("n", "<F11>", function()
--   require("dap").step_into()
-- end)
-- map("n", "<leader>db", function()
--   require("dap").toggle_breakpoint()
-- end)

-- LSP
map("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
map("n", "<leader>fd", function()
  vim.diagnostic.config { virtual_text = true }
  print "Virtual text for errors ENABLED"
end, { desc = "LSP virtual text enable for errors" })
map("n", "<leader>dd", function()
  vim.diagnostic.config {
    virtual_text = false,
  }
  print "Virtual text for errors DISABLED"
end, { desc = "LSP virtual text disable for errors" })

-- NvChad
map({ "n", "t" }, "<leader>i", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })
