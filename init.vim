call plug#begin('~/.config/nvim/plugged')
Plug 'gruvbox-community/gruvbox'
" statusline
Plug 'vim-airline/vim-airline'
" fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" go suport 
" Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" pt-br check
Plug 'mateusbraga/vim-spell-pt-br'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'tpope/vim-fugitive'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
Plug 'bluz71/vim-moonfly-colors'
Plug 'mfussenegger/nvim-jdtls'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'vim-pandoc/vim-pandoc'
Plug 'rwxrob/vim-pandoc-syntax-simple' 
Plug 'pantharshit00/vim-prisma'
" Plug 'ray-x/lsp_signature.nvim'
call plug#end()

let g:pandoc#formatting#mode = 'h' " A'
let g:pandoc#formatting#textwidth = 72
let g:pandoc#folding#fdc= 0
let g:pandoc#modules#disabled = ["folding"]
 
syntax on
colorscheme moonfly
set background=dark
set t_Co=256
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nowrap
set rnu
set number
set smartcase
set ruler
set nobackup 
set noswapfile
set undofile
set incsearch
set nohlsearch
set termguicolors
set scrolloff=10
set spelllang=en

set updatetime=100

noremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

highlight CursorLine term=bold cterm=bold guibg=Grey43

" Workaround for creating transparent bg
autocmd SourcePost * highlight Normal     ctermbg=NONE guibg=NONE
\ |    highlight LineNr     ctermbg=NONE guibg=NONE
\ |    highlight SignColumn ctermbg=NONE guibg=NONE

let mapleader = " "

nnoremap <silent> <Leader>r :so ~/.config/nvim/init.vim<CR>

let g:gruvbox_contrast_dark="hard"

let g:go_highlight_types = 0
let g:go_fmt_command = "goimports"

" plugins
set completeopt=noinsert,menuone,noselect
" set rtp+=~/.fzf

" search by files arquivos
" nnoremap <c-p> :Telescope git_files layout_strategy=vertical<CR> 
nnoremap <c-p> :Files <CR> 

autocmd BufEnter *.tsx set filetype=typescriptreact
autocmd BufEnter *.jsx set filetype=javascriptreact

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },
}

local on_attach = function(client, bufnr)
end

require'lspconfig'.texlab.setup{ on_attach=on_attach }
require'lspconfig'.tsserver.setup{ on_attach=on_attach }
require'lspconfig'.jdtls.setup({cmd = {'javalsp'}})
require "lsp_signature".setup({ max_width = 80 })
require'lspconfig'.gopls.setup{
    on_attach=on_attach,
    cmd = {"gopls"},
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}



--[[
require'lspconfig'.clangd.setup {
  on_attach = on_attach,
    root_dir = function() return vim.loop.cwd() end
}

require'lspconfig'.gopls.setup{
    on_attach=on_attach,
    cmd = {"gopls", "serve"},
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}


--[[
require "lsp_signature".setup({ max_width = 80 })

require'lspconfig'.clangd.setup {
  on_attach = on_attach,
    root_dir = function() return vim.loop.cwd() end
}

--]]
EOF

nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap gi :lua vim.lsp.buf.implementation()<CR>
nnoremap gsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap gr :lua vim.lsp.buf.references()<CR>
nnoremap grn :lua vim.lsp.buf.rename()<CR>
nnoremap K :lua vim.lsp.buf.hover()<CR>
nnoremap gca :lua vim.lsp.buf.code_action()<CR>
nnoremap gn :lua vim.lsp.diagnostic.goto_next()<CR>

" Do this in lua?? maybe...
" vim.o is short for something teej thinks makes sense.
set completeopt=menuone,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

fun! LspLocationList()
    " lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
endfun

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

augroup THE_PRIMEAGEN_LSP
    autocmd!
    autocmd! BufWrite,BufEnter,InsertLeave * :call LspLocationList()
augroup END

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true

inoremap <silent><expr> <CR>      compe#confirm('<CR>')
