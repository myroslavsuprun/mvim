return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require 'null-ls'
    null_ls.setup {
      sources = {
        -- Formatting
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.goimports,
        -- Don't need to use gofmt because goimports is better
        -- null_ls.builtins.formatting.gofmt,
        null_ls.builtins.diagnostics.staticcheck,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.sql_formatter,
        require 'none-ls.formatting.eslint_d',

        -- Diagnostics
        require 'none-ls.diagnostics.eslint_d',

        -- Code actions
        require 'none-ls.code_actions.eslint_d',
      },
    }
  end,
  dependencies = {
    'nvimtools/none-ls-extras.nvim',
  },
}
