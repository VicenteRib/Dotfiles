vim.keymap.set("n", "<leader>pp", vim.cmd.Ex)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>gr', builtin.lsp_references, { desc = 'Telescope find references using lsp' })
vim.keymap.set('n', '<leader>gi', builtin.lsp_implementations, { desc = "Go to Implementations" })
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
local space = "·"
vim.opt.listchars:append {
        tab = "│─",
        trail = space,
}
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

vim.keymap.set("v", "<C-a>", "ggVG", {desc = "Select all"})

-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3

-- Function to jump to the next occurrence of specified characters in the current line
local function jump_to_prev_char()
    local line = vim.api.nvim_get_current_line()
    local col = vim.fn.col('.')
    local chars = { '%(', '%{', '<', '%['}
    local prev_pos = nil

    for _, char in ipairs(chars) do
        local pos = line:sub(1, col - 1):reverse():find(char)
        if pos and (not prev_pos or pos < prev_pos) then
            prev_pos = pos
        end
    end

    if prev_pos then
        vim.fn.cursor(0, col - prev_pos)
    end
end

local function jump_to_next_char()
        local line = vim.api.nvim_get_current_line()
        local col = vim.fn.col('.')
        local chars = { '%(', '%{', '<', '%['}
        local next_pos = nil

        for _, char in ipairs(chars) do
            local pos = line:find(char, col + 1)
            if pos and (not next_pos or pos < next_pos) then
                    next_pos = pos
            end
        end

        if next_pos then
                vim.fn.cursor(0, next_pos)
        end
end

vim.keymap.set('n', '<S-Tab>', jump_to_prev_char, { desc = 'Jump to previous occurrence of specified characters' })
vim.keymap.set('n', '<Tab>', jump_to_next_char, { desc = 'Jump to next occurrence of specified characters' })

vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Quick save' })

vim.keymap.set('n', '<leader>lq', ':q<CR>', { desc = 'Leave' })

vim.keymap.set('n', '<leader>+', ':resize +5<CR>', { desc = 'Increase split height' })
vim.keymap.set('n', '<leader>-', ':resize -5<CR>', { desc = 'Decrease split height' })
vim.keymap.set('n', '<leader>>', ':vertical resize +5<CR>', { desc = 'Increase split width' })
vim.keymap.set('n', '<leader><', ':vertical resize -5<CR>', { desc = 'Decrease split width' })

vim.api.nvim_set_keymap('n', '[[', ':<C-u>normal! [[<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ']]', ':<C-u>normal! ]]<CR>', { noremap = true, silent = true })
