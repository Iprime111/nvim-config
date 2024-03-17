return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        local lspconfig    = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local keymap       = vim.keymap
        local opts         = {noremap = true, silent = true}

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = "rounded",
        })

        local on_attach = function(client, bufnr)
            opts.buffer = bufnr

            opts.desc = "Show LSP references"
            keymap.set("n", "<leader>lr", "<cmd>Telescope lsp_references<CR>", opts)

            opts.desc = "Show LSP definitions"
            keymap.set("n", "<leader>ld", "<cmd>Telescope lsp_definitions<CR>", opts)

            opts.desc = "Show LSP implementations"
            keymap.set("n", "<leader>li", "<cmd>Telescope lsp_implementations<CR>", opts)

            opts.desc = "Show LSP type definitions"
            keymap.set("n", "<leader>lt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

            opts.desc = "Go to declaration"
            keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, opts)

            opts.desc = "Show code actions"
            keymap.set({"n", "v"}, "<leader>la", vim.lsp.buf.code_action, opts)

            opts.desc = "Smart rename"
            keymap.set("n", "<leader>sr", vim.lsp.buf.rename, opts)

            opts.desc = "Documentation"
            keymap.set("n", "<leader>do", vim.lsp.buf.hover, opts)

            opts.desc = "Buffer diagnostics"
            keymap.set("n", "<leader>bd", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

            opts.desc = "Line diagnostics"
            keymap.set("n", "<leader>dg", vim.diagnostic.open_float, opts)

            opts.desc = "Next diagnostics"
            keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

            opts.desc = "Previous diagnostics"
            keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

            opts.desc = "Restart LSP"
            keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)
        end

        local capabilities = cmp_nvim_lsp.default_capabilities()

        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
          local hl = "DiagnosticSign" .. type
          vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        lspconfig["clangd"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["cmake"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["html"].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })

        lspconfig["pyright"].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })

        lspconfig["tsserver"].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })

        lspconfig["asm_lsp"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            root_dir = function(fname)
                return vim.loop.cwd()
            end,
        })

        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = { -- custom settings for lua
                Lua = {
                -- make the language server recognize "vim" global
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                    -- make language server aware of runtime files
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })
    end,
}
