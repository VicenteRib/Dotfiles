vim.keymap.set("n", "<leader>pp", vim.cmd.Ex)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'Telescope word grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })

--Identation
vim.o.sw = 4
vim.o.ts = 4
vim.o.et = true
vim.o.smartindent = true

vim.opt.list = true
vim.opt.listchars = { space = '⋅', tab = '» ', trail = '·', }

vim.opt.inccommand = 'split'

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.o.breakindent = true

vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.api.nvim_create_autocmd('TextYankPost', {
      desc = 'Highlight when yanking (copying) text',
      group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
      callback = function()
        vim.highlight.on_yank()
      end,
})

-- Save undo history.
vim.o.undofile = true
vim.opt.undodir = os.getenv("HOME") .. '/.config/nvim/undodir'

vim.opthlsearch = false
vim.optincsearch = true

-- Case insensitive searching UNLESS /C or the search has capitals.
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default.
vim.wo.signcolumn = 'yes'

-- Decrease update times and timeouts.
vim.o.updatetime = 200
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience.
vim.o.completeopt = 'menuone,noselect,noinsert'

-- Disable some of those annoying hit-enter messages.
vim.opt.shortmess:append 'IWs'

--Harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)

vim.keymap.set("n", "<C-1>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-2>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-3>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-4>", function() ui.nav_file(4) end)
vim.keymap.set("n", "<C-5>", function() ui.nav_file(5) end)
vim.keymap.set("n", "<C-6>", function() ui.nav_file(6) end)
vim.keymap.set("n", "<C-7>", function() ui.nav_file(7) end)
vim.keymap.set("n", "<C-8>", function() ui.nav_file(8) end)
vim.keymap.set("n", "<C-9>", function() ui.nav_file(9) end)

--Undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

--Nvim-fugitive
vim.keymap.set('n', '<leader>gs', vim.cmd.Gstatus)

function Surround(w_or_W)
        local open_char = vim.fn.input("Surround with: ")
    local closed_char = nil
        if open_char == "(" then closed_char = ")" end
    if open_char == "[" then closed_char = "]" end
    if open_char == "{" then closed_char = "}" end
    if open_char == "<" then closed_char = ">" end
    if open_char == "'" then closed_char = "'" end
    if open_char == '"' then closed_char = '"' end
    if open_char == "`" then closed_char = "`" end
    if open_char == "/" then closed_char = "/" end
    if open_char == "|" then closed_char = "|" end

    if w_or_W == "w" then
                vim.cmd("normal! ciw" .. open_char)
    elseif w_or_W == "W" then
                vim.cmd([[normal! ciW]] .. open_char)
    end
    vim.cmd("normal! p")
    vim.cmd("normal! a" .. closed_char)
    vim.cmd("normal! a")
end

vim.api.nvim_set_keymap("n", "<leader>sw", ":lua Surround('w')<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>sW", ":lua Surround('W')<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<ESC>", ":noh<CR>", { noremap = true, silent = true })

vim.opt.wrap = false

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 250

vim.opt.colorcolumn = '80'

--Move selected line 1 up or down respectively
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc = "Move selected line down"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc = "Move selected line up"})

-- Move next line back
vim.keymap.set("n", "J", "mzJ`z", {desc = "Move next line back"})

--Move half page up or down
vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc = "Move half page down"})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {desc = "Move half page up"})

--Search with a the cursor in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--Void remove
vim.keymap.set("x", "<leader>p", "\"_dP")

--Tmux sessions
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

--Substite current word
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>//g<left><left>", {desc = "Substitute current world in the file"})

vim.o.sidescrolloff = 0

vim.keymap.set("n", "<C-a>", "ggVG", {desc = "Select all"})
vim.keymap.set("i", "<C-a>", "ggVG", {desc = "Select all"})
vim.keymap.set("v", "<C-a>", "ggVG", {desc = "Select all"})

vim.api.nvim_set_hl(0, 'MatchParen', { fg = '#ff0000', bg = '#000000', bold = true, reverse = true})

