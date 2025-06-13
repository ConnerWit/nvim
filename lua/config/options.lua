-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- UI
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.guicursor = ""

-- Diagnostics - always show error messages
vim.diagnostic.config({
  virtual_text = true,        -- Show errors inline
  signs = true,              -- Show error signs in gutter
  underline = true,          -- Underline errors
  update_in_insert = false,  -- Don't update while typing
  severity_sort = true,      -- Sort by severity
})

