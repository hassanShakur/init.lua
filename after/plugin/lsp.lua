local lsp_zero = require('lsp-zero')
local cmp_action = require('lsp-zero').cmp_action()

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})

end)

-- Setup language servers
require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here 
  -- with the ones you want to install
  ensure_installed = {'tsserver', 'angularls', 'clangd', 'cssls', 'emmet_ls', 'html', 'jsonls', 'jdtls', 'lua_ls', 'marksman', 'ruby_ls', 'eslint'},

  handlers = {
    lsp_zero.default_setup,
  },
})

-- Other configurations
local cmp = require('cmp')

cmp.setup({
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },

  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.confirm({select = false})
  })
})

-- Format on save
lsp_zero.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['tsserver'] = {'javascript', 'typescript'},
  }
})

