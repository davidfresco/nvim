require("config.lazy")

vim.cmd([[
set wrap
set number
set norelativenumber
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set mouse=a

" set auto folding
set foldlevelstart=99
set foldmethod=indent

" enable ruler at 80 chars
set colorcolumn=80

]])

function P(arg)
	print(vim.inspect(arg))
end

function TSInspect()
	P(vim.treesitter.get_captures_at_cursor(0))
end
