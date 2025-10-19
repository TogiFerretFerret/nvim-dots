return {
    "3rd/image.nvim",
	commit='4206c48a9f764a63f43022d6ab90ec04946bbc68',
    opts = {
		processor="magick_rock",
	},
	dependencies={
	"kiyoon/magick.nvim",
},
    init = function()
        package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
        package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
    end,

}
