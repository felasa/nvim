return {
    'nvim-treesitter/nvim-treesitter',
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = {'c', 'lua', 'vim', 'vimdoc', 'r', 'python', 'scala', 'clojure'},
            synca_install = false,
            hightlight = {enable = true},
            indent = {enable = true},
        })
    end
}
