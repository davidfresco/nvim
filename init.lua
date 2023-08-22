-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.keymap.set("n", "ge", vim.diagnostic.open_float, { noremap = true })
vim.keymap.set("n", "gR", vim.lsp.buf.rename, { noremap = true })
vim.keymap.set("n", "ff", ":Neotree focus<CR>", { noremap = true })
-- vim.keymap.set("n", "<C-d>", function()
-- 	if #vim.api.nvim_tabpage_list_wins(0) > 1 then
-- 		vim.api.nvim_win_close(0, false)
-- 	end
-- end, { noremap = false })

vim.cmd([[
set nowrap
set number
set norelativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set mouse=a

" set auto folding
set foldlevelstart=99
set foldmethod=indent

" bind group comment to Ctrl-/
map <C-_> gc

" enable ruler at 80 chars
set colorcolumn=80
hi ColorColumn guibg=#303030

noremap <C-d> :q<CR>
]])

function P(arg)
	print(vim.inspect(arg))
end

function TSInspect()
	P(vim.treesitter.get_captures_at_cursor(0))
end
