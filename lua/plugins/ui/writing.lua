return {
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    keys = {
      { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode (Writer Focus)" },
    },
    dependencies = { "folke/twilight.nvim" },
    
    init = function()
      -- 1. Register *.fic as filetype 'prose'
      vim.filetype.add({
        extension = {
          fic = "prose",
        },
      })

      -- 2. Watch for the 'prose' filetype specifically
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "prose",
        callback = function()
          -- Set syntax to markdown for colors (Bold/Italic), but keep filetype 'prose'
          vim.cmd("set syntax=markdown")
          
          -- DISABLE DIAGNOSTICS (The Red Line Fix)
          -- This stops NvimTree from marking the file as having errors
          vim.diagnostic.enable(false, { bufnr = 0 })
          
          vim.schedule(function()
            local opt = vim.opt_local

            -- KILL LINE NUMBERS
            opt.number = false
            opt.relativenumber = false

            -- VISUAL WRAPPING
            opt.wrap = true
            opt.linebreak = true        
            opt.breakindent = true      
            opt.breakindentopt = "shift:2" 

            -- SPELL CHECKING (Native Vim, not LSP)
            opt.spell = true
            opt.spelllang = "en_us"

            -- NAVIGATION FIX
            local map_opts = { buffer = true, silent = true }
            vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, buffer = true })
            vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, buffer = true })
            vim.keymap.set({ "n", "x" }, "0", "g0", map_opts)
            vim.keymap.set({ "n", "x" }, "$", "g$", map_opts)
          end)
        end,
      })
    end,

    opts = {
      window = {
        backdrop = 0.95,
        width = 80,     
        options = {
          signcolumn = "no",      
          number = false,         
          relativenumber = false, 
          cursorline = false,     
          foldcolumn = "0",       
        },
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false,   
          showcmd = false, 
        },
        twilight = { enabled = true }, 
        gitsigns = { enabled = false },
        tmux = { enabled = true },     
      },
      on_open = function(win)
        local wo = vim.wo[win]
        wo.wrap = true
        wo.linebreak = true
        wo.breakindent = true
        wo.spell = true
        wo.number = false 
        wo.relativenumber = false
      end,
    },
  },
  
  {
    "folke/twilight.nvim",
    opts = {
      dimming = { alpha = 0.25 },
      context = 10, 
      expand = {
        "markdown",
        "text",
        "prose", 
      },
    },
  }
}
