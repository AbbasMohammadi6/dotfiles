return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = { "javascript", "typescript", "tsx", "html", "css", "json", "lua" },
      highlight = { enable = true },
      indent = { enable = true },
      -- context_commentstring = { enable = true },
    })
  end
}
