call plug#begin('~/.config/nvim/plugged')
Plug 'gruvbox-community/gruvbox'
" statusline
Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
" syntax de javascript
Plug 'pangloss/vim-javascript'                          " syntax highlight de js
" files tree view
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " sistema de arquivos
" commentador
Plug 'scrooloose/nerdcommenter'                         " comentarios
" fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" typescript syntax
Plug 'leafgarland/typescript-vim'
" autocompleter + lsp
" Plug 'neoclide/coc.nvim', {'branch': 'release'} 
" syntax more languages
Plug 'sheerun/vim-polyglot'                             " varias syntex de varias linguagens  
" go suport 
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" pt-br check
Plug 'mateusbraga/vim-spell-pt-br'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'tpope/vim-fugitive'

call plug#end()

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
 
syntax on
colorscheme gruvbox
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
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set nohlsearch
set termguicolors 
set scrolloff=10
let g:go_fmt_command = "goimports"
set spelllang=pt_br
"set viminfo='20,<1000,s1000'

set updatetime=100

highlight CursorLine term=bold cterm=bold guibg=Grey40

" Workaround for creating transparent bg
autocmd SourcePost * highlight Normal     ctermbg=NONE guibg=NONE
            \ |    highlight LineNr     ctermbg=NONE guibg=NONE
            \ |    highlight SignColumn ctermbg=NONE guibg=NONE

let mapleader = " "

nnoremap <silent> <Leader>r :so ~/.config/nvim/init.vim<CR>


let g:go_highlight_types = 0

"plugins
set completeopt=noinsert,menuone,noselect
set rtp+=~/.fzf

" comentar
nnoremap <C-Left>/ :call NERDComment(0,"toggle")<CR>
vnoremap <C-Left>/ :call NERDComment(0,"toggle")<CR>

" search by files arquivos
nnoremap <c-p> :GFiles<CR> 
 
autocmd BufEnter *.tsx set filetype=typescriptreact
autocmd BufEnter *.jsx set filetype=javascriptreact

lua << EOF

local function on_attach()
end

require'lspconfig'.tsserver.setup{ on_attach=on_attach }
require'lspconfig'.clangd.setup {
    on_attach = on_attach,
    root_dir = function() return vim.loop.cwd() end
}

require'lspconfig'.jedi_language_server.setup{
    on_attach=on_attach,
}

require'lspconfig'.svelte.setup{}

require'lspconfig'.yamlls.setup{}

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

EOF

" Do this in lua?? maybe...
" vim.o is short for something teej thinks makes sense.
set completeopt=menuone,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

fun! LspLocationList()
    " lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
endfun

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>gsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>grr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>grn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>gh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>gca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>gsd :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <leader>gn :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>gll :call LspLocationList()<CR>

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


set background=dark
let g:gruvbox_contrast="hard"
