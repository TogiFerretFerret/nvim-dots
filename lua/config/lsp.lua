local lsp = require("vim.lsp")

local servers = {
  "lua_ls",
  "jsonls",
  "html",
  "cssls",
  "yamlls",
  "eslint",
  "pyright",
  "rust_analyzer",
  "ast_grep",
  "zls",
  "qmlls",
  "arduino_language_server"
}

for _, server in ipairs(servers) do
  lsp.config(server, {})
end

lsp.config("clangd", {
  filetypes = { "c", "cpp" },
  cmd = { "clangd" },
})

require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
  },
})

