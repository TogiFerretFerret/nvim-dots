return {
  "azratul/live-share.nvim",
  dependencies = {
    "jbyuki/instant.nvim",
  },
  cmd = { "LiveShareJoin", "LiveShareStart", "LiveShareStop" },
  config = function()
    vim.g.instant_username = "RiverC"
    require("live-share").setup({
     -- Add your configuration here
    })
  end
}
