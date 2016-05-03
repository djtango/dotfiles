set nocompatible
filetype off


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'xero/sourcerer.vim'
Plugin 'morhetz/gruvbox'
Plugin 'bling/vim-airline'
Plugin 'tomtom/tcomment_vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'zhaocai/GoldenView.Vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rking/ag.vim'

call vundle#end()
filetype plugin indent on

colorscheme gruvbox 
set bg=dark
set number
set relativenumber
"enable yanking to clipboard for Mac
set clipboard=unnamed
"enable yanking to clipboard for Linux(Ubuntu/Mint)
set clipboard=unnamedplus

set cursorline
set cursorcolumn
set ruler
set showcmd
set incsearch

"set tabs to 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set cindent
set lisp

"language-specific tabstops
autocmd Filetype python setlocal ts=4 sts=4 sw=4
autocmd Filetype java setlocal ts=4 sts=4 sw=4
"autocmd Filetype scheme setlocal ts=1 sts=1 sw=1
"Airline settings

let g:airline#extensions#tabline#enabled = 1

"map src to reload VIMRC
nmap <leader>src :w<cr> :source $MYVIMRC<cr>

"Setting up auto-save
:au FocusLost * :wa
set autowrite
set autoread

"GoldenView Settings

let g:goldenview__enable_default_mapping = 0

nmap <silent><leader>sgv <Plug>GoldenViewSplit
nmap <silent><Tab> <Plug>GoldenViewNext
nmap <silent><S-Tab> <Plug>GoldenViewPrevious
nmap <silent><leader>n <Plug>GoldenViewSwitchToggle
nmap <silent><leader>m <Plug>GoldenViewSwitchMain

" CtrlP auto cache clearing.
" ----------------------------------------------------------------------------
function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction
if has("autocmd")
  autocmd VimEnter * :call SetupCtrlP()
endif
" configure ctrlP to ignore node modules
let g:ctrlp_custom_ignore = 'node_modules'
" let g:ctrlp_custom_ignore = 'bower_components'
" let g:ctrlp_custom_ignore = 'public/bower_components'
" move through buffers quicker
nmap <leader>x :bn<cr>
nmap <leader>z :bp<cr>
" nmap <leader>r <F5><cr>
" Display extra whitespace
set list listchars=tab:»·,trail:·

"delimitMate settings

au Filetype clojure,scheme let b:delimitMate_quotes = "\""
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1
let delimitMate_jump_expansion = 1
