require "nvchad.mappings"

local map = vim.keymap.set

-- General
map("i", "jk", "<ESC>")
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>sv", ":vsplit<CR>", { desc = "Split screen vertical" })
map("n", "<leader>ss", ":split<CR>", { desc = "Split screen horizontal" })

-- LSP
map("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "LSP hover" })
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "LSP go to references" })
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
end, { desc = "Terminal toggle floating term" })

-- Hop
map("n", "<leader>hw", "<cmd>HopWord<cr>", { desc = "Hop HopWord" })
