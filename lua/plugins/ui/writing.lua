return {
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    keys = {
      { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode (Writer Focus)" },
    },
    dependencies = { "folke/twilight.nvim" },
    opts = {
      window = {
        backdrop = 0.95, -- Nearly opaque background for isolation
        width = 80,      -- The "Golden Ratio" for readability
        height = 1,      -- Full height
        options = {
          signcolumn = "no",      -- Hide the git signs/diagnostics
          number = false,         -- No line numbers
          relativenumber = false, -- No relative numbers
          cursorline = false,     -- No highlighting the current line
          cursorcolumn = false,   -- No crosshair
          foldcolumn = "0",       -- No folds
          list = false,           -- Hide whitespace characters
        },
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false,   -- Hide the ruler (line/col info) in status
          showcmd = false, -- Hide the partial command characters
        },
        twilight = { enabled = true }, -- Dims inactive paragraphs (Game Changer)
        gitsigns = { enabled = false },
        tmux = { enabled = true },     -- Hides the tmux status bar
        kitty = {
          enabled = true,
          font = "+4", -- Increases font size if you use Kitty (optional)
        },
      },
      
      -- THE MONEY MAKER: Auto-configure Prose Settings on Open
      on_open = function(win)
        local wo = vim.wo[win]
        
        -- Enable Soft Wrapping (Visual wrap only, no newlines)
        wo.wrap = true
        wo.linebreak = true
        wo.breakindent = true
        
        -- Enable Spellcheck
        wo.spell = true
        
        -- Remap movement to visual lines (so 'j' goes down one visual line, not one code line)
        -- We map these buffer-locally so they apply to the text file
        local map_opts = { buffer = true, silent = true }
        vim.keymap.set("n", "j", "gj", map_opts)
        vim.keymap.set("n", "k", "gk", map_opts)
        vim.keymap.set("n", "0", "g0", map_opts)
        vim.keymap.set("n", "$", "g$", map_opts)
      end,
      
      -- (Optional) Turn off spellcheck when leaving if you want
      on_close = function()
        vim.wo.spell = false
      end,
    },
  },
  
  -- Dependency Config: Highlights only the paragraph you are working on
  {
    "folke/twilight.nvim",
    opts = {
      dimming = {
        alpha = 0.25, -- Amount of dimming
      },
      context = 10, -- Amount of lines to keep visible around cursor
      expand = { -- Things to never dim
        "markdown",
        "text",
      },
    },
  }
}
