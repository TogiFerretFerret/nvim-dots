return {
dir= "~/USACO/cptools/lualine-lrcsnc.nvim", -- Or wherever you store local plugins
  dependencies = { "nvim-lualine/lualine.nvim" },
  config = function()
    require("lrcsnc").setup({
      cmd = { "lrcsnc" }, -- Default
      max_length = 60,
      icon = "♪"
    })
  end
}
