let mapleader = ","
let g:mapleader = ","

" Load Pluggins
call plug#begin()

Plug 'flazz/vim-colorschemes'
Plug 'kien/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'rking/ag.vim'
Plug 'ddollar/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'neomake/neomake'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'elzr/vim-json'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'terryma/vim-multiple-cursors'
Plug 'bronson/vim-trailing-whitespace'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-complete' }

Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

call plug#end()

" Make Ctrl+P indexing faster by using ag silver searcher
let g:ctrlp_lazy_update = 350
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 0
if executable("ag")
   set grepprg=ag\ --nogroup\ --nocolor
   let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
endif

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_open_list = 2

" PyMatcher for CtrlP
"if !has('python')
"    echo 'In order to use pymatcher plugin, you need +python compiled vim'
"else
"    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
"endif

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/\.git/*

" Vim mappings
nmap <leader>vb :e ~/.config/nvim/init.vim<cr>

"Source current file.
nmap <leader>so :so %<cr>

" Nerdtree mappings
map <leader>n :NERDTreeToggle<CR>

" Tagbar mappings
nmap <leader>rt :TagbarToggle<CR>

" Fugitive mappings
nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>

set relativenumber
set nocompatible
set t_Co=256

set history=100

"colorscheme xoria256
colorscheme railscasts
"colorscheme tir_black
"colorscheme moonshine

set linespace=15

set number
set ignorecase
set smartcase
set timeout timeoutlen=400 ttimeoutlen=200
set visualbell
set noerrorbells
set autowrite

nmap <leader>w :w!<cr>

imap <leader><leader> <esc>
cmap <leader><leader> <esc>
vmap <leader><leader> <esc>
nnoremap :: q:
nnoremap // q/
nnoremap ?? q?
nnoremap ;; maA;<esc>`a

inoremap <leader>. ->
inoremap $$ <esc>bi$<esc>ea->
inoremap <leader>> =>
inoremap ;; <esc>maA;<esc>`aa
inoremap (j (<cr>)<esc>O
inoremap {j {<cr>}<esc>O
inoremap <l <></><esc>v2F<:MultipleCursorsFind ><cr>ii

set pastetoggle=<leader>v

"Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"Split below
nmap :sp :rightbelow sp<cr>

" Forward or back to buffer
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>

set noshowmode

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

autocmd BufWritePre *.php :%s/\s\+$//e
autocmd BufWritePre *.module :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e

autocmd cursorhold * set nohlsearch
autocmd cursormoved * set hlsearch

autocmd! BufWritePost * Neomake

" Remove search results
command! H let @/=""

function! GetBufferList()
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

nmap <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
nmap <silent> <leader>q :call ToggleList("Quickfix List", 'c')<CR>

autocmd filetype php setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd filetype python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" Airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline_theme= 'zenburn'
