return {
    "nvim-neorg/neorg",--temporary
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = function()
	require("neorg").setup {
	  load = {
		["core.defaults"] = {}, -- Load all the default modules
		["core.concealer"] = {}, -- Allows for use of icons
		["core.completion"] = {
			config = {
				engine = "nvim-cmp",
			}
		},
		["core.integrations.nvim-cmp"] = {},
		["core.integrations.image"] = {},
		["core.latex.renderer"] = {},
	["core.autocommands"] = {},
	["core.highlights"] = {},
	["core.integrations.treesitter"] = {},
	["core.keybinds"]={},
	["core.ui"]={},
	["core.neorgcmd"] = {},
	["core.looking-glass"]={},
	["core.dirman"]={
		config = {
			workspaces = {
				Notes = "/home/river/notes",
				Research = "/home/river/research/notes",
			}
		}
	},
	["core.ui.calendar"]={},
	  },
	}
    vim.wo.conceallevel = 2
	vim.wo.foldlevel = 99
end,
}
