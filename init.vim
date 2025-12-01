source ~/.config/nvim/vim-plug/pluggins.vim

let mapleader = " "

set termguicolors

lua << EOF
require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
})
EOF

colorscheme catppuccin-mocha

vim.opt.number = true 

" ============================
" Basic Config
" ============================
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab

lua << EOF
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep,  { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers,    { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags,  { desc = "Help Tags" })
EOF

" ============================
" Diagnostic Settings
" ============================
lua << EOF
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    format = function(d)
      return string.format("%d: %s", d.lnum + 1, d.message)
    end,
  },
  signs = true,
  underline = true,
  update_in_insert = true,
})
EOF

" ============================
" nvim-cmp Setup
" ============================
lua << EOF
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
    { name = "path" },
  }),
})
EOF

" ============================
" LSP (gopls) Setup
" ============================
lua << EOF
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

lspconfig.gopls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      gofumpt = true,
      staticcheck = true,
      analyses = { unusedparams = true },
    },
  },
})
EOF

