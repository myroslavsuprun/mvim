return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require 'null-ls'
    null_ls.setup {
      sources = {
        -- Formatting
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.fourmolu,
        null_ls.builtins.formatting.eslint_d,

        -- Diagnostic
        null_ls.builtins.diagnostics.codespell,
        null_ls.builtins.diagnostics.eslint_d,

        -- Code actions
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.code_actions.shellcheck,
        null_ls.builtins.code_actions.eslint_d,
      },
    }
  end,
}
