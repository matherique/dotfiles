syntax on
colorscheme default
set autoread
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
set scrolloff=10
set spelllang=pt_br
set completeopt=noinsert,menuone,noselect
set rtp+=~/.fzf
set updatetime=100

autocmd BufWritePost,FileWritePost *.rs silent! !cargo fmt

