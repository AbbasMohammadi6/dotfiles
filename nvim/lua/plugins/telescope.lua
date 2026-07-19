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
          ["<C-n>"] = "cycle_history_next",
          ["<C-p>"] = "cycle_history_prev",
        },
        i = {
          ["<C-n>"] = "cycle_history_next",
          ["<C-p>"] = "cycle_history_prev",
        },
      }
    }
  },
  keys = {
    { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>g", "<cmd>Telescope live_grep<cr>",  desc = "Live Grep" },
  }
}
