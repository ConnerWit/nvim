vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set


-- Local keymaps
map("n", "<leader>tt", ":vert term<CR>")

-- Telescope keymaps
map("n", "<leader>ff", ":Telescope find_files<CR>")
map("n", "<leader>gf", ":Telescope live_grep<CR>")
map("n", "<leader>bf", ":Telescope buffers<CR>")
map("n", "<leader>rf", ":Telescope oldfiles<CR>")

-- Lazy keymaps
map("n", "<leader>ll", ":Lazy<CR>")

-- LSP keymaps
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
map("n", "<leader>e", vim.diagnostic.open_float)
map("n", "<leader>q", vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(event)
    local opts = { buffer = event.buf }

    map("n", "gd", vim.lsp.buf.definition, opts)
    map("n", "gD", vim.lsp.buf.declaration, opts)
    map("n", "gr", vim.lsp.buf.references, opts)
    map("n", "gi", vim.lsp.buf.implementation, opts)
    map("n", "K", vim.lsp.buf.hover, opts)
    map("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    map("n", "<leader>rn", vim.lsp.buf.rename, opts)
    map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    map("n", "<leader>F", function()
      vim.lsp.buf.format { async = true }
    end, opts)
    
    -- Telescope LSP pickers
    map("n", "<leader>ld", ":Telescope lsp_definitions<CR>", opts)
    map("n", "<leader>lr", ":Telescope lsp_references<CR>", opts)
  end,
})
