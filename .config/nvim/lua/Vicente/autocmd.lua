
-- Create an autocommand group
local augroup = vim.api.nvim_create_augroup("MyAutoCmdGroup", { clear = true })

-- Define the autocommand
vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup,
  pattern = "*",
  command = "set formatoptions-=cro"
})
