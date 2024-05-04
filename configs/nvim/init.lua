local vim = vim
local Plug = vim.fn['plug#']

vim.o.termguicolors = true
vim.wo.wrap = false
vim.wo.number = true

vim.call('plug#begin', '~/.config/nvim/plugged/')

Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.6' })
Plug('andweeb/presence.nvim')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })

Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')

Plug('norcalli/nvim-colorizer.lua')

Plug("tiagovla/tokyodark.nvim")

vim.call('plug#end')


  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
      end,
    },
    window = {
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      -- ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), 
    }),
    sources = cmp.config.sources({
    }, {
      { name = 'buffer' },
    })
  })

  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })


require'nvim-treesitter.configs'.setup{highlight={enable=true}}
require'colorizer'.setup()
vim.cmd [[colorscheme tokyodark]]

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-Space>', builtin.find_files, {})

