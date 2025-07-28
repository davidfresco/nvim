return {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    dependencies = {
      "mason.nvim",
      { "williamboman/mason-lspconfig.nvim", config = function() end },
    },
	opts = {
		diagnostics = {
			virtual_text = false,
		},
		autoformat = false,
		servers = {
			-- pyright = {
			-- 	settings = {
			-- 		pyright = {
			-- 			disableLanguageServices = true,
			-- 		},
			-- 	},
			-- },
			-- jedi_language_server = {},
			-- yamlls = {},
		},
	},
}
