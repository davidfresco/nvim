require('lualine').setup {
	options = {
		theme = require("ofirkai.statuslines.lualine").theme
	},
	sections = {
		lualine_b = {'branch', 'diagnostics'}
	}
}
