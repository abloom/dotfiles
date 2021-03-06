set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'    " required

Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim'
Plugin 'sirtaj/vim-openscad'
Plugin 'vim-scripts/align'
Plugin 'rodjek/vim-puppet'
Plugin 'fatih/vim-go'
Plugin 'google/vim-maktaba'
Plugin 'bazelbuild/vim-bazel'
Plugin 'cappyzawa/starlark.vim'
Plugin 'prettier/vim-prettier'

"if has('nvim')
  "Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
  "Plugin 'Shougo/deoplete.nvim'
  "Plugin 'roxma/nvim-yarp'
  "Plugin 'roxma/vim-hug-neovim-rpc'
"endif
"Plugin 'zchee/deoplete-go', { 'do': 'make'}

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
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype go setlocal noexpandtab

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

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.so,*/tmp/*,*/build/*,*/prof/*

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

" deoplete
let g:python3_host_prog = "/usr/local/bin/python3"
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = '~/go/bin/gocode'
" CtrlP
let g:ctrlp_max_files=50000
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" Syntastic
let g:syntastic_ignore_files=['c']
" Airline
set laststatus=2 " make sure airline renders on non-split panes
let g:airline_powerline_fonts = 1
let g:airline_section_a = ''
let g:airline_section_b = ''
let g:airline_skip_empty_sections = 1

let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$[[dir]]']
autocmd! GUIEnter * set vb t_vb=
autocmd BufNewFile,BufRead *.pp set filetype=puppet
autocmd BufNewFile,BufRead *.sky set filetype=starlark
autocmd BufRead,BufNewFile *.bzl,BUILD,*.BUILD,BUILD.*,WORKSPACE setfiletype bzl

set mouse=a
let g:go_fmt_command = "goimports"
set clipboard=unnamed
