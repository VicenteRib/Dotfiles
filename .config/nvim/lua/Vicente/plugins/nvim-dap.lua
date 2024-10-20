-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  'mfussenegger/nvim-dap',
  dependencies = {
    { 'rcarriga/nvim-dap-ui', event = 'VeryLazy', lazy = true },
    { 'nvim-neotest/nvim-nio', event = 'VeryLazy', lazy = true },
    { 'williamboman/mason.nvim', event = 'VeryLazy', lazy = true },
    { 'jay-babu/mason-nvim-dap.nvim', event = 'VeryLazy', lazy = true },
    { 'theHamsta/nvim-dap-virtual-text', event = 'VeryLazy', lazy = true },
    { 'leoluz/nvim-dap-go', event = 'VeryLazy', lazy = true },
  },
  event = 'VeryLazy',
  lazy = true,
  keys = function()
    local dap = require 'dap'
    local dapui = require 'dapui'
    return {
      { '<F5>', dap.continue, desc = 'Debug: Start/Continue' },
      { '<F1>', dap.step_into, desc = 'Debug: Step Into' },
      { '<F2>', dap.step_over, desc = 'Debug: Step Over' },
      { '<F3>', dap.step_out, desc = 'Debug: Step Out' },
      { '<leader>b', dap.toggle_breakpoint, desc = 'Debug: Toggle Breakpoint' },
      {
        '<leader>B',
        function()
          dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
        end,
        desc = 'Debug: Set Breakpoint',
      },
      { '<F7>', dapui.toggle, desc = 'Debug: See last session result.' },
    }
  end,
}
