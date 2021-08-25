call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
" statusline
Plug 'vim-airline/vim-airline'
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
Plug 'neoclide/coc.nvim', {'branch': 'release'} 
" syntax more languages
Plug 'sheerun/vim-polyglot'                             " varias syntex de varias linguagens  
" go suport 
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" pt-br check
Plug 'mateusbraga/vim-spell-pt-br'
Plug 'OmniSharp/omnisharp-vim'
call plug#end()

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
 
syntax on
colorscheme gruvbox
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

"nnoremap <silent> <Leader>gt :YcmCompleter GetDoc<CR>
"nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
"nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

nnoremap <silent> <Leader>r :so ~/.config/nvim/init.vim<CR>
nnoremap <silent> <Leader>ev :vs ~/.config/nvim/init.vim<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Symbol renaming.
nmap <silent>rn <Plug>(coc-rename)

" use <tab> for trigger completion and navigate to the next complete item
" use <tab> for trigger completion and navigate to the next complete item
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

filetype on
filetype plugin on
filetype indent on

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let g:go_highlight_types = 0


let g:coc_global_extensions = [ "coc-marketplace", "coc-tsserver", "coc-clangd", "coc-css", "coc-go", "coc-json"]

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

"plugins
set completeopt=noinsert,menuone,noselect
set rtp+=~/.fzf
" comentar
nnoremap <C-Left>/ :call NERDComment(0,"toggle")<CR>
vnoremap <C-Left>/ :call NERDComment(0,"toggle")<CR>

" search by files arquivos
nnoremap <c-p> :Files<CR> 

" abre e fecha nerdtree
"map <silent><F5> :NERDTreeToggle<CR>

command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 Comment :call NERDComment(0,"toggle")
 
autocmd BufEnter *.tsx set filetype=typescriptreact
autocmd BufEnter *.jsx set filetype=javascriptreact

