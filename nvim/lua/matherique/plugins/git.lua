return {
  -- Adds git releated signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  opts = {
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
      ignore_whitespace = false,
    },
    on_attach = function(bufnr)
      vim.keymap.set('n', '<leader>gp', ":Gitsigns preview_hunk_inline<CR>",
        { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
    end,
  },
}
