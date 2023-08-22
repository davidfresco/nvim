-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local map = vim.keymap.set
local unmap = vim.keymap.del

unmap("n", "<C-f>")
map("n", "ge", vim.diagnostic.open_float, { noremap = true })
map("n", "gR", vim.lsp.buf.rename, { noremap = true })
map("n", "ff", ":Neotree focus<CR>", { noremap = true })

vim.cmd([[
set nowrap
set number
set norelativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set mouse=c

noremap <C-d> :q<CR>
noremap } :bnext<CR>
noremap { :bp<CR>
]])

function P(arg)
	print(vim.inspect(arg))
end

function TSInspect()
	P(vim.treesitter.get_captures_at_cursor(0))
end
