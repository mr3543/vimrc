set nocompatible

set hidden
set splitbelow

filetype plugin on

set path+=**

set wildmenu 

let g:netrw_banner=0                " disable banner
let g:netrw_browse_split=4          " open in prior window
let g:netrw_altv=1                  " open splits to the right
let g:netrw_liststyle=3             " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

set tabstop=4
set virtualedit=onemore
set shiftwidth=4
set smarttab
set expandtab
set mouse=a
set autoindent

"set cindent
set smartindent
"fix issue with # symbol not using smartindent
inoremap # X<c-h>#

set laststatus=2
set showmode

" relative line numbers
set relativenumber
set rnu

syntax enable
set noerrorbells

" map esc to jj, stop vim from moving cursor to the left 
" after leaving insert mode 
inoremap jj <Esc>l

"easy switching between files
nnoremap ! <c-^>

" search settings
set smartcase
set incsearch

" enter/leave paste mode w/ <F8>
set pastetoggle=<F8>

" allow for undos after closing file
set undodir=~/.vimdid
set undofile

" disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"move to the beginning of a line with q instead of shift-6
nnoremap q ^

"visual
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=blue

call plug#begin('~/.vim/plugged')
"color scheme
Plug 'morhetz/gruvbox'

"fast grep
Plug 'jremmen/vim-ripgrep'

"plugs for git
Plug 'tpope/vim-fugitive'

"man pages
Plug 'vim-utils/vim-man'

"for c++
Plug 'lyuts/vim-rtags'

"nice file finding
Plug 'kien/ctrlp.vim'

"auto complete
Plug 'Valloric/YouCompleteMe'

"undo tree
Plug 'mbbill/undotree'

call plug#end()

colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

"let g:ctrlp_use_caching = 0
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrl_p'

"navigation around windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>q :wincmd q<CR>

"opens undo tree
nnoremap <leader>u :UndotreeShow<CR>
"opens file tree
nnoremap <leader>ft <C-w>v :Ex <bar> :vertical resize 30<CR>
"rip-grep
nnoremap <leader>ps :Rg<SPACE>
"changes size of windows 
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

"YCM

" close the preview window when insert mode is exited
" let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_add_preview_to_completeopt = 1
set completeopt-=preview
nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR> 
nnoremap <silent> <leader>do :YcmCompleter GetDoc<CR>
nnoremap <silent> <leader>gw :sp <CR> :YcmCompleter GoTo<CR>

