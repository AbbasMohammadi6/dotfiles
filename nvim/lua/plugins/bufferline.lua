return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  keys = {
    { "<leader>h", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "<leader>l", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "<leader>;", "<cmd>bd<cr>",                  desc = "Close Buffer" },
  },
  opts = {
    options = {
      mode = "buffers",
      diagnostics = "nvim_lsp",
      show_buffer_close_icons = true,
      show_close_icon = false,
    }
  },
}
