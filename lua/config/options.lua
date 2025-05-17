vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.opt.number = true
vim.opt.relativenumber = true
--unser why's different
vim.wo.relativenumber = true
vim.wo.number = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.hlsearch = false --no resaltar ultima busqueda
vim.opt.incsearch = true --resaltar busqueda parcial

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.colorcolumn = "100"
vim.opt.splitright = true
vim.opt.splitbelow = true


-- Hacer terminal mas amigable
vim.keymap.set('t', '<esc>', '<C-\\><C-n>')
vim.api.nvim_command("autocmd TermOpen * setlocal nonumber")
vim.api.nvim_command("autocmd TermOpen * setlocal norelativenumber")
vim.api.nvim_command("autocmd TermEnter * setlocal signcolumn=no")

local function nvim_create_autogroups(definitions)
    local api = vim.api
    for group_name, definition in pairs(definitions) do
        api.nvim_command('augroup ' .. group_name)
        api.nvim_command('autocmd!')
        for _, def in ipairs(definition) do
            local command = table.concat(vim.iter({ 'autocmd', def }):flatten(), ' ')
            api.nvim_command(command)
        end
        api.nvim_command('augroup END')
    end
end
local autocmds = {
    terminal_job = {
        { "TermOpen", "*", [[tnoremap <buffer> <Esc> <c-\><c-n>]] },
        { "TermOpen", "*", "startinsert" },
        { "TermOpen", "*", "setlocal listchars= nonumber norelativenumber" },
    },
    resize_windows_proportionally = {
        { "VimResized", "*", ":wincmd =" },
    },
}
nvim_create_autogroups(autocmds)
-- dont enable native completion because it doubles with blink
--vim.api.nvim_create_autocmd('LspAttach', {
--    callback = function(ev)
--        local client = vim.lsp.get_client_by_id(ev.data.client_id)
--        if client:supports_method('textDocument/completion') then
--            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
--        end
--    end,
--})

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({higroup='IncSearch', timeout=200})
    end
})
vim.cmd("set completeopt+=noselect,menuone")
vim.o.winborder = 'rounded'

vim.lsp.enable({'lua_ls', 'clojure_lsp', 'pylsp', 'r_ls', 'scala', 'fennel'})

vim.api.nvim_create_autocmd("BufNewFile",
    {
        pattern = "conjure-log-*",
        callback = function()
            --vim.diagnostic.enable(false, {bufnr = vim.fn.bufnr()})
            vim.diagnostic.enable(false)
        end
    })
