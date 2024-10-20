-- Line Numbers

vim.opt.number = true
vim.opt.relativenumber=true
vim.g.mapleader=' '
require("Vicente.lazy")
require("Vicente.remap")
require("Vicente.autocmd")
--Ctrl c and Ctrl v
vim.opt.clipboard:append("unnamedplus")
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', {noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-v>', '"+p', {noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-v>', '<C-r>+', {noremap = true, silent = true })
