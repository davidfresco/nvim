return {
	{
		"ofirgall/ofirkai.nvim",
		opts = function(_, opts)
			local scheme = require("ofirkai").scheme
			scheme.background = "#292823"
			opts.custom_hlgroups = {
				LineNr = { fg = scheme.grey },
				CursorLineNr = { fg = scheme.white },
				Function = { fg = scheme.aqua },
			}
		end,
	},
}
