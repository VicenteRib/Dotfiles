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
                    -- Enable completion triggered by <c-x><c-o>
                    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

                    -- Mappings for LSP functions
                    local opts = { noremap = true, silent = true }
                    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
                    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
                    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
                    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
                end,
            })

        end,
    },
    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lua',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
        },
        config = function()
            -- init.lua
            require('luasnip.loaders.from_vscode').lazy_load()
            local luasnip = require('luasnip')
            local cmp = require('cmp')
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                mapping = {
                    ['<C-k>'] = cmp.mapping.select_prev_item(), -- Previous suggestion
                    ['<C-j>'] = cmp.mapping.select_next_item(), -- Next suggestion
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4), -- Scroll documentation
                    ['<C-f>'] = cmp.mapping.scroll_docs(4), -- Scroll documentation
                    ['<C-Space>'] = cmp.mapping.complete(), -- Trigger completion
                    ['<C-e>'] = cmp.mapping.abort(), -- Cancel completion
                    ['<CR>'] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    },
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(), -- SuperTab for previous completion
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        local copilot = require 'copilot.suggestion'

                        if copilot.is_visible() then
                            copilot.accept()
                        elseif cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end)
                },
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                    { name = 'path' },
                    { name = 'cmdline' },
                    { name = 'nvim_lua' },
                    { name = 'copilot', keyword_length = 1 }, -- Copilot source
                }),
            })

            -- Optional: Set up command-line completion
            cmp.setup.cmdline(':', {
                sources = {
                    { name = 'cmdline' }
                }
            })
        end,
    },
}
