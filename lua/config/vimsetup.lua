vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Memory optimization settings
vim.opt.swapfile = false        -- Disable swap files to reduce disk I/O
vim.opt.backup = false           -- Disable backup files
vim.opt.writebackup = false      -- Disable write backup
vim.opt.maxmempattern = 2000     -- Limit pattern matching memory

vim.cmd("source ~/.config/nvim/main.vim")
vim.cmd("source ~/.config/nvim/rns.vim")
