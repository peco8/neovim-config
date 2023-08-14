local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- gui
  'rebelot/kanagawa.nvim',
  {
    'dracula/vim',
    lazy = false,
  },
  'nvim-lualine/lualine.nvim',
  'lewis6991/gitsigns.nvim',
  'ntpeters/vim-better-whitespace',
  -- dir browser
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  {
    'stevearc/oil.nvim',
    opts = {},
    -- optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  -- file finder
  {
	  'nvim-telescope/telescope.nvim',
	  tag = '0.1.0',
	  dependencies = { {'nvim-lua/plenary.nvim'} }
  },
  -- ?
  'nvim-treesitter/nvim-treesitter',
  -- lsp
  {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig'
  },
  -- auto completion
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  -- snippet engine
  'L3MON4D3/LuaSnip',
  -- inject lsp diagnostics, code actions
  {
    'jose-elias-alvarez/null-ls.nvim',
    ft = "go",
  },
  -- dap (Go debugger integration)
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  {
    "leoluz/nvim-dap-go",
    dependencies = "mfussenegger/nvim-dap",
    ft = "go",
  },
  -- Go missing tools from vim-go
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  }
}

local opts = {}

require("lazy").setup(plugins, opts)
