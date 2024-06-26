local M = {

	"hrsh7th/nvim-cmp",
	dependencies = {
		{
			"hrsh7th/cmp-nvim-lsp",
			event = "InsertEnter",
		},
		{
			"hrsh7th/cmp-emoji",
			event = "InsertEnter",
		},
		{
			"hrsh7th/cmp-buffer",
			event = "InsertEnter",
		},
		{
			"hrsh7th/cmp-path",
			event = "InsertEnter",
		},
		{
			"hrsh7th/cmp-cmdline",
			event = "InsertEnter",
		},
		{
			"saadparwaiz1/cmp_luasnip",
			event = "InsertEnter",
		},
		{
			"L3MON4D3/LuaSnip",
			event = "InsertEnter",
			dependencies = {
				"rafamadriz/friendly-snippets",
			},
		},
		{
			"hrsh7th/cmp-nvim-lua",
		},
		{
			"tzachar/cmp-tabnine",
		},
		{
			"onsails/lspkind.nvim",
		},
	},
	event = "BufEnter",
}

function M.config()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	require("luasnip/loaders/from_vscode").lazy_load()

	vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
	-- vim.api.nvim_set_hl(0, "CmpItemKindTabnine", { fg = "#CA42F0" })
	vim.api.nvim_set_hl(0, "CmpItemKindCrate", { fg = "#F64D00" })
	vim.api.nvim_set_hl(0, "CmpItemKindEmoji", { fg = "#FDE030" })

	-- trust him we want this
	local check_backspace = function()
		local col = vim.fn.col(".") - 1
		return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
	end

	local icons = require("user.icons")
	local lspkind = require("lspkind")

	cmp.setup({
		snippet = {

			expand = function(args)
				luasnip.lsp_expand(args.body) -- For `luasnip` users.
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
			["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
			["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
			["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
			["<C-h>"] = function()
				if cmp.visible_docs() then
					cmp.close_docs()
				else
					cmp.open_docs()
				end
			end,
			["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
			["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
			["<C-e>"] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
			-- Accept currently selected item. If none selected, `select` first item.
			-- Set `select` to `false` to only confirm explicitly selected items.
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<Tab>"] = cmp.mapping(function(fallback)
				if luasnip.expandable() then
					luasnip.expand()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif cmp.visible() then
					cmp.select_next_item()
				elseif check_backspace() then
					fallback() -- act like tab
				-- require("neotab").tabout()
				else
					-- require("neotab").tabout()
					fallback()
				end
			end, {

				"i",
				"s",
			}),

			["<S-Tab>"] = cmp.mapping(function(fallback)
				if luasnip.jumpable(-1) then
					luasnip.jump(-1)
				elseif cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
		}),
		-- formatting = {
		-- 	fields = { "kind", "abbr", "menu" }, -- vscode like layout
		-- 	format = function(entry, vim_item)
		-- 		vim_item.kind = icons.kind[vim_item.kind]
		-- 		vim_item.menu = ({
		-- 			nvim_lsp = "",
		-- 			nvim_lua = "",
		-- 			luasnip = "",
		-- 			buffer = "",
		-- 			path = "",
		-- 			emoji = "",
		-- 		})[entry.source.name]
		--
		-- 		if entry.source.name == "emoji" then
		-- 			vim_item.kind = icons.misc.Smiley
		-- 			vim_item.kind_hl_group = "CmpItemKindEmoji"
		-- 		end
		--
		-- 		if entry.source.name == "cmp_tabnine" then
		-- 			vim_item.kind = icons.misc.Robot
		-- 			vim_item.kind_hl_group = "CmpItemKindTabnine"
		-- 		end
		-- 		return vim_item
		-- 	end,
		-- },
		formatting = {
			expandable_indicator = true,
			fields = { "kind", "abbr", "menu" }, -- vscode like layout
			format = lspkind.cmp_format({
				mode = "text_symbol",
				kind_order = {
					"Method",
					"Function",
					"Constructor",
					"Field",
					"Variable",
					"Class",
					"Text",
					"Interface",
					"Module",
					"Property",
					"Unit",
					"Value",
					"Enum",
					"Keyword",
					"Snippet",
					"Color",
					"File",
					"Reference",
					"Folder",
					"EnumMember",
					"Constant",
					"Struct",
					"Event",
					"Operator",
					"TypeParameter",
				},
				menu = {
					nvim_lsp = "[LSP]",
					path = "[Path]",
					buffer = "[Buffer]",
					luasnip = "[LuaSnip]",
					emoji = "[Emoji]",
					nvim_lua = "[Lua]",
				},
				maxwidth = 50,
				ellipsis_char = "...",
				show_labelDetails = true,
				before = function(entry, vim_item)
					return vim_item
				end,
			}),
		},
		sources = {
			{
				name = "nvim_lsp",
				entry_filter = function(entry, ctx)
					return require("cmp").lsp.CompletionItemKind.Text ~= entry:get_kind()
				end,
			},
			{ name = "luasnip" },
			{ name = "cmp_tabnine" },
			{ name = "nvim_lua" },
			{ name = "buffer" },
			{ name = "path" },
			{ name = "calc" },
			{ name = "emoji" },
			{ name = "treesitter" },
			{ name = "crates" },
			{ name = "tmux" },
		},
		confirm_opts = {
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		},

		completion = {
			completeopt = "menu,menuone,noinsert,noselect",
		},

		window = {
			completion = {
				border = "rounded",
				--winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None",
				--col_offset = -3,
				--side_padding = 1,
				scrollbar = false,
				--scrolloff = 8,
			},

			documentation = {
				border = "rounded",
				--winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,Search:None",
			},
		},
		experimental = {
			ghost_text = true,
		},
	})

	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "buffer" },
		}),
	})
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})

	pcall(function()
		-- local function on_confirm_done(...)
		--   require("nvim-autopairs.completion.cmp").on_confirm_done()(...)
		-- end
		-- require("cmp").event:off("confirm_done", on_confirm_done)
		-- require("cmp").event:on("confirm_done", on_confirm_done)
	end)
end

return M
