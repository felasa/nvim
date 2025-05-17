--we're manually installing lsps now
if true then return {} end
return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        opts = {},
    },
    {
        'williamboman/mason-lspconfig.nvim',
        opts = {},
    },
    --    {
    --        "neovim/nvim-lspconfig",
    --        config = function()
    --            local lspc = require("lspconfig")
    --            lspc.pylsp.setup{}
    --        end
    --    }
}
