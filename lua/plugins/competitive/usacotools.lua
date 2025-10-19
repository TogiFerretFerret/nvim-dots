return {
  {
    dir = vim.fn.expand('~/USACO/UsacoTools'),
    name = 'UsacoTools',

    -- We'll use the 'config' key to call the setup function after loading
    config = function()
      require('UsacoTools').setup()
    end,
  },
}
