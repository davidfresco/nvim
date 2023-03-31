vim.opt.termguicolors = true
require("nvim-tree").setup({
	renderer = {
		icons = {
			webdev_colors = true,
			show = {
				git = false
			}
		}
	}
})
