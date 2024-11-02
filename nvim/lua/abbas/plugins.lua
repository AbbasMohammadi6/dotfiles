local fn = vim.fn

-- Automatically install packer
-- This is the path that packer should be isntalled
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
-- if it's not there install it
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- When BufWritePost happens (when we write something) to plugins.lua, source it and run PakcerSync
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
-- here we are destructuring the return value from the 'protected call'
-- status_ok is the status, and we store the returned value of the module to the variable packer
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim"    -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"  -- Useful lua functions used ny lots of plugins
  use 'kyazdani42/nvim-web-devicons'
  --use 'kyazdani42/nvim-tree.lua'

  -- Comment all languages
  use 'numToStr/Comment.nvim'

  -- This is neccessary to make Comment.nvim work for jsx
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  use 'folke/tokyonight.nvim'

  -- cmp plugins
  use "hrsh7th/nvim-cmp"         -- The completion plugin
  use "hrsh7th/cmp-buffer"       -- buffer completions
  use "hrsh7th/cmp-path"         -- path completions
  use "hrsh7th/cmp-cmdline"      -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- snippets
  use "L3MON4D3/LuaSnip"             --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use for all languages

  -- LSP
  use "neovim/nvim-lspconfig"               -- enable LSP
  use "williamboman/mason.nvim"             -- simple to use language server installer
  use "williamboman/mason-lspconfig.nvim"   -- simple to use language server installer
  use { "jose-elias-alvarez/null-ls.nvim" } -- for formatters and linters

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  -- use "p00f/nvim-ts-rainbow" -- colorfull brackets, paranthesis, etc.

  --Autopairs
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter

  -- Bufferline
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye" -- this will keep you in nvim even if there is no buffers open

  -- lualine
  use "nvim-lualine/lualine.nvim"

  -- make nvim transparent
  use "xiyaowong/nvim-transparent"

  use "tpope/vim-fugitive"

  use "kdheepak/lazygit.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
