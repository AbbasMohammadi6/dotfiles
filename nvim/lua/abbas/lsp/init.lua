local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "abbas.lsp.mason"
require("abbas.lsp.handlers").setup()
require "abbas.lsp.null-ls"
require "abbas.lsp.settings.tsserver"
