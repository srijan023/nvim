local M = {

	"nvim-telescope/telescope.nvim",

	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
		"nvim-telescope/telescope-file-browser.nvim",
	},
}

function M.config()
	local wk = require("which-key")
	wk.register({

		["<leader>bb"] = { "<cmd>Telescope buffers previewer=false<cr>", "[B]uffer list" },

		["<leader>fe"] = { "<cmd>Telescope file_browser<cr>", "Telescope file_browser" },
		["<leader>fb"] = { "<cmd>Telescope git_branches<cr>", "Checkout [b]ranch" },
		["<leader>fc"] = { "<cmd>Telescope colorscheme<cr>", "[C]olorscheme" },
		["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "[F]ind [f]iles" },
		["<leader>fp"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "[P]rojects" },
		["<leader>fg"] = { "<cmd>Telescope live_grep<cr>", "[G]rep Text" },
		["<leader>fs"] = { "<cmd>Telescope grep_string<cr>", "Find [S]tring" },
		["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "[H]elp" },
		["<leader>fH"] = { "<cmd>Telescope highlights<cr>", "[H]ighlights" },
		["<leader>fi"] = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
		["<leader>fl"] = { "<cmd>Telescope resume<cr>", "[L]ast Search" },
		["<leader>fM"] = { "<cmd>Telescope man_pages<cr>", "[M]an Pages" },

		["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "[R]ecent File" },
		["<leader>fR"] = { "<cmd>Telescope registers<cr>", "[R]egisters" },
		["<leader>fk"] = { "<cmd>Telescope keymaps<cr>", "[K]eymaps" },
		["<leader>fC"] = { "<cmd>Telescope commands<cr>", "[C]ommands" },

		["<leader>ls"] = { "<cmd>Telescope lsp_document_symbols<cr>", "Document [S]ymbols" },
		["<leader>lR"] = { "<cmd>Telescope lsp_references<cr>", "Lsp [R]eferences" },
		["<leader>lS"] = {
			"<cmd>Telescope lsp_dynamic_workspace_[s]ymbols<cr>",
			"Workspace Symbols",
		},
	})

	-- get cool looking file address
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "TelescopeResults",
		callback = function(ctx)
			vim.api.nvim_buf_call(ctx.buf, function()
				vim.fn.matchadd("TelescopeParent", "\t\t.*$")
				vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
			end)
		end,
	})

	local icons = require("user.icons")
	local actions = require("telescope.actions")
	local fb_actions = require("telescope._extensions.file_browser.actions")

	local function filenameFirst(_, path)
		local tail = vim.fs.basename(path)
		local parent = vim.fs.dirname(path)
		if parent == "." then
			return tail
		end
		return string.format("%s\t\t%s", tail, parent)
	end

	require("telescope").setup({
		defaults = {
			border = true,
			prompt_prefix = icons.ui.Telescope .. " ",
			selection_caret = icons.ui.Forward .. " ",

			entry_prefix = "   ",
			initial_mode = "insert",
			selection_strategy = "reset",
			path_display = { "smart" },
			color_devicons = true,
			set_env = { ["COLORTERM"] = "truecolor" },
			sorting_strategy = nil,
			layout_strategy = nil,
			layout_config = {},
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--hidden",
				"--glob=!.git/",
			},

			mappings = {

				i = {
					["<C-n>"] = actions.cycle_history_next,
					["<C-p>"] = actions.cycle_history_prev,

					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
				},
				n = {
					["<esc>"] = actions.close,

					["j"] = actions.move_selection_next,
					["k"] = actions.move_selection_previous,
					["q"] = actions.close,
				},
			},
		},
		pickers = {
			live_grep = {
				theme = "dropdown",
			},

			grep_string = {
				theme = "dropdown",
			},

			find_files = {
				theme = "dropdown",
				-- previewer = false,

				path_display = filenameFirst,
				initial_mode = "normal",
			},

			buffers = {
				theme = "dropdown",
				previewer = true,
				initial_mode = "normal",
				mappings = {
					i = {
						["<C-d>"] = actions.delete_buffer,
					},
					n = {
						["dd"] = actions.delete_buffer,
					},
				},
			},

			planets = {
				show_pluto = true,
				show_moon = true,
			},

			colorscheme = {
				enable_preview = true,
			},

			lsp_references = {
				theme = "dropdown",
				initial_mode = "normal",
			},

			lsp_definitions = {
				theme = "dropdown",
				initial_mode = "normal",
			},

			lsp_declarations = {
				theme = "dropdown",
				initial_mode = "normal",
			},

			lsp_implementations = {

				theme = "dropdown",
				initial_mode = "normal",
			},
		},
		extensions = {
			file_browser = {
				path = vim.loop.cwd(),
				cwd = vim.loop.cwd(),
				cwd_to_path = false,
				grouped = false,
				files = true,
				add_dirs = true,
				depth = 1,
				initial_mode = "normal",
				auto_depth = false,
				select_buffer = false,
				hidden = { file_browser = false, folder_browser = false },
				respect_gitignore = vim.fn.executable("fd") == 1,
				no_ignore = false,
				follow_symlinks = false,
				browse_files = require("telescope._extensions.file_browser.finders").browse_files,
				browse_folders = require("telescope._extensions.file_browser.finders").browse_folders,
				hide_parent_dir = false,
				collapse_dirs = false,
				prompt_path = false,
				quiet = false,
				dir_icon = "",
				dir_icon_hl = "Default",
				display_stat = { date = true, size = true, mode = true },
				hijack_netrw = false,
				use_fd = true,
				git_status = true,
				mappings = {
					["i"] = {
						["<A-c>"] = fb_actions.create,
						["<S-CR>"] = fb_actions.create_from_prompt,
						["<A-r>"] = fb_actions.rename,
						["<A-m>"] = fb_actions.move,
						["<A-y>"] = fb_actions.copy,
						["<A-d>"] = fb_actions.remove,
						["<C-o>"] = fb_actions.open,
						["<C-g>"] = fb_actions.goto_parent_dir,
						["<C-e>"] = fb_actions.goto_home_dir,
						["<C-w>"] = fb_actions.goto_cwd,
						["<C-t>"] = fb_actions.change_cwd,
						["<C-f>"] = fb_actions.toggle_browser,
						["<C-h>"] = fb_actions.toggle_hidden,
						["<C-s>"] = fb_actions.toggle_all,
						["<bs>"] = fb_actions.backspace,
					},
					["n"] = {
						["c"] = fb_actions.create,
						["r"] = fb_actions.rename,
						["m"] = fb_actions.move,
						["y"] = fb_actions.copy,
						["d"] = fb_actions.remove,
						["o"] = fb_actions.open,
						["g"] = fb_actions.goto_parent_dir,
						["e"] = fb_actions.goto_home_dir,
						["w"] = fb_actions.goto_cwd,
						["t"] = fb_actions.change_cwd,
						["f"] = fb_actions.toggle_browser,
						["h"] = fb_actions.toggle_hidden,
						["s"] = fb_actions.toggle_all,
					},
				},
			},
			fzf = {
				fuzzy = true, -- false will only do exact matching

				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter

				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			},
		},
	})
end

return M
