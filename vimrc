" C S Ressel's vimrc
" Created 6/16/13
"-------------------------
"-------------------------


"-------------------------
"-------------------------
" Random
"-------------------------
"-------------------------


" Automatically reload vimrc when it's saved
"au BufWritePost .vimrc so ~/.vimrc

" For filetype specific options
filetype indent plugin on

" For vim-latexsuite
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

" For pathogen:
execute pathogen#infect()


"-------------------------
"-------------------------
" Options
"-------------------------
"-------------------------


" Enable syntax highlighting
syntax on

" Enable solarized for gvim
if has('gui_running')
	set background =dark
	colorscheme solarized
endif

" Search as you type
set incsearch

" Ignore case if all lowercase, case sensitive otherwise
set smartcase

" No annoying error bells9
"set noerrorbells
"set visualbell
set t_vb=
set tm=500

" Line numbs
set number
" Relative line numbs
set rnu

" Length of tabs
set tabstop=4
set shiftwidth=4

" Repeats previous line spacing (tabs + comments)
set autoindent

" remember more commands and and search history
set history=1000
" LOTS of levels of undo
set undolevels=1000

" Use the system clipboard as default copy/paste register
set clipboard=unnamedplus

" Set of characters to be used by autoclose plugin
let g:AutoClosePairs = "() [] \" '"

" Have vim as title in a shell
set title

" Have backspace act as it should
set backspace=eol,start,indent

" For CtrlP's working directory
let g:ctrlp_working_path_mode = 'ra'

" Eliminate <ESC> lag
set ttimeout
set ttimeoutlen=100


"-------------------------
"-------------------------
" Keybindings/remappings
"-------------------------
"-------------------------


" The smash escape
"inoremap jk <Esc>
"inoremap kj <Esc>
"vnoremap jk <Esc>
"vnoremap kj <Esc>

" EOL/BOL from home row:
noremap H ^
noremap L $

" For autocompleting braces
inoremap {<CR>  {<CR>}<Esc>O

" For CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


"-------------------------
"-------------------------
" Leaders
"-------------------------
"-------------------------


" Map the leader to...
let mapleader =","
" And the localleader to...
let maplocalleader ="\\"


" Quickly quit
nnoremap <Leader>q :q<CR>

" Quickly save
nnoremap <Leader>w :w<CR>

" Save without root privileges
nnoremap <Leader>e :!sudo tee %<CR>

" Toggle spellcheck
nnoremap <Leader>c :setlocal spell!<CR>

" For ConqueTerm
nnoremap <Leader>x :ConqueTermVSplit bash<CR>
nnoremap <Leader>z :ConqueTermSplit bash<CR>

" For NERDTree
set autochdir
let NERDTreeChDirMode=2
nnoremap <Leader>n :NERDTreeToggle .<CR>


"-------------------------
"-------------------------
" Autocommands
"-------------------------
"-------------------------


" augroup stops autocmd spam from reloading vimrc
augroup vimrc_autocmd
	autocmd!

	" C and C++ options
	autocmd FileType c setlocal comments-=://
	autocmd FileType c setlocal comments+=://
	" HTML options
	autocmd FileType html set tabstop=2
	autocmd FileType html set shiftwidth=2
	autocmd FileType html set expandtab
	" Java options
	autocmd FileType java setlocal comments-=://
	autocmd FileType java setlocal comments+=f://
	" Perl options
	autocmd FileType perl setlocal comments-=:#
    autocmd FileType perl setlocal comments+=:#
	" Ruby options
	autocmd FileType ruby setlocal comments-=:#
	autocmd FileType ruby setlocal comments+=f:#
	autocmd FileType ruby set tabstop=2
	autocmd FileType ruby set shiftwidth=2
	autocmd FileType ruby set expandtab
	autocmd FileType ruby imap <S-CR>    <CR><CR>end<Esc>-cc
	" Shell options
	autocmd FileType sh setlocal comments-=:#
    autocmd FileType sh setlocal comments+=:#

augroup END

