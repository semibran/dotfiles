call plug#begin('~/.vim/plug')

Plug 'othree/xml.vim'
Plug 'joshdick/onedark.vim'
Plug 'jelera/vim-javascript-syntax'

call plug#end()

autocmd BufWritePre * %s/\s\+$//e
set mouse=a
set whichwrap=b,s,<,>,[,]
set number
set tabstop=2
set shiftwidth=0
set expandtab
set directory=/tmp/.vim//
set listchars=tab:»\ ,eol:¬,space:·
set list
set noswapfile
syntax enable
colorscheme onedark
hi Normal guibg=NONE ctermbg=NONE
