return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup{
			open_mapping    = [[<c-\>]],
			hide_numbers    = true,
			autochdir       = false,
			shade_terminals = true,
			start_in_insert = true,
			insert_mappings = true,
			persist_size		= true,
			persist_mode    = true,
			direction				= "horizontal",
			close_on_exit		= false,
			shell 					= vim.o.shell,
			auto_scroll			= true,
			winbar = {
				enabled = false,
				name_formatter = function(term)
      		return term.name
    		end,
			},
		}

		local keymap = vim.keymap

        -- keymap.set("n", "<leader>tr", "<cmd>ToggleTerm<CR>", { desc = "Toggles terminal"})
		-- keymap.set("t", "<esc>", "<cmd>ToggleTerm<CR>", {desc = "Toggles terminal"})
	end,
} 
