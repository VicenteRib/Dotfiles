require("Vicente.lazy")
require("Vicente.remap")
require("Vicente.autocmd")
-- Line Numbers
vim.api.nvim_set_hl(0, "LineNr", { fg = "#FF0000" })  -- Regular line numbers
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FF0000" })  -- Current line number
require('leap').create_default_mappings()

vim.opt.number = true
vim.opt.relativenumber=true
vim.g.mapleader=' '
--Ctrl c and Ctrl v
vim.opt.clipboard:append("unnamedplus")
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', {noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-v>', '"+p', {noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-v>', '<C-r>+', {noremap = true, silent = true })
