vim.g.mapleader= " "
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("Vicente.plugins")
require('ibl').setup();
require("lualine").setup();
require('leap').create_default_mappings()
vim.cmd("colorscheme tokyonight-night")
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FF0000" })  -- Current line number
vim.api.nvim_set_hl(0, "LineNr", { fg = "#FF0000" })  -- Regular line numbers
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#FF0000" })  -- Relative line numbers above
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#FF0000" })  -- Relative line numbers below
vim.api.nvim_set_hl(0, 'MatchParen', { fg = '#ff0000', bg = '#000000', bold = true, reverse = true})
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
        automatic_installation = true,
        handlers = {},
        ensure_installed = {
          },
      }

    dapui.setup {
        icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
        controls = {
            icons = {
            pause = '⏸',
            play = '▶',
            step_into = '⏎',
            step_over = '⏭',
            step_out = '⏮',
            step_back = 'b',
            run_last = '▶▶',
            terminate = '⏹',
            disconnect = '⏏',
          },
        },
      }

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    require('dap-go').setup {
        delve = {
            detached = vim.fn.has 'win32' == 0,
        },
      }

--Avante
      local opts = {}  -- Define opts with any specific options you want to extend

      require("avante").setup(vim.tbl_deep_extend("force", {
            provider = "copilot",
            suggestions = {
              enabled = false,
            },
          }, opts))


