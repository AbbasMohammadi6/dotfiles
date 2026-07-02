return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      -- TODO: add something for css and styled-components
      ensure_installed = { "ts_ls", "tailwindcss", "emmet_language_server" },
      handlers = {
        -- This default handler will be called for each installed server
        function(server_name)
          vim.lsp.config(server_name, {})
          vim.lsp.enable(server_name)
        end,
      }
    })
    vim.api.nvim_create_autocmd("LspAttach", {
      desc = "LSP actions",
      callback = function(event)
        local opts = { buffer = event.buf, noremap = true, silent = true }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "[d", function()
          vim.diagnostic.jump({ count = -1, float = { border = "rounded" } })
        end, opts)
        vim.keymap.set("n", "]d", function()
          vim.diagnostic.jump({ count = 1, float = { border = "rounded" } })
        end, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      end,
    })
  end
}
