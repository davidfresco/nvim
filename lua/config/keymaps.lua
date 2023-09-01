-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local noremap = { noremap = true }
local remap = { remap = true }

require("noice") -- load noice now so the <C-f> bind doesnt get overwritten
map("n", "<C-f>", "<Cmd>Neotree focus<CR>", noremap)

-- some lsp binds
map("n", "ge", vim.diagnostic.open_float, noremap)
map("n", "gR", vim.lsp.buf.rename, noremap)

map("n", "<C-_>", "V<C-_>", remap)
map("v", "<C-_>", "gc", remap) -- group comment to ctrl-/
map("n", "<C-d>", "<Cmd>q<CR>", noremap) -- :q to ctrl-d

map("n", "<C-h>", "<Cmd>TmuxNavigateLeft<CR>", noremap)
map("n", "<C-j>", "<Cmd>TmuxNavigateDown<CR>", noremap)
map("n", "<C-k>", "<Cmd>TmuxNavigateUp<CR>", noremap)
map("n", "<C-l>", "<Cmd>TmuxNavigateRight<CR>", noremap)

map("i", "<M-h>", "<C-o>h", noremap)
map("i", "<M-j>", "<C-o>j", noremap)
map("i", "<M-k>", "<C-o>k", noremap)
map("i", "<M-l>", "<C-o>l", noremap)
