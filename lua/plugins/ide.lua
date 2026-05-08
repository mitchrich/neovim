require('neogen').setup()
require('mini.snippets').setup()

require('blink.cmp').setup({
    keymap = { preset = 'default' },

    appearance = { nerd_font_variant = 'mono' },

    completion = {
        documentation = { auto_show = false },
        menu = {
            draw = {
                columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
                components = {
                    kind_icon = {
                        text = function(ctx)
                            local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                            return kind_icon
                        end,
                        -- (optional) use highlights from mini.icons
                        highlight = function(ctx)
                            local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                            return hl
                        end,
                    },
                    kind = {
                        -- (optional) use highlights from mini.icons
                        highlight = function(ctx)
                            local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                            return hl
                        end,
                    }
                }
            }
        }
    },

    sources = {
        default = { 'lsp', 'snippets' },
        providers = {
            cmdline = {
                -- ignores cmdline completions when executing shell commands
                enabled = function()
                    return vim.fn.getcmdtype() ~= ':' or not vim.fn.getcmdline():match("^[%%0-9,'<>%-]*!")
                end
            },
        },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" }
})
