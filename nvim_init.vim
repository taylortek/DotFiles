:set mouse=a
syntax on

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
  execute "set <xRight>=\e[1;*C"
	execute "set <xLeft>=\e[1;*D"
endif

:set smartindent

:filetype indent on
:set tabstop=2
:set shiftwidth=2

set shell=/bin/bash

:set background=dark
:set t_Co=256

:set backspace=indent,eol,start

set encoding=utf-8

noremap x "_x
noremap X "_x
noremap <Del> "_x

" vim-plug

set nocompatible
filetype off

call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
"Plug 'puremourning/vimspector'
"Plug 'smartclose/smartclose'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" LSP Support
Plug 'neovim/nvim-lspconfig'
" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'hrsh7th/cmp-buffer'

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v3.x'}

Plug 'onsails/lspkind.nvim'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'

Plug 'RaafatTurki/hex.nvim'

Plug 'folke/neodev.nvim'

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme= 'bubblegum'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

"let g:smartclose = 0

let g:vimwiki_list = [{
			\ 'template_default' : 'mathjax'}]

source ~/.vim/.nerdtree.vim
source ~/.vim/.inspect.vim
source ~/.vim/smartclose.vim

call plug#end()

colorscheme catppuccin-mocha

lua << EOF
require("neodev").setup({
  -- add any options here, or leave empty to use the default settings
})
	require 'hex'.setup()
	local lsp_zero = require('lsp-zero')

	lsp_zero.on_attach(function(client, bufnr)
	  -- see :help lsp-zero-keybindings
	  -- to learn the available actions
	  lsp_zero.default_keymaps({buffer = bufnr})
	end)

	require('mason').setup({})
	require('mason-lspconfig').setup({
	  ensure_installed = {},
	  handlers = {
		lsp_zero.default_setup,
	  },
	})

	local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
	sources = {
			{name = 'nvim_lsp'},
			{name = 'buffer'},
			{ name = 'nvim_lsp_signature_help' },
		},
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<Tab>'] = cmp_action.tab_complete(),
    ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
  }),
	window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
	formatting = {
    fields = {'abbr', 'kind', 'menu'},
    format = require('lspkind').cmp_format({
      mode = 'symbol_text', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
    })
  },
	preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
})
lsp_zero.set_sign_icons({
  error = ' ',
  warn = ' ',
  hint = ' ⚑',
  info = ' »'
})
EOF

set number
set signcolumn=number

