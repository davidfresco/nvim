return {
	{
		"williamboman/mason-lspconfig.nvim",
		config = {
			ensure_installed = {
				"bash-language-server",
				"jedi-language-server",
			},
		},
	},
}
