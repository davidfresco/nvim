require("config.lazy")

local opts = vim.opt
opts.wrap = true
opts.number = true
opts.relativenumber = false
opts.tabstop = 4
opts.shiftwidth = 4
opts.softtabstop = 4
opts.expandtab = true
opts.mouse = "a"
opts.foldlevelstart = 99
opts.foldmethod = "indent"
opts.colorcolumn = "99"

function P(arg)
	print(vim.inspect(arg))
end

function TSInspect()
	P(vim.treesitter.get_captures_at_cursor(0))
end
