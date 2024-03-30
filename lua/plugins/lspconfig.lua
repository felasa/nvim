return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function ()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
        config = function ()
            local masonlsp = require('mason-lspconfig')
            masonlsp.setup({
                ensure_installed = {"r_language_server", "pylsp", "clojure_lsp", "lua_ls"},
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require('lspconfig')
            lspconfig.pylsp.setup({
                capabilities = capabilities,
                settings = {
                    pylsp = {
                        --configurationSources = 'flake8',
                        plugins = {
                            pycodestyle = {
                                enabled = false,
                                ignore = {'W391'},
                                maxLineLength = 100,
                            },
                            rope_completion = {
                                enabled = true
                            },
                            maccabe = {enabled = false},
                            pyflakes = {enabled = false},
                            flake8 = {
                                enabled = true,
                                ignore = {'W391'},
                                indentSize = 4,
                            },
                        },
                    },
                },
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                on_init = function(client)
                    local path = client.workspace_folders[1].name
                    if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
                        return
                    end

                    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                        runtime = {
                            -- Tell the language server which version of Lua you're using
                            -- (most likely LuaJIT in the case of Neovim)
                            version = 'LuaJIT'
                        },
                        -- Make the server aware of Neovim runtime files
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME
                                -- Depending on the usage, you might want to add additional paths here.
                                -- "${3rd}/luv/library"
                                -- "${3rd}/busted/library",
                            }
                            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                            -- library = vim.api.nvim_get_runtime_file("", true)
                        }
                    })
                end,
                settings = {
                    Lua = {}
                }
            })
            lspconfig.clojure_lsp.setup({
                capabilities = capabilities,
            })
        end
    },
}
