call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
" statusline
Plug 'vim-airline/vim-airline'
" fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" autocompleter + lsp
" Plug 'neoclide/coc.nvim', {'branch': 'release'} 
" go suport 
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" pt-br check
" Plug 'darrikonn/vim-gofmt'
call plug#end()

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
 
syntax on
colorscheme default
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
set incsearch
set nohlsearch
set termguicolors 
set scrolloff=10
set spelllang=pt_br
set completeopt=noinsert,menuone,noselect
set rtp+=~/.fzf
set updatetime=100

" Workaround for creating transparent bg
autocmd SourcePost * highlight Normal     ctermbg=NONE guibg=NONE
            \ |    highlight LineNr     ctermbg=NONE guibg=NONE
            \ |    highlight SignColumn ctermbg=NONE guibg=NONE


let mapleader = " "

nnoremap <silent> <Leader>r :so ~/.vimrc<CR>
nnoremap <c-p> :Files<CR>
filetype on
filetype plugin on
filetype indent on

" golang
let g:go_fmt_fail_silently = 0
let g:go_fmt_command = 'goimports'
let g:go_fmt_autosave = 1
let g:go_gopls_enabled = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1
"let g:go_auto_type_info = 1 " forces 'Press ENTER' too much
let g:go_auto_sameids = 0
"let g:go_metalinter_command='golangci-lint'
"let g:go_metalinter_command='golint'
"let g:go_metalinter_autosave=1
set updatetime=100
"let g:go_gopls_analyses = { 'composites' : v:false }
au FileType go nmap <leader>t :GoTest!<CR>
au FileType go nmap <leader>v :GoVet!<CR>
au FileType go nmap <leader>b :GoBuild!<CR>
au FileType go nmap <leader>c :GoCoverageToggle<CR>
au FileType go nmap <leader>i :GoInfo<CR>
au FileType go nmap <leader>l :GoMetaLinter!<CR>
