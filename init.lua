vim.opt.shell = vim.fn.executable "pwsh" and "pwsh" or "powershell"
vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
vim.opt.shellquote = ""
vim.opt.shellxquote = ""
vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end)
return {
    colorscheme = "catppuccin-frappe",
    plugins = {
        {"catppuccin/nvim", name = "catppuccin", priority = 1000}, {
            "folke/flash.nvim",
            event = "VeryLazy",
            ---@type Flash.Config
            opts = {},
            keys = {
                {
                    "s",
                    mode = {"n", "x", "o"},
                    function() require("flash").jump() end,
                    desc = "Flash"
                }, {
                    "S",
                    mode = {"n", "o", "x"},
                    function() require("flash").treesitter() end,
                    desc = "Flash Treesitter"
                }, {
                    "r",
                    mode = "o",
                    function() require("flash").remote() end,
                    desc = "Remote Flash"
                }, {
                    "R",
                    mode = {"o", "x"},
                    function()
                        require("flash").treesitter_search()
                    end,
                    desc = "Flash Treesitter Search"
                }, {
                    "<c-s>",
                    mode = {"c"},
                    function() require("flash").toggle() end,
                    desc = "Toggle Flash Search"
                }
            }
        }
    },

    -- lsp = {
    --     on_attach = function(client, bufnr)
    --         require('lspconfig').eslint.setup({
    --             on_attach = function(client, bufnr)
    --                 vim.api.nvim_create_autocmd("BufWritePre", {
    --                     buffer = bufnr,
    --                     command = "EslintFixAll"
    --                 })
    --             end
    --         })
    --     end
    -- },
    -- mappings = {
    --     n = {
    --     }
    -- },
    polish = function()
        local map = vim.api.nvim_set_keymap
        local opts = {noremap = true, silent = true}
        -- map("n", "<C-J>", ":m .+1<cr>==", opts)
        -- map("n", "<C-K>", ":m .-2<cr>==", opts)
        map("n", "<C-d>", "<C-d>zz", opts)
        map("n", "<C-u>", "<C-u>zz", opts)
        map("n", "<leader>fg", ":Telescope git_status<cr>", opts)
        vim.filetype.add {extension = {config = "xml"}}
    end
}
-- nnoremap("<C-u>", "<C-u>zz")
