return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
	dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "windwp/nvim-ts-autotag",
    },

	config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
          sync_install = false,
          highlight = { 
						enable = true,
		},
      })
    end,
}
