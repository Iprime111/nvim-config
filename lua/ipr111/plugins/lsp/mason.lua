return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},

	config = function()
		local mason          = require("mason")
		local lspconfig 	 = require("mason-lspconfig")
		local tool_installer = require("mason-tool-installer")

		mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        lspconfig.setup({
        -- list of servers for mason to install
            ensure_installed = {
	        	"clangd",
                "cmake",
                "html",
                "lua_ls",
                "pyright",
                "tsserver",
                "asm_lsp",
            },
             -- auto-install configured servers (with lspconfig)
            automatic_installation = true, -- not the same as ensure_installed
        })
    end,
}
