return {
    "NStefan002/visual-surround.nvim",
    config = function()
        require("visual-surround").setup({
            -- your config
			surround_chars = { "{", "}", "[", "]", "(", ")", "'", "`"},
        })
        -- [optional] custom keymaps
    end,
}
