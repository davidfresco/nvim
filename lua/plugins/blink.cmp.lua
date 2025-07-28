  return {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      {
        "saghen/blink.compat",
        optional = true, -- make optional so it's only enabled if any extras need it
        opts = {},
      },
    },

    opts = function(_, opts)
      opts.completion.ghost_text.enabled = false
    end
  }
