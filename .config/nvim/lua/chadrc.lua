---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",
  transparency = true,
}

M.nvdash = { load_on_startup = true }

M.ui = {
  statusline = {
    theme = "minimal",
  },
  tabufline = {
    lazyload = false,
    order = { "treeOffset", "buffers", "tabs" },
  },
}

M.term = {
  float = {
    -- relative = ""
    width = 0.8,
    height = 0.7,
    row = 0.15,
    col = 0.1,
    border = "rounded",
  },
}

return M
