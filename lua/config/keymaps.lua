vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

map("n", "<leader>ft", ":Oil<CR>", { desc = "Open Oil File Tree" })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "oil",
  callback = function()
    vim.keymap.set("n", "q", ":bd<CR>", { buffer = true, desc = "Close Oil" })
  end,
})
map("n", "<leader>tn", ":tabnew<CR>", { desc = "new tab buffer" })
map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "fuzzy find" })
map("n", "<leader>gf", ":Telescope live_grep<CR>", { desc = "grep text" })
map("n", "<leader>rf", ":Telescope oldfiles<CR>", { desc = "recent files" })
map("n", "<leader>bf", ":Telescope buffers<CR>", { desc = "find buffers" })
map("n", "<leader>lg", ":LazyGit<CR>", { desc = "lazygit" })
map("n", "<leader>ll", ":Lazy<CR>", { desc = "lazy dashboard" })
map("n", "<leader>tt", ":ToggleTerm direction=float<CR>", { desc = "terminal" })

