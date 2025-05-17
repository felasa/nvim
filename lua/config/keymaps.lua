print("config/keymaps")
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

--moves selected (visual) line up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz") --mover hacia abajo y centrar
vim.keymap.set("n", "<C-u>", "<C-u>zz") --mover hacia arriba y centrar
vim.keymap.set("n", "<leader>fmt", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set('t', '<esc>', "<C-\\><C-n>")

-- when pasting over existing line use last yanked register
vim.keymap.set("x", "<leader>p", [["_dP]])

--mandar a terminal a la derecha o abajo
vim.keymap.set('v', '<leader>tt', 'y`>0j<esc><C-w>jpi<Enter><C-\\><C-n><C-w>k',
    { noremap = true, buffer = false })
vim.keymap.set('v', '<leader>ty', 'y`>0j<esc><C-w>lpi<Enter><C-\\><C-n><C-w>h',
    { noremap = true })
-- todo: Similar en modo visual enviar linea desde cursor

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- LSP stuff
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    -- inline diagnostics not showing, something conjure is messing up:
    vim.diagnostic.enable()
    vim.diagnostic.config({virtual_text = true})
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "<leader>gK", function() vim.lsp.buf.signature_help() end, {})
    vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>gI", vim.lsp.buf.implementation, {})
    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>cc", vim.lsp.codelens.run, {})
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>fmt', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
-- END LSP

--toggle diagnostics in current buffer, because of conjure log
vim.keymap.set('n', '<leader>tdg', function() vim.diagnostic.enable(false, {bufnr=0}) end)

-- dont know what most of these do so ill comment them till i do and know i want them
--vim.keymap.set("n", "J", "mzJ`z")
--vim.keymap.set("n", "n", "nzzzv")
--vim.keymap.set("n", "N", "Nzzzv")

-- next greatest remap ever : asbjornHaland
--vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
--vim.keymap.set("n", "<leader>Y", [["+Y]])

--vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
--vim.keymap.set("i", "<C-c>", "<Esc>")
--vim.keymap.set("n", "Q", "<nop>")
--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
--vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
--vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- joke?
--vim.keymap.set(
--    "n",
--    "<leader>ee",
--    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
--)

--vim.keymap.set("n", "<leader><leader>", function()
--    vim.cmd("so")
--end)
--nd)
