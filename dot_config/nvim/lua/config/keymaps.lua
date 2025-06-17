-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set = vim.keymap.set

-- vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false })
-- vim.keymap.set("i", "jj", "<Esc>", { noremap = false, silent = true })
set("n", "gh", "^", { desc = "Go to first non-whitespace character", noremap = false })
set("n", "gl", "$", { desc = "Go to end of line", noremap = false })
set("n", "<leader>xr", "<cmd>source %<CR>", { desc = "Execute the current file" })
