--print("setup/config.lua")
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = true

vim.opt.hlsearch = false --no resaltar ultima busqueda
vim.opt.incsearch = true -- resaltar busqueda parcial

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.colorcolumn = "100"
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.wo.relativenumber = true
vim.wo.number = true

-- Hacer terminal mas amigable
vim.keymap.set('t', '<esc>', '<C-\\><C-n>')
vim.keymap.set('v', '<leader>tt', 'y`>0j<esc><C-w>jpi<Enter><C-\\><C-n><C-w>k')
-- todo: Similar sin modo visual enviar linea desde cursor
vim.keymap.set('v', '<leader>ty', 'y`>0j<esc><C-w>lpi<Enter><C-\\><C-n><C-w>h')
-- todo: Similar en modo visual enviar linea desde cursor
local api = vim.api
api.nvim_command("autocmd TermOpen * setlocal nonumber")
api.nvim_command("autocmd TermOpen * setlocal norelativenumber")
api.nvim_command("autocmd TermEnter * setlocal signcolumn=no")


