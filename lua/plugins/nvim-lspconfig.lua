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
		},
	},
}
