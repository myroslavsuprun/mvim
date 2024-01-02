return {
  -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  opts = {
    -- See `:help gitsigns.txt`
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns
      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      map('n', '<leader>gs', gs.stage_hunk, { desc = '[G]it [S]tage hunk' })
      map('n', '<leader>gr', gs.reset_hunk, { desc = '[G]it [R]eset hunk' })
      map('v', '<leader>gs', function()
        gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = '[G]it [S]tage hunk' })
      map('v', '<leader>gr', function()
        gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = '[G]it [R]eset hunk' })
      map('n', '<leader>gS', gs.stage_buffer, { desc = '[G]it [S]tage buffer' })
      map('n', '<leader>gu', gs.undo_stage_hunk, { desc = '[G]it [U]ndo stage hunk' })
      map('n', '<leader>gR', gs.reset_buffer, { desc = '[G]it [R]eset buffer' })
      map('n', '<leader>gP', gs.preview_hunk, { desc = '[G]it [P]review hunk' })
      map('n', '<leader>gb', function()
        gs.blame_line { full = true }
      end, { desc = '[G]it [B]lame line' })
      map('n', '<leader>gtb', gs.toggle_current_line_blame, { desc = '[G]it [T]oggle [B]lame line' })
      map('n', '<leader>gd', gs.diffthis, { desc = '[G]it [D]iff this' })
      map('n', '<leader>gD', function()
        gs.diffthis '~'
      end, { desc = '[G]it [D]iff this' })
      map('n', '<leader>gtd', gs.toggle_deleted, { desc = '[G]it [T]oggle [D]eleted' })

      vim.keymap.set({ 'n', 'v' }, '<leader>gn', function()
        -- Not sure what it is
        if vim.wo.diff then
          return '<leader>gn'
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return '<Ignore>'
      end, { expr = true, buffer = bufnr, desc = '[G]it [N]ext hunk' })
      vim.keymap.set({ 'n', 'v' }, '<leader>gp', function()
        -- Not sure what it is
        if vim.wo.diff then
          return '<leader>gp'
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return '<Ignore>'
      end, { expr = true, buffer = bufnr, desc = '[G]it [P]revious hunk' })
    end,
  },
}
