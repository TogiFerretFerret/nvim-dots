-- Auto-open nvim-tree when opening a file
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Open nvim-tree if a file was opened
    if vim.fn.argc() > 0 then
      vim.cmd("NvimTreeOpen")
    end
  end,
})

