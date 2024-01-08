return {
  'ThePrimeagen/harpoon',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    vim.keymap.set("n", "<leader>a", mark.add_file)
    vim.keymap.set("n", "<leader><space>", ui.toggle_quick_menu)

    vim.keymap.set("n", "<C-e>", function() ui.nav_next() end)
    vim.keymap.set("n", "<C-o>", function() ui.nav_prev() end)
  end
}
