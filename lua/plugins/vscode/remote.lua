return {
  "nosduco/remote-sshfs.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  cmd = { "RemoteStart", "RemoteStop", "RemoteInfo" },
  opts = {
    -- Refer to the configuration section below
    -- or leave empty for defaults
  },
}
