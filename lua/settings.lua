settings = {
    -- disable compatability to old-time vi
    nocompatible = true,

    -- new pane settings
    splitright = true,
    splitbelow = true,

    -- warning column at 80 characters
    colorcolumn = '80',

    -- tab settings
    expandtab = true,
    shiftwidth = '2',
    softtabstop = '2',
    
    -- editor settings
    moouse = 'a',
    backupdir = '~/.cache/vim',
    showmatch = true,
    number = true,
    autoread = true
}

for key, val in pairs(settings) do
    vim.o[key] = val
end

return true
