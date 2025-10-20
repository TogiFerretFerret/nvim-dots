local M = {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-calc",
		-- "hrsh7th/cmp-copilot",
		"hrsh7th/cmp-emoji",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-path",
		"f3fora/cmp-spell",
		"lukas-reineke/cmp-rg",
		"kristijanhusak/vim-dadbod-completion",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		
		-- command line
		"hrsh7th/cmp-cmdline",
		"dmitmel/cmp-cmdline-history",

		-- search
		"hrsh7th/cmp-buffer",
	},
}

M.config = function()
	local cmp = require("cmp")
	local lspkind = require("lspkind")
	local has_words_before = function()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0
			and vim.api
					.nvim_buf_get_lines(0, line - 1, line, true)[1]
					:sub(col, col)
					:match("%s")
				== nil
	end

	cmp.setup({
		mapping = {
			["<C-e>"] = cmp.mapping.abort(),
			["<C-j>"] = cmp.mapping.scroll_docs(4),
			["<C-k>"] = cmp.mapping.scroll_docs(-4),
			["<Down>"] = cmp.mapping(
				cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
				{ "i" }
			),
			["<Up>"] = cmp.mapping(
				cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
				{ "i" }
			),
			['<M-CR>'] = cmp.mapping.confirm({ select = true }),
			['<CR>'] = cmp.mapping.confirm({ select = false }),
			-- Tab is used by Copilot, use <C-Space>
			["<C-Space>"] = cmp.mapping(function(fallback)
				if has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end, { "i", "s" }),
		},

		sources = {
			{ name = "nvim_lsp" },
			{ name = "nvim_lsp_signature_help" },
			{ name = "copilot" },
			{ name = "path" },
			{ name = "buffer" },
			{ name = "nvim_lua" },

			{ name = "calc" },
			{ name = "emoji" },
			{ name = "spell", keyword_length = 4 },
			{ name = "rg", dup = 0 },
			{ name = "vim-dadbod-completion" },
			{ name = "render-markdown" },
		},

		snippet = {
			expand = function(args)
				vim.snippet.expand(args.body)
			end,
		},

		window = {
			completion = cmp.config.window.bordered({
				col_offset = -3,
				side_padding = 0,
				winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
			}),
			documentation = cmp.config.window.bordered({
				winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
			}),
		},
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(entry, vim_item)
				local kind = lspkind.cmp_format({
					mode = "symbol_text",
					maxwidth = 50,
				})(entry, vim_item)

				local strings = vim.split(kind.kind, "%s", { trimempty = true })

				if strings[1] ~= "Copilot" then
					kind.kind = " " .. strings[1] .. " "
				else
					kind.kind = " " .. vim.fn.nr2char(0xe708) .. " "
					kind.menu = "    (" .. "copilot" .. ")"
				end

				return kind
			end,
		},
		view = {
			entries = { name = "custom", selection_order = "near_cursor" },
		},

		experimental = {
			ghost_text = true,
		},
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline({}),
		sources = {
			{ name = "cmdline" },
			{ name = "cmdline_history" },
			{ name = "path" },
		},
	})

	cmp.setup.cmdline("/", {
		mapping = cmp.mapping.preset.cmdline({}),
		sources = {
			{ name = "buffer" },
		},
	})
end

return M
