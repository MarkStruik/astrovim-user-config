vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end)
return {
  colorscheme = "catppuccin-macchiato", plugins = {
    init = {
      {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
          require("catppuccin").setup {}
        end,
      },
    },
  },
  mappings = {
    n = {
      ["<leader>b"] = { "<cmd>%bd|e#|bd#<cr>", desc = "Close all buffer except current"},
    },
  },
  polish = function() 
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true } 
    map("n", "<C-J>", ":m .+1<cr>==", opts)
    map("n", "<C-K>", ":m .-2<cr>==", opts)
    vim.filetype.add {
       extension = {
         config = "xml",
       }
     }
  end,
}
