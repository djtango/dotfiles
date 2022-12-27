set nocompatible
filetype off


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'morhetz/gruvbox'
Plugin 'bling/vim-airline'
Plugin 'tomtom/tcomment_vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'zhaocai/GoldenView.Vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'wlangstroth/vim-racket'
Plugin 'altercation/vim-colors-solarized'
Plugin 'raichoo/purescript-vim'
Plugin 'ElmCast/elm-vim'
Plugin 'suoto/vim-hdl'
Plugin 'reasonml-editor/vim-reason-plus'
Plugin 'fatih/vim-go'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'jparise/vim-graphql'

call vundle#end()
filetype plugin indent on

" packadd! matchit
" runtime macros/matchit.vim

let g:solarized_termcolors=256
" Daytime
colorscheme solarized
set bg=light

" Nighttime
" colorscheme gruvbox
" set bg=dark

" alt for local
" colorscheme murphy
" set bg=dark
" set number
" set relativenumber

" alt for pairbox
" colorscheme solarized
" set bg=dark
set number
" set relativenumber

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

"Configure racket indentation
if has("autocmd")
  au filetype racket set lisp
  au filetype racket set autoindent
  imap <C-\> <C-k>l*
endif

"language-specific tabstops
autocmd Filetype python setlocal ts=4 sts=4 sw=4
autocmd Filetype java setlocal ts=4 sts=4 sw=4
autocmd Filetype elm setlocal ts=4 sts=4 sw=4
"autocmd Filetype scheme setlocal ts=1 sts=1 sw=1
"Airline settings

let g:airline#extensions#tabline#enabled = 1

"map src to reload VIMRC
nmap <leader>src :w<cr> :source $MYVIMRC<cr>

"Setting up auto-save
" :au FocusLost * :wa
" set autowrite
" set autoread

"GoldenView Settings

let g:goldenview__enable_default_mapping = 0

nmap <silent><leader>sgv <Plug>GoldenViewSplit
" nmap <silent><Tab> <Plug>GoldenViewNext
" nmap <silent><S-Tab> <Plug>GoldenViewPrevious
nmap <silent><leader>n <Plug>GoldenViewNext
nmap <silent><leader>p <Plug>GoldenViewPrevious
nmap <silent><leader>tgv <Plug>GoldenViewSwitchToggle
nmap <silent><leader>mgv <Plug>GoldenViewSwitchMain

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
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard | grep -v -G "\(.svg\)\|\(.png\)\|\(.jpg\)$"']

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\app\v[\/]assets$',
  \ }



" let g:ctrlp_custom_ignore = 'node_modules'
" let g:ctrlp_custom_ignore = 'bower_components'
" let g:ctrlp_custom_ignore = 'public/bower_components'
let g:ctrlp_custom_ignore = 'app/assets'
" move through buffers quicker
nmap <leader>x :bn<cr>
nmap <leader>z :bp<cr>
" nmap <leader>r <F5><cr>
"
" Display trailing/extra whitespace
set list listchars=tab:»·,trail:·

"delimitMate settings

au Filetype clojure,scheme let b:delimitMate_quotes = "\""
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1
let delimitMate_jump_expansion = 1

au Filetype java let b:delimitMate_matchpairs = "(:),[:],{:},<:>"
"YCMD settings
let g:ycm_filetype_specific_completion_to_disable = {
      \ 'gitcommit': 1,
      \ 'racket': 1
      \}
let g:ycm_semantic_triggers = {
      \'racket' : ['-', ':']
      \}
set omnifunc=syntaxcomplete#Complete

"clojure repl
" function! FindCljNs()
"   normal! /(ns\vee"1y
"   " normal ygg"1yy:new\\"1p$a)\\p:% ! nc localhost 50505\\
" endfunction
"
" function! CopySelection()
"   normal! gvy
" endfunction
"
" function! FindExpr()
"   normal! y%
" endfunction
"
" function! DumpContentsToNewRegister()
"   normal! :new\"1p$a)\p
" endfunction
"
" function! PipeRegisterToRepl()
"   normal! :% ! nc localhost 50505\
" endfunction

