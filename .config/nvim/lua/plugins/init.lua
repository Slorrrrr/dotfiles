return {
  {
    "smoka7/hop.nvim",
    version = "*",
    event = "BufRead",
    opts = require "configs.hop",
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "goimports",
        "delve",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "go",
        "gomod",
        "gowork",
        "gosum",
      },
    },
  },

  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      require "configs.dap"
      require("dap-go").setup()
    end,
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-go",
    },
    config = function()
      require "configs.neotest"
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "yanskun/gotests.nvim",
    ft = "go",
    config = function()
      require("gotests").setup()
    end,
  },
  {
    "folke/which-key.nvim",
    lazy = false,
  },
  {
    "stevearc/dressing.nvim",
    lazy = true,
  },
}
