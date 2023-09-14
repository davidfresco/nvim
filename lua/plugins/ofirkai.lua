return {
	{
		"ofirgall/ofirkai.nvim",
		opts = function(_, opts)
			-- update some color definitions to be more faithful
			local scheme = require("ofirkai").scheme
			scheme.background = "#282923"
			scheme.cursor_line_bg = "#3a392f"

			local custom_hlgroups = {
				LineNr = { fg = scheme.grey },
				CursorLineNr = { fg = scheme.white },
				Function = { fg = scheme.aqua },
				ColorColumn = { bg = scheme.cursor_line_bg },
			}

			-- override the default color scheme  return function
			-- as it is now, it does not reapply custom_hlgroups after changing
			-- the color scheme with transparent.nvim
			local design = require("ofirkai.design")
			local o_hl_groups = design.hl_groups
			design.hl_groups = function(scheme)
				local groups = o_hl_groups(scheme)
				return vim.tbl_extend("force", groups, custom_hlgroups)
			end
		end,
	},
}
