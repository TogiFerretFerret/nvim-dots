require("tokyonight").setup({
	transparent = true,
	plugins = {
		auto=true,
		nvimtree=true,
		telescope=true,
		codewindow=false,
	},
	on_colors = function(colors)
		-- Comments are unreadable with the default colorscheme # NOTE: STILL UNREADABLE ASSHOEL;
		colors.comment = "#c1c5f0"-- "#adb0b7"
		colors.hint = colors.cyan
		colors.error = "#ff0000"
		colors.warning = "#ffa000" -- warning, so less red than red
	end
})
vim.api.nvim_set_hl(0, 'NeominimapBorder', {fg = '#00ffff'})
