return{
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',  -- Automatically update Treesitter parsers
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = { "lua", "python", "javascript", "html", "css" },  -- List of languages
            highlight = {
                enable = true,  -- Enable Treesitter-based syntax highlighting
                additional_vim_regex_highlighting = false,  -- Disable regex highlighting
            },
            indent = {
                enable = true,  -- Enable better indentation
            },
            incremental_selection = {
                enable = true,  -- Enable incremental selection
                keymaps = {
                    init_selection = 'gnn',  -- Start selection
                    node_incremental = 'grn',  -- Increment to the upper named parent
                    scope_incremental = 'grc',  -- Increment to the upper scope
                    node_decremental = 'grm',  -- Decrement to the previous node
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,  -- Automatically jump forward to the next text object
                    keymaps = {
                        ["af"] = "@function.outer",  -- Select around a function
                        ["if"] = "@function.inner",  -- Select inside a function
                        ["ac"] = "@class.outer",     -- Select around a class
                        ["ic"] = "@class.inner",     -- Select inside a class
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true,  -- Whether to set jumps in the jumplist
                    goto_next_start = {
                        ["]f"] = "@function.outer",
                        ["]c"] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["[f"] = "@function.outer",
                        ["[c"] = "@class.outer",
                    },
                },
            },
            -- Additional Treesitter modules
            autotag = {
                enable = true,  -- Automatically close and rename HTML/JSX tags
            },
            rainbow = {
                enable = true,  -- Enable rainbow parentheses
                extended_mode = true,  -- Highlight non-bracket delimiters
            },
        }
    end
}
