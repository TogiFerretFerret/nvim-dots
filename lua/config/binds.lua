-- TODO: Refactor keybinds to be more organized (date: never [will do never, probably])
--------------------------------------------------------------------------
-- Snippet Navigation (Native Vim Snippets)
--------------------------------------------------------------------------
vim.keymap.set({"i", "s"}, "<C-n>", function()
  if vim.snippet.active({direction = 1}) then
    return vim.snippet.jump(1)
  end
end, { desc = "Jump to next snippet placeholder" })

vim.keymap.set({"i", "s"}, "<C-p>", function()
  if vim.snippet.active({direction = -1}) then
    return vim.snippet.jump(-1)
  end
end, { desc = "Jump to previous snippet placeholder" })

--------------------------------------------------------------------------
-- Window Navigation
--------------------------------------------------------------------------
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Resizing
-- Remap Ctrl + arrow keys to resize splits
-- Normal and Visual modes
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize +1<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize -1<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize -1<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize +1<CR>', { silent = true, noremap = true })


--------------------------------------------------------------------------
-- Buffer Management
--------------------------------------------------------------------------
vim.keymap.set({"n", "v", "i"}, "<M-Tab>", "<Cmd>BufferNext<CR>", { desc = "Next buffer" })
vim.keymap.set({"n", "v", "i"}, "<M-S-Tab>", "<Cmd>BufferPrevious<CR>", { desc = "Previous buffer" })
vim.keymap.set({"n", "v", "i"}, "<M-w>", "<Cmd>BufferClose<CR>", { desc = "Close buffer" })
vim.keymap.set({"n", "v", "i"}, "<C-S-t>", "<Cmd>BufferRestore<CR>", { desc = "Restore buffer" })
vim.keymap.set({"n", "v", "i"}, "<M-t>", "<Cmd>new | q<CR>", { desc = "New buffer" })

--------------------------------------------------------------------------
-- General Editing
--------------------------------------------------------------------------
vim.keymap.set({"n", "i", "v"}, "<C-s>", function()
    vim.cmd[[w]]
end, { desc = "Save file" })

--------------------------------------------------------------------------
-- Plugins: Telescope, CompetiTest, Copilot
--------------------------------------------------------------------------
-- Telescope
vim.keymap.set("n", "<C-q>", function()
  require("telescope").extensions.pomodori.timers()
end, { desc = "Manage Pomodori Timers" })
vim.keymap.set("n", "<M-v>", function()
  vim.cmd[[Telescope neoclip]]
end, { desc = "NeoClip" })

-- CompetiTest
-- Option key bind is meta
vim.keymap.set("n", "<M-p>", function()
  vim.cmd[[CompetiTest receive problem]]
end, { desc = "Receive problem" })
vim.keymap.set({"n", "v", "i"}, "<M-r>", function()
  vim.cmd[[CompetiTest run]]
end, { desc = "Run problem" })

-- Copilot
vim.keymap.set("i", "<Tab>", function()
  if require("copilot.suggestion").is_visible() then
    require("copilot.suggestion").accept()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
  end
end, { silent = true, noremap = true })


--------------------------------------------------------------------------
-- Plugins: NvimTree & LspUI
--------------------------------------------------------------------------
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>f", "<cmd>NvimTreeFindFile<CR>")
vim.keymap.set("n", "<leader>d", "<cmd>LspUI hover<CR>")
vim.keymap.set("n", "gr", "<cmd>LspUI reference<CR>")
vim.keymap.set("n", "gd", "<cmd>LspUI definition<CR>")
vim.keymap.set("n", "gt", "<cmd>LspUI type_definition<CR>")
vim.keymap.set("n", "gi", "<cmd>LspUI implementation<CR>")
vim.keymap.set("n", "<leader>rn", "<cmd>LspUI rename<CR>")
vim.keymap.set("n", "<leader>ca", "<cmd>LspUI code_action<CR>")
vim.keymap.set("n", "<leader>ci", "<cmd>LspUI call_hierarchy incoming_calls<CR>")
vim.keymap.set("n", "<leader>co", "<cmd>LspUI call_hierarchy outgoing_calls<CR>")
--------------------------------------------------------------------------
-- Compiler Commands
--------------------------------------------------------------------------
vim.keymap.set('n', '<F6>', '<cmd>CompilerOpen<cr>', { noremap = true, silent = true })
-- Redo last selected option
vim.keymap.set('n', '<F8>', '<cmd>CompilerStop<cr><cmd>CompilerRedo<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<F7>', '<cmd>CompilerToggleResults<cr>', { noremap = true, silent = true })

--------------------------------------------------------------------------
-- Codeforces Helper
--------------------------------------------------------------------------
-- option-s? something for CFStatus
vim.keymap.set('n', '<leader>cfs', '<cmd>CFStatus<cr>', { noremap = true, silent = true, desc = "Codeforces Status" })
vim.keymap.set('n', '<leader>css', '<cmd>CsesStatus<cr>', { noremap = true, silent = true, desc = "CSES Status" })
