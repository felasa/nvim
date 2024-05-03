return {
    {
        dir = "/home/federico/dev/neovim/nvim-python-repl",
        name = "nvim-python-repl",
        config = function()
            local plugin = require('nvim-python-repl')
            plugin.setup({
                prompt_spawn = true
            })
            vim.keymap.set("n", '<leader>ot', function() plugin.open_repl() end)
            vim.keymap.set("n", "<leader>kk", function() plugin.send_statement_definition() end)
            vim.keymap.set("v", "<leader>kl", function() plugin.send_visual_to_repl() end)
            --vim.keymap.set("n", [your keyamp], function() plugin.send_buffer_to_repl() end,
            --    { desc = "Send entire buffer to REPL"})
            --vim.keymap.set("n", [your keymap], function() plugin.toggle_execute() end,
            --    { desc = "Automatically execute command in REPL after sent"})
            --vim.keymap.set("n", [your keymap], function() plugin.toggle_vertical() end,
            --    { desc = "Create REPL in vertical or horizontal split"})
        end
    },
}
