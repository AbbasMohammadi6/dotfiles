return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  keys = {
    { "<leader>h", "BufferLineCyclePrev<cr>",      desc = "Prev Buffer" },
    { "<leader>l", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "<leader>;", "<cmd>bd<cr>",                  desc = "Close Buffer" },
  },
  opts = {
    mode = "buffers", -- Shows open files as tabs
    diagnostics = "nvim_lsp",
    show_buffer_close_icons = true,
    show_close_icon = false,
  },
}
