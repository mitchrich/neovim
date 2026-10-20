require('kanagawa').setup({
    overrides = function()
        return {
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },
        }
    end,
})

vim.cmd("colorscheme kanagawa-dragon")
