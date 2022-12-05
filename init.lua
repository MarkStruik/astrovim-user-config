vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end)
return {
    colorscheme = "catppuccin-macchiato",
    plugins = {
        init = {
            {
                "catppuccin/nvim",
                as = "catppuccin",
                config = function()
                    require("catppuccin").setup {}
                end
            }
        }
    },
    lsp = {
        on_attach = function(client, bufnr)
            require('lspconfig').eslint.setup({
                on_attach = function(client, bufnr)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        command = "EslintFixAll"
                    })
                end
            })
        end
    },
    mappings = {
        n = {
            ["<leader>b"] = {
                "<cmd>%bd|e#|bd#<cr>",
                desc = "Close all buffer except current"
            }
        }
    },
    polish = function()
        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }
        -- map("n", "<C-J>", ":m .+1<cr>==", opts)
        -- map("n", "<C-K>", ":m .-2<cr>==", opts)
        map("n", "<C-d>", "<C-d>zz", opts)
        map("n", "<C-u>", "<C-u>zz", opts)
        vim.filetype.add { extension = { config = "xml" } }
    end
}
-- nnoremap("<C-u>", "<C-u>zz")
