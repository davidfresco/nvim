return {
	{
		"ofirgall/ofirkai.nvim",
		opts = function(_, opts)
			local scheme = require("ofirkai").scheme
			scheme.background = "#282923"
			scheme.cursor_line_bg = "#3a392f"
			opts.custom_hlgroups = {
				LineNr = { fg = scheme.grey },
				CursorLineNr = { fg = scheme.white },
				Function = { fg = scheme.aqua },
			}
		end,
	},
}
