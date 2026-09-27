vim.pack.add({
    'https://github.com/nvim-mini/mini.nvim',

    -- LSP
    'https://github.com/neovim/nvim-lspconfig',
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
    'https://github.com/chomosuke/typst-preview.nvim',

    -- Theme
    'https://github.com/rebelot/kanagawa.nvim',

    -- Telescope
    'https://github.com/nvim-telescope/telescope.nvim',
    'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
    'https://github.com/nvim-lua/plenary.nvim', -- Telescope dependency
})

vim.cmd('packadd nohlsearch')
vim.cmd('packadd nvim.undotree')
