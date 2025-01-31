--print("./init.lua")
require("config")
require("remap")
vim.opt.foldlevel = 99
-- Conjure localleader
vim.g.maplocalleader = ','

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- autocommands
--- This function is taken from https://github.com/norcalli/nvim_utils
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
    -- reload_vimrc = {
    --     -- Reload vim config automatically
    --     {"BufWritePost",[[$VIM_PATH/{*.vim,*.yaml,vimrc} nested source $MYVIMRC | redraw]]},
    -- },
    -- packer = {
    --     { "BufWritePost", "plugins.lua", "PackerCompile" },
    -- },
    terminal_job = {
        { "TermOpen", "*", [[tnoremap <buffer> <Esc> <c-\><c-n>]] },
        { "TermOpen", "*", "startinsert" },
        { "TermOpen", "*", "setlocal listchars= nonumber norelativenumber" },
    },
    --restore_cursor = {
    --    { 'BufRead', '*', [[call setpos(".", getpos("'\""))]] },
    --},
    --save_shada = {
    --    {"VimLeave", "*", "wshada!"},
    --},
    resize_windows_proportionally = {
        { "VimResized", "*", ":wincmd =" },
    },
    --toggle_search_highlighting = {
    --    { "InsertEnter", "*", "setlocal nohlsearch" },
    --},
    --lua_highlight = {
    --    { "TextYankPost", "*", [[silent! lua vim.highlight.on_yank() {higroup="IncSearch", timeout=400}]] },
    --},
    --ansi_esc_log = {
    --    { "BufEnter", "*.log", ":AnsiEsc" },
    --},
}

nvim_create_autogroups(autocmds)
-- autocommands END
