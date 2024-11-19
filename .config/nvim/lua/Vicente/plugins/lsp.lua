return {
    -- LSP Config
    {
        'neovim/nvim-lspconfig',
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lspconfig = require('lspconfig')

            -- Lua language server
            lspconfig.lua_ls.setup {
                settings = {
                    Lua = {
                        diagnostics = { globals = { 'vim' } },
                        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                        telemetry = { enable = false },
                    },
                },
            }

            -- Python language server (pyright)
            lspconfig.pyright.setup {
                settings = {
                    diagnostics = { globals = { 'vim' } },
                    workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                    telemetry = { enable = false },
                },
            }

            -- Java language server (jdtls)
            lspconfig.jdtls.setup {
                settings = {
                    diagnostics = { globals = { 'vim' } },
                    workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                    telemetry = { enable = false },
                },
            }
            lspconfig.ts_ls.setup({
                on_attach = function(_, bufnr)
                    -- Mappings for LSP functions
                    local opts = { noremap = true, silent = true }
                    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
                    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
                    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implemnntation()<CR>', opts)

                end,
            })

        end,
    },
    {
        'mfussenegger/nvim-jdtls',
    }
}
