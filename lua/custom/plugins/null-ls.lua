local null_ls = require 'null-ls'
null_ls.setup()

require('mason-null-ls').setup {
  automatic_installation = true,
  ensure_installed = { 'stylua', 'eslint_d', 'prettierd' },
  handlers = {
    -- function() end, -- disables automatic setup of all null-ls sources
    stylua = function(source_name, methods)
      null_ls.register(null_ls.builtins.formatting.stylua)
    end,
    eslint_d = function(source_name, methods)
      null_ls.register(null_ls.builtins.code_actions.eslint_d)
      null_ls.register(null_ls.builtins.diagnostics.eslint_d)
    end,
    prettierd = function(source_name, methods)
      null_ls.register(null_ls.builtins.formatting.prettierd)
    end,
  },
}
