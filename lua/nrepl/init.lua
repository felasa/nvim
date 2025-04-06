local function launch_repl()
    vim.cmd('tabnew')
    vim.cmd(':term ' .. 'clj -M:repl/basic')
    vim.cmd('tabp')
end

vim.api.nvim_create_user_command(
    'Clj', function()
        launch_repl()
    end,
    {nargs = "*"}
)

