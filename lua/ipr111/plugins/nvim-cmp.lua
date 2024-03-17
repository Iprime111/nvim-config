return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},

	config = function()
		local cmp 	  = require("cmp")
		local mapping = cmp.mapping
		local luasnip = require("luasnip")

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = mapping.preset.insert({
				["<C-k>"] 		= mapping.select_prev_item(),
				["<C-j>"]    	= mapping.select_next_item(),
				["<C-b>"]		= mapping.scroll_docs(-4),
				["<C-f>"]		= mapping.scroll_docs(4),
				["<C-Space>"]   = mapping.complete(),
				["<C-x>"]		= mapping.abort(),
				["<CR>"]		= mapping.confirm({ select = false }),
                ["<tab>"]       = mapping.confirm({ select = false }),
			}),
			sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip"  },
				{ name = "buffer"   },
				{ name = "path"	    },
			}),
            window = {
                completion    = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
		})
	end,
}
