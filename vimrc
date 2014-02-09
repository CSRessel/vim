" vimrc
" Author: C S Ressel
" Source: https://github.com/csressel/vim/vimrc
" Created 6/16/13
"-------------------------
"-------------------------


"-------------------------
"-------------------------
" Preamble
"-------------------------
"-------------------------

filetype off
execute pathogen#infect()
filetype plugin indent on
set nocompatible
syntax on


"-------------------------
"-------------------------
" Options
"-------------------------
"-------------------------

if has('gui_running') 			" Set the colorscheme for gvim
	set background =dark
	colorscheme solarized
endif
set incsearch 					" Search as you type
set smartcase 					" Ignore case if all lowercase, case sensitive otherwise
set t_vb= 						" Remove annoying errors
set tm=500 						" Remove annoying errors
set number 						" Line numbs
set rnu 						" Relative line numbs
set tabstop=4
set shiftwidth=4
set autoindent 					" Repeats previous line spacing (tabs + comments)
set history=1000
set undolevels=1000
set clipboard=unnamedplus 		" Use the system clipboard as default copy/paste register
set title 						" Have vim as title in a shell
set backspace=eol,start,indent 	" Have backspace act as it should
set ttimeout 					" Eliminate <ESC> lag
set ttimeoutlen=100 			" Eliminate <ESC> lag


"-------------------------
"-------------------------
" Plugin stuff
"-------------------------
"-------------------------

" For Autoclose
let g:AutoClosePairs = "() [] \" '"
" For CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
" For NERDTree
set autochdir
let NERDTreeChDirMode=2
" For vim-latexsuite
"set grepprg=grep\ -nH\ $*
"let g:tex_flavor = "latex"
"set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after


"-------------------------
"-------------------------
" Keybindings/remappings
"-------------------------
"-------------------------

noremap H ^
noremap L $
inoremap {<CR>  {<CR>}<Esc>O
cmap W w<CR>
cmap Q q<CR>
cmap w! !sudo tee %<CR>
noremap / /\v
noremap S :%s/


"-------------------------
"-------------------------
" Leaders
"-------------------------
"-------------------------

" Map the leader to...
let mapleader =","
" And the localleader to...
let maplocalleader ="\\"

nnoremap <Leader>c :setlocal spell!<CR>
nnoremap <Leader>x :ConqueTermVSplit bash<CR>
nnoremap <Leader>z :ConqueTermSplit bash<CR>
nnoremap <Leader>n :NERDTreeToggle .<CR>


"-------------------------
"-------------------------
" Autocommands
"-------------------------
"-------------------------

" augroup stops autocmd spam caused by repeated reloading of vimrc
augroup vimrc_autocmd
	autocmd!

	" Automatically reload vimrc when it's saved
	autocmd BufWritePost .vimrc so ~/.vimrc

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
