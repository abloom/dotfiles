call pathogen#infect()
syntax on
filetype plugin indent on
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

autocmd vimenter * if !argc() | NERDTree | endif

"autocmd FileType c,cpp,java,php,js,ruby,coffee,scss,css,haml autocmd BufWritePre <buffer> :%s/\s\+$//e

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

let g:Powerline_symbols = 'fancy'
set laststatus=2 " make sure powerline renders on non-split panes

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
