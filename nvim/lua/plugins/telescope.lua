return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    pickers = {
      find_files = {
        previewer = false,
      }
    },
    defaults = {
      mappings = {
        n = {
          ["q"] = "close",
        }
      }
    }
  },
  keys = {
    { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>g", "<cmd>Telescope live_grep<cr>",  desc = "Live Grep" },
  }
}
