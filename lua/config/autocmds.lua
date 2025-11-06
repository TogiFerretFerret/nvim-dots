-- Removed auto-open of nvim-tree to reduce memory usage on startup
-- Use <leader>e or <leader>f to open nvim-tree manually
vim.opt.foldlevelstart = 99
vim.api.nvim_create_autocmd({"BufNewFile", "BufReadPost"}, {
  callback = function(args)
    if vim.fn.expand("%:p") ~= "" then
      vim.api.nvim_del_autocmd(args.id) -- Remove the autocmd after the first trigger
      vim.cmd("noautocmd NvimTreeOpen")
      vim.schedule(function() vim.cmd("wincmd p") end) -- Ensure focus returns to the file
    end
  end,
})
