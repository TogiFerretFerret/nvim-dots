local lspconfig = require('lspconfig')
local util = require('lspconfig.util')

local servers = {
	"ts_ls",
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
  "clangd",
  "gopls"
}

for _, server_name in ipairs(servers) do
  local opts = {
    autostart = true,
  }
  if server_name == "clangd" then
    opts.filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" }
  end
  if vim.lsp.config[server_name] then
    vim.lsp.config(server_name, opts)
    vim.lsp.enable(server_name)
  end
end

--require("nvim-treesitter.configs").setup({highlight = {enable = true,},})
--require("lsp_signature").setup({})

