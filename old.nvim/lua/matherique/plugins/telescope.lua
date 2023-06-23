local tel = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', tel.find_files, {})
