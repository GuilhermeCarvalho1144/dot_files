" Basic config
:set number
:set relativenumber
:set autoindent
:set mouse=a
:set tabstop=2
:set shiftwidth=2
:set smarttab 
:set softtabstop=2
:set wildmode=longest,list
:set showmatch
:syntax on

:au bufnewfile *.sh 0r ~/.config/nvim/sh_header.temp

call plug#begin('~/.config/nvim/plugged')

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'https://github.com/tc50cal/vim-terminal'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/Mofiqul/dracula.nvim'
Plug 'https://github.com/terryma/vim-multiple-cursors'
Plug 'https://github.com/preservim/tagbar'
Plug 'https://github.com/neoclide/coc.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dracula/vim', {'as':'dracula'}
Plug 'jiangmiao/auto-pairs'

set encoding=UTF-8

call plug#end()

colorscheme dracula

autocmd FileType python let b:coc_sugest_disable = 1

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

nmap <F8> :TagbarToggle<CR>

inoremap <expr> <Enter> coc#pum#visible() ? coc#_select_confirm() : "<Enter>"

" NERDTree
" Refresh the current folder if any changes
autocmd BufEnter NERD_tree_* | execute 'normal R'
au CursorHold * if exists("t:NerdTreeBufName") | call <SNR>15_refreshRoot() | endif

"Reload the window if directory is changed
augroup DIRCHANGE
    au!
    autocmd DirChanged global :NERDTreeCWD
augroup END

"Close nerdtree automatically if it is theonly window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
