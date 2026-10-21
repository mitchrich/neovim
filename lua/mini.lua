require('mini.statusline').setup()
require('mini.tabline').setup()

require('mini.notify').setup({
    lsp_progress = { enable = false }
})

require('mini.icons').setup()
require('mini.pick').setup()
require('mini.bufremove').setup()


local miniclue = require('mini.clue')
miniclue.setup({
    window = {
        delay = 300,
        config = { width = 'auto' },
    },
    triggers = {
        -- Leader triggers
        { mode = { 'n', 'x' }, keys = '<Leader>' },

        -- `[` and `]` keys
        { mode = 'n',          keys = '[' },
        { mode = 'n',          keys = ']' },

        -- Built-in completion
        { mode = 'i',          keys = '<C-x>' },

        -- `g` key
        { mode = { 'n', 'x' }, keys = 'g' },

        -- Marks
        { mode = { 'n', 'x' }, keys = "'" },
        { mode = { 'n', 'x' }, keys = '`' },

        -- Registers
        { mode = { 'n', 'x' }, keys = '"' },
        { mode = { 'i', 'c' }, keys = '<C-r>' },

        -- Window commands
        { mode = 'n',          keys = '<C-w>' },

        -- `z` key
        { mode = { 'n', 'x' }, keys = 'z' },
    },

    clues = {
        miniclue.gen_clues.square_brackets(),
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
    },
})

require('mini.jump2d').setup()
require('mini.move').setup {
  mappings = {
    -- Visual mode
    left = '<M-S-h>',
    right = '<M-S-l>',
    down = '<M-S-j>',
    up = '<M-S-k>',

    -- Normal mode
    line_left = '<M-S-h>',
    line_right = '<M-S-l>',
    line_down = '<M-S-j>',
    line_up = '<M-S-k>',
  },
}
require('mini.diff').setup()
require('mini.git').setup()
require('mini.extra').setup()

-- Keymaps
vim.keymap.set('n', '<leader>j', MiniJump2d.start, { desc = 'File Explorer' })

vim.keymap.set('n', '<leader>ff', MiniPick.builtin.files, { desc = 'Pick files' })
vim.keymap.set('n', '<leader>fr', MiniPick.builtin.grep_live, { desc = 'Pick grep' })
vim.keymap.set('n', '<leader>fb', MiniPick.builtin.buffers, { desc = 'Pick buffers' })

vim.keymap.set('n', '<leader>c', MiniBufremove.delete, { desc = 'Close Buffer' } )

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function()
        vim.keymap.set('n', '<leader>fs', function() MiniExtra.pickers.lsp({ scope='document_symbol' }) end, { desc = 'Pick symbols' })
    end,
})
