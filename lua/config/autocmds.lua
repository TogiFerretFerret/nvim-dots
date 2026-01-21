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
local api = vim.api

-- Create a group to prevent duplication
local prose_group = api.nvim_create_augroup("ProseMode", { clear = true })

api.nvim_create_autocmd("FileType", {
  group = prose_group,
  pattern = { "markdown", "text", "tex" }, -- Add "gitcommit" if you want
  callback = function()
    local opt = vim.opt_local
    
    -- 1. VISUAL WRAPPING
    opt.wrap = true
    opt.linebreak = true        -- Break lines at words, not characters
    opt.breakindent = true      -- Wrapped lines keep the same indentation level
    opt.breakindentopt = "shift:2" -- Shift wrapped lines slightly for visual clarity

    -- 2. SPELL CHECKING
    opt.spell = true
    opt.spelllang = "en_us"     -- Adjust if you write in other languages

    -- 3. NAVIGATION (The most important part)
    -- Remap j/k to move by VISUAL line, not physical line
    -- This means if one line wraps 5 times, 'j' goes to the next visual row
    local map_opts = { buffer = true, silent = true }
    vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, buffer = true })
    vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, buffer = true })
    
    -- Remap 0 and $ to respect visual wrapping
    vim.keymap.set({ "n", "x" }, "0", "g0", map_opts)
    vim.keymap.set({ "n", "x" }, "$", "g$", map_opts)

    -- 4. AESTHETICS (Optional)
    -- If you use specific fillchars, this makes the wrapping look cleaner
    opt.fillchars:append({ eob = " " }) -- Hide the ~ at end of buffer
  end,
})