function! FindCljNs()
  execute "normal! /(ns\<CR>vee\"1y\<C-O>"
endfunction

function! CopySelection()
  execute "normal! gvy"
endfunction

function! FindExpr()
  execute "normal! y%"
endfunction

function! DumpContentsToNewRegister()
  execute "normal! :new\<CR>\"1p$a)\<CR>\<ESC>p"
endfunction

function! WrapContentsInDoBlock()
  set paste
  " go to top of file
  execute "normal! :0\<CR>"
  " insert new line and prepend (do
  execute "normal! O(do\<CR>\<ESC>"
  " go to end of buffer and append )
  execute "normal! Go)\<ESC>"
  set nopaste
endfunction

function! CatContentsToReplLog()
  execute "normal! :% ! cat >> dt_repl\<CR>"
  execute "normal! u\<CR>"
  " execute "normal! :bp!|bd! #\<CR>"
  " execute "normal! :e dt_repl\<CR>"
endfunction

function! CloseBuffer()
  execute "normal! :bd!\<CR>"
endfunction

" function! OpenReplLogAndPipeCodeToRepl()
"   execute "normal! :e dt_repl\<CR>\" ! cat >> dt_repl\<CR>"
" endfunction

function! CatContentsToReplLog2()
  execute "normal! :% ! cat >> foooo\<CR>"
endfunction

" function! ExecuteCommandInReplRegister()
"   execute "normal! :new .vim_repl\<CR>\"1p$a)\<CR>\<ESC>p"
" endfunction

function! PipeRegisterToRepl()
  execute "normal! :% ! nc localhost 50505\<CR>"
endfunction


function! SendSelectionToRepl() range
  call CopySelection()
  call FindCljNs()
  call DumpContentsToNewRegister()
  call WrapContentsInDoBlock()
  " call CatContentsToReplLog()
  call PipeRegisterToRepl()
  call CatContentsToReplLog()
  call CloseBuffer()
endfunction

function! SendExprToRepl()
  call FindExpr()
  call FindCljNs()
  call DumpContentsToNewRegister()
  call WrapContentsInDoBlock()
  " call CatContentsToReplLog()
  call PipeRegisterToRepl()
  call CatContentsToReplLog()
  call CloseBuffer()
endfunction

nmap cpp :call SendExprToRepl()<CR>
vmap cpp :call SendSelectionToRepl()<CR>

" let @d = 'ygg"1yy:new\"1p$a)\p:% !./to_repl.sh\'
" let @k = 'ygg0"1y3w:new\"1pa)\p:% ! nc localhost 50505\'
let @p = ":call SendExprToRepl()"


let g:go_gopls_enabled = 0


" function! IgnoreCarwowRuby()
"   set wildignore+=*/public/packs/*
"   set wildignore+=*/node_modules/*
"   set wildignore+=*/elm-stuff/*
" endfunction
function! IgnoreLollipop()
  set wildignore+=*/app/assets**.
  set wildignore+=*/app/assets**/*.svg
endfunction

" call IgnoreLollipop()

let g:netrw_liststyle = 3

function! GitHubLink()
  redir => currentFile
  silent execute "echo @%"
  redir END
  redir => repo
  silent execute "echo expand('%:p:h:t')"
  redir END
  redir => org
  silent execute "echo expand('%:p:h:h:t')"
  redir END
  let gitsha = system('git rev-parse --short HEAD')
  redir => currentLine
  silent execute "echo line(\".\")"
  redir END
  echo "https://github.com/lollipopai/lollipop-alpha/tree/" . trim(gitsha) . "/" . trim(currentFile) . "#L" . trim(currentLine)
endfunction

nmap <leader>ghl :call GitHubLink()<cr>
