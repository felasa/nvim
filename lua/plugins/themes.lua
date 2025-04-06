return {
    {
        "neanias/everforest-nvim",
        opts = {},
        lazy = false,
        priority = 1000,
        config = function()
            local everforest = require("everforest")
            everforest.setup({
                background = "hard"
            })
            everforest.load()
            --vim.cmd([[colorscheme everforest]])
        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1001,
        opts = {},
        config = function()
            vim.cmd([[colorscheme tokyonight]])
        end
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1002 },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1003,
        opts = {
            colorscheme = "rose-pine-dawn",
        },
    },
    { "blazkowolf/gruber-darker.nvim",
      priority = 1004,

    }
}
