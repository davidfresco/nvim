return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
		},
		opts = {
			diagnostics = {
				virtual_text = false,
			},
			servers = {
				pyright = {
					settings = {
						pyright = {
							disableLanguageServices = true,
						},
					},
				},
				jedi_language_server = {},
				yamlls = {},
			},
		},
	},
}
