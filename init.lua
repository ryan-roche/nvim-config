-- import files from ./lua
require 'settings'
require 'lsp'
require 'plugins'


-- Plugin setups
--
-- nvim-tree setup
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
--
-- smartcolumn
require("smartcolumn").setup()
--
--
-- Automatically run PackerSync when plugins.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
--
--
-- Dracula theme
require'FTerm'.setup({
    border = 'double',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
})
vim.cmd.colorscheme "dracula"
--
--
-- Cursorline
require('nvim-cursorline').setup {
  cursorline = {
    enable = false,
    timeout = 1000,
    number = false,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  }
}
--
--
-- FTerm
vim.keymap.set('n', '<C-`>', '<CMD>lua require("FTerm").toggle()<CR>')
--
--
-- lspconfig
require'lspconfig'.ccls.setup{}
--
--
-- treesitter
require 'nvim-treesitter.configs'.setup {
  ensure_installed = {'c', 'lua', 'rust', 'java', 'python', 'help'},
  sync_install = false,
  auto_install = true,
  highlight = {enable = true}
}
--
--
-- barbecue
--
--
-- peepsight
require('peepsight').setup({
  -- go
  "function_declaration",
  "method_declaration",
  "func_literal",

  -- typescript
  "class_declaration",
  "method_definition",
  "arrow_function",
  "function_declaration",
  "generator_function_declaration"
})
--
--
-- telescope
require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}
--
-- Remove background color (to use terminal's instead)
vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
vim.cmd([[hi EndOfBuffer guibg=NONE ctermbg=NONE]])
