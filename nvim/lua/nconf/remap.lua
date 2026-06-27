vim.g.mapleader = " "
vim.keymap.set("n", "<leader>q", vim.cmd.Ex)

local harpoon = require("harpoon")
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>gs", builtin.git_status)
vim.keymap.set("n", "<leader>gc", builtin.git_commits)
vim.keymap.set("n", "<leader>gb", builtin.git_branches)
vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<CR>")
vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>")
vim.keymap.set("n", "<leader>ghh", "<cmd>Gitsigns preview_hunk<CR>")
vim.keymap.set("n", "<leader>gss", "<cmd>Gitsigns stage_hunk<CR>")
vim.keymap.set("n", "<leader>grr", "<cmd>Gitsigns reset_hunk<CR>")
vim.keymap.set("n", "<leader>t", "<cmd>terminal<CR>")

harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover docs" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Hover diagnostics" })

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
