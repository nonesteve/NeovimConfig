return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig",
            "nvimdev/lspsaga.nvim"
        }
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("lspsaga").setup{}
            require("mason").setup {
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            }
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = true,
        event = "VeryLazy",
        config = function()
            local servers = {
                lua_ls = {},
                clangd = {},
            }
            local on_attach = function(client, bufnr) -- Enable completion triggered by <c-x><c-o>
                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local bufopts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
                vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, bufopts)
                vim.keymap.set('n', 'K', "<cmd>Lspsaga hover_doc<cr>", bufopts)
                vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations, bufopts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
                -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
                -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
                -- vim.keymap.set('n', '<space>wl', function()
                --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                -- end, bufopts)
                vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
                vim.keymap.set('n', '<space>rn', "<cmd>Lspsaga rename ++project<cr>", bufopts)
                vim.keymap.set('n', '<space>ca', "<cmd>Lspsaga code_action<cr>", bufopts)
                vim.keymap.set('n', '<space>da', vim.diagnostic.open_float, bufopts)
                vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, bufopts)
                -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
                vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
            end

            require("mason-lspconfig").setup ({
                ensure_installed = vim.tbl_keys(servers)
            })
            for server, config in pairs(servers) do
                require("lspconfig")[server].setup(
                {
                    on_attach = on_attach
                }, config)

            end
        end
    }
}
