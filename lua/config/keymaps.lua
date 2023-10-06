require("lazyvim.config.keymaps") -- load default lazyvim maps so they dont get overwritten
require("noice") -- load noice now so the <C-f> bind doesnt get overwritten

local map = vim.keymap.set
local noremap = { noremap = true }
local remap = { remap = true }

-- neotree to ctrl-f (very important !!1!)
map("n", "<C-f>", "<Cmd>Neotree focus<CR>", noremap)

map("n", "<leader>ut", "<Cmd>TransparentToggle<CR>", { desc = "Toggle background transparency" })
map("n", "<leader>ug", function()
	vim.cmd([[
        IndentBlanklineToggle
    ]])
	vim.b.miniindentscope_disable = not vim.b.miniindentscope_disable
end, { desc = "Toggle indent guides" })

-- some lsp binds from my old nvim config
map("n", "ge", vim.diagnostic.open_float, noremap)
map("n", "gR", vim.lsp.buf.rename, noremap)

-- group comment to ctrl-/ in normal and visual mode
map("n", "<C-_>", "V<C-_>", remap)
map("v", "<C-_>", "gc", remap)

map("n", "<C-x>", "<Cmd>q<CR>", noremap) -- :q to ctrl-x

-- tmux navigation keys
map("n", "<C-h>", "<Cmd>TmuxNavigateLeft<CR>", noremap)
map("n", "<C-j>", "<Cmd>TmuxNavigateDown<CR>", noremap)
map("n", "<C-k>", "<Cmd>TmuxNavigateUp<CR>", noremap)
map("n", "<C-l>", "<Cmd>TmuxNavigateRight<CR>", noremap)

-- insert mode navigation keys
map("i", "<M-h>", "<Left>", remap)
map("i", "<M-j>", "<Down>", remap)
map("i", "<M-k>", "<Up>", remap)
map("i", "<M-l>", "<Right>", remap)
map("i", "<C-M-h>", "<C-o>b", noremap)
map("i", "<C-M-l>", "<C-o>w", noremap)
map("i", "<M-BS>", "<Del>", noremap)

-- highlight and quote word shortcuts
map("n", "vv", "viw", remap)
map("v", '"', 'gza"', remap)

-- big scroll keys
map("n", "<A-k>", "<PageUp>", noremap)
map("n", "<A-j>", "<PageDown>", noremap)

-- stylua: ignore
map("i", "<C-A-k>", function() require("cmp").scroll_docs(-5) end, noremap)
-- stylua: ignore
map("i", "<C-A-j>", function() require("cmp").scroll_docs(5) end, noremap)
