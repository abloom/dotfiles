set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'    " required

Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'sirtaj/vim-openscad'
Plugin 'derekwyatt/vim-scala'
Plugin 'ktvoelker/sbt-vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'wavded/vim-stylus'
Plugin 'vim-scripts/align'

call vundle#end()            " required
filetype plugin indent on    " required

syntax on
set guioptions+=LlRrbm
set guioptions-=LlRrbm
set background=dark
colorscheme solarized
set wrap
set number
set expandtab
set softtabstop=2 shiftwidth=2 expandtab

if has("gui_running")
  set guioptions=-t
endif

" open nerdtree if there was no file specified
autocmd vimenter * if !argc() | NERDTree | endif

" Strip trailing whitespace in the current buffer
nnoremap <leader>w :call StripTrailingWhiteSpace()<CR>

" Strip trailing whitespace upon write
autocmd BufWritePre  *.{rb,js,coffee,scss,css,haml}  call StripTrailingWhiteSpace()

function! StripTrailingWhiteSpace()
  let l:winview = winsaveview()
  silent! %s/\s\+$//
  call winrestview(l:winview)
endfunction

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.so

noremap <leader>n :NERDTreeToggle<CR>

set incsearch
set hlsearch
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase

set guifont=Source\ Code\ Pro\ for\ Powerline:h14

" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set shell=/bin/zsh

" CtrlP
let g:ctrlp_max_files=50000
" Syntastic
let g:syntastic_ignore_files=['c']
" Airline
set laststatus=2 " make sure airline renders on non-split panes
let g:airline_powerline_fonts = 1

let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$[[dir]]']
