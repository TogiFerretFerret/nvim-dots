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
  "clangd",
  "gopls",
  "jdtls"
}

local function ts_before_init(params, config)
  local root = config.root_dir or vim.fn.getcwd()
  -- Try root/node_modules first, then root/frontend/node_modules for monorepos
  -- where the TS project lives in a subdirectory.
  local tsdk = root .. "/node_modules/typescript/lib"
  if vim.fn.filereadable(tsdk .. "/typescript.js") == 0 then
    tsdk = root .. "/frontend/node_modules/typescript/lib"
  end
  config.init_options = config.init_options or {}
  config.init_options.typescript = { tsdk = tsdk }
end

for _, server_name in ipairs(servers) do
  local opts = { autostart = true }
  if server_name == "clangd" then
    opts.filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" }
  elseif server_name == "rust_analyzer" then
    opts.settings = {
      ["rust-analyzer"] = {
        diagnostics = {
          disabled = { "unlinked-file" }
        }
      }
    }
  end
  if vim.lsp.config[server_name] then
    vim.lsp.config(server_name, opts)
    vim.lsp.enable(server_name)
  end
end

for _, server_name in ipairs({ "ts_ls", "astro" }) do
  if vim.lsp.config[server_name] then
    vim.lsp.config(server_name, { autostart = true, before_init = ts_before_init })
    vim.lsp.enable(server_name)
  end
end

--require("nvim-treesitter.configs").setup({highlight = {enable = true,},})
--require("lsp_signature").setup({})

