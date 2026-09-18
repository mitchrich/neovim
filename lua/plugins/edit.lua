require('mini.jump').setup()
require('mini.surround').setup()
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
