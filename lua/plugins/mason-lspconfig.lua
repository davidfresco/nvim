return {
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function(opts)
			require("mason-lspconfig").setup(opts)
			require("lspconfig").pyright.setup({
				settings = {
					pyright = {
						disableLanguageServices = true,
					},
				},
			})
		end,
	},
}
