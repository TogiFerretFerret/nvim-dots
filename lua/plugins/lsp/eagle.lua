return {
  {
    "soulis-1256/eagle.nvim",
    config = function()
      require("eagle").setup({
        keyboard_mode = true,
		mouse_mode=true
      })
      vim.keymap.set('n', '<M-Space>', ':EagleWin<CR>', { noremap = true, silent = true })
    end,
  },
}
