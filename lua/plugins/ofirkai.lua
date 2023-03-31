scheme = require("ofirkai").scheme
require("ofirkai").setup {
	remove_italics = true,
	custom_hlgroups = {
		["@keyword.function"] = { fg = scheme.light_red },
		["@function.macro"] = { fg = scheme.light_red },
		["@method"] = { fg = scheme.green },
		["@function"] = { fg = scheme.green },
	}
}
