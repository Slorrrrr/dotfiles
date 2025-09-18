require "nvchad.mappings"

local map = vim.keymap.set

-- General
map("i", "jk", "<ESC>")
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>sv", ":vsplit<CR>", { desc = "Split screen vertical" })
map("n", "<leader>ss", ":split<CR>", { desc = "Split screen horizontal" })

-- LSP
map("n", "gh", function()
  vim.lsp.buf.hover {
    border = "rounded",
    max_width = 80,
  }
end, { desc = "LSP hover" })

map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "LSP go to references" })
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "LSP go to implementation" })
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "LSP go to definition" })

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
map({ "n" }, "<leader>i", function()
  require("nvchad.term").toggle { pos = "float", id = "floatterm" }
end, { desc = "terminal toggle floating term" })

map({ "n" }, "<leader>o", function()
  require("nvchad.term").toggle { pos = "float", id = "floatterm2" }
end, { desc = "terminal toggle floating term 2" })

-- Hop
map("n", "<leader>jw", "<cmd>HopWord<cr>", { desc = "Hop HopWord" })

-- Neotest
local neotest = require "neotest"

map("n", "<leader>nt", function()
  neotest.run.run()
end, { desc = "Neotest: Run nearest test" })

map("n", "<leader>nf", function()
  neotest.run.run(vim.fn.expand "%")
end, { desc = "Neotest: Run current file tests" })

map("n", "<leader>ng", function()
  neotest.summary.toggle()
end, { desc = "Neotest: Toggle summary window" })

map("n", "<leader>no", function()
  neotest.output.open { enter = true }
end, { desc = "Neotest: Open test output" })

-- LazyGit
map("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

-- Gotests
map("n", "<leader>gt", "<cmd>GoTests<cr>", { desc = "Gotests generate test to function" })
map("n", "<leader>ga", "<cmd>GoTestsAll<cr>", { desc = "Gotests generate test to all function" })

-- DAP
local dap = require "dap"
local dap_go = require "dap-go"
local widgets = require "dap.ui.widgets"

map("n", "<leader>dc", function()
  dap.continue()
end, { desc = "DAP continue" })

-- map("n", "<leader>dca", function()
--   vim.ui.input({ prompt = "Package args: " }, function(input)
--     if input then
--       local args = vim.split(input, " ")
--       dap.run {
--         type = "go",
--         name = "Debug Package (Arguments)",
--         request = "launch",
--         program = "${fileDirname}",
--         args = args,
--         outputMode = "remote",
--       }
--       print("Running package with args: " .. input)
--     end
--   end)
-- end, { desc = "DAP debug package with arguments" })

map("n", "<leader>dt", function()
  dap_go.debug_test()
end, { desc = "DAP debug test" })

map("n", "<leader>dta", function()
  vim.ui.input({ prompt = "Test args: " }, function(input)
    if input then
      local args = vim.split(input, " ")
      dap_go.debug_test { args = args }
      print("Test args set: " .. input)
    end
  end)
end, { desc = "DAP debug test with arguments" })

map("n", "<leader>do", function()
  dap.step_over()
end, { desc = "DAP step over" })

map("n", "<leader>di", function()
  dap.step_into()
end, { desc = "DAP step into" })

map("n", "<leader>ds", function()
  dap.step_out()
end, { desc = "DAP step out" })

map("n", "<leader>db", function()
  dap.toggle_breakpoint()
end, { desc = "DAP toggle breakpoint" })

map("n", "<leader>dh", function()
  widgets.hover()
end, { desc = "DAP hover" })

map("n", "<leader>df", function()
  widgets.centered_float(widgets.frames)
end, { desc = "DAP frames" })

map("n", "<leader>dv", function()
  widgets.centered_float(widgets.scopes)
end, { desc = "DAP scope" })

map("n", "<leader>dv", "<cmd>DapToggleRepl<cr>", { desc = "DAP open REPL" })

map("n", "<leader>dui", function()
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end, { desc = "DAP open debugging sidebar" })

-- DAP Arguments
map("n", "<leader>dsa", function()
  vim.ui.input({ prompt = "Package args: " }, function(input)
    if input then
      local args = vim.split(input, " ")
      for _, config in ipairs(dap.configurations.go) do
        if config.name == "Debug Package" then
          config.args = args
          print("Args set for Debug Package: " .. input)
          return
        end
      end
      print "Debug Package configuration not found"
    end
  end)
end, { desc = "DAP set arguments for Debug Package" })

map("n", "<leader>das", function()
  print "Go DAP configurations:"
  for i, config in ipairs(dap.configurations.go) do
    print(
      string.format(
        "%d. %s: %s",
        i,
        config.name or "unnamed",
        type(config.args) == "function" and "get_arguments()" or vim.inspect(config.args or {})
      )
    )
  end
end, { desc = "DAP show arguments" })

map("n", "<leader>d0", function()
  for _, config in ipairs(dap.configurations.go) do
    if config.name == "Debug Package" then
      config.args = {}
      print "Args cleared for Debug Package"
      return
    end
  end
end, { desc = "DAP clear arguments for Debug Package" })

-- Telescope
map("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>", { desc = "Telescope LSP go to references" })
map("n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Telescope LSP go to implementations" })
map("n", "<leader>gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Telescope go to defenition" })
