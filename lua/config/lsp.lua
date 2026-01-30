local lspconfig = require('lspconfig')
local util = require('lspconfig.util')

local servers = {
  "lua_ls",
  "jsonls",
  "html",
  "cssls",
  "yamlls",
  "eslint",
  "eslint_d",
  "pyright",
  "rust_analyzer",
  "ast_grep",
  "zls",
  "qmlls",
  "arduino_language_server",
  "clangd"
}

for _, server_name in ipairs(servers) do
  local opts = {
    autostart = true,
  }
  if server_name == "clangd" then
    opts.filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" }
  end
  vim.lsp.config(server_name, opts)
  vim.lsp.enable(server_name)
end

--require("nvim-treesitter.configs").setup({highlight = {enable = true,},})
--require("lsp_signature").setup({})

