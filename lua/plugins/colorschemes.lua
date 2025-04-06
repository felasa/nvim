return {
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000,
		main = "everforest",
		config = function()
            local ef = require("everforest")
            ef.setup({
                background = "hard",
                transparent_background_level = 1,
                ui_contrast = "high",
            })
        end
	},
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1001,
        opts = {},
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1002 },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1002,
        opts = {
            variant = "main",
        },
    },
    { "blazkowolf/gruber-darker.nvim",
      priority = 1003,

    },
    {
        "Shatur/neovim-ayu",
        priority = 1004,
        name = "ayu",
        opts = {
        }
    }
}
