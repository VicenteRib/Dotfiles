return {
    {
        "nvim-java/nvim-java",
        lazy = true,
        config = function()
            require("java").setup({
                -- your nvim-java configuration goes here
            })
        end,
        dependencies = {
            {
                "neovim/nvim-lspconfig",
                opts = {
                    servers = {
                        jdtls = {
                            -- your jdtls configuration goes here
                        },
                    },
                    setup = {
                        jdtls = function()
                            require("java").setup({
                                -- your nvim-java configuration goes here
                            })
                        end,
                    },
                },
            },
        },
    },
    {
        "tomblind/local-lua-debugger-vscode",
        lazy = true,
    },
}
