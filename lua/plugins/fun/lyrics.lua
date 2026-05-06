return {
  dir = "~/USACO/cptools/lualine-lrcsnc.nvim",
  dependencies = { "nvim-lualine/lualine.nvim" },
  config = function()
    require("lrcsnc").setup({
      socket_path = "/tmp/lazyspotify-lyrics.sock",
      max_length = 60,
      icon = "♪",
    })
  end,
}
