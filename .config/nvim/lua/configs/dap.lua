vim.fn.sign_define("DapBreakpoint", {
  text = "",
  texthl = "DapBreakpoint",
  linehl = "",
  numhl = "",
})
vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#ff84a8", bg = "NONE" })

vim.fn.sign_define("DapStopped", {
  text = "",
  texthl = "DapStopped",
  linehl = "Visual",
  numhl = "",
})
vim.api.nvim_set_hl(0, "DapStopped", { fg = "#ff84a8", bg = "NONE" })
