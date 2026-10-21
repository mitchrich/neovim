    vim.opt_local.softtabstop = 4
    vim.opt_local.tabstop = 8
    vim.opt_local.shiftwidth = 8
    vim.opt_local.expandtab = false

    vim.opt_local.smartindent = false
    vim.opt_local.cindent = true
    --[[
    -- No i_localndent on case statements
    -- Four_local space line continuation indent
    -- Look_local 500 lines back for comment starts
    ]]
    vim.opt_local.cinoptions = "p0,t0,+4,(4,u4,U1,:0,*500"

    vim.opt_local.formatoptions = "croq"
    vim.opt_local.textwidth = 79
    vim.opt_local.colorcolumn = "80"
