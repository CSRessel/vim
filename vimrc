" vimrc
" Author: C S Ressel
" Created 6/16/13
"---------------------------------------------------------------

" Preamble -----------------------------------------------------{{{

" Automatically reload vimrc when it's saved
autocmd BufWritePost .vimrc so ~/.vimrc

filetype off
execute pathogen#infect()
filetype plugin indent on
set nocompatible
syntax on

" }}}

" Options ------------------------------------------------------{{{

" Search as you type
set incsearch
" highlight search matches
set hlsearch
" Ignore case if all lowercase, case sensitive otherwise
set smartcase
" Remove annoying errors
set t_vb=
set tm=500
" Tabs w/ tab char equiv to four spaces
set tabstop=4
set shiftwidth=4
" Plenty of history
set history=1000
" Lots of undo levels
set undolevels=1000
" Have vim as title in a shell
set title
" Have backspace act as it should
set backspace=eol,start,indent
" Add chars for unwrapped lines
set listchars=extends:❯,precedes:❮
" Fold text between {{{ and }}} (in comments)
set foldmethod=marker
" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
" Don't redraw while executing macros (good performance config)
set lazyredraw
" Repeats previous line spacing (tabs + comments)
set autoindent
" Wrap lines
set wrap
" Line numbs
set number
" Relative line numbs
set rnu

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10
set noesckeys

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Restore cursor position on file open {{{
augroup JumpCursorOnEdit
	au!
	autocmd BufReadPost *
	\ if expand("<afile>:p:h") !=? $TEMP |
	\	if line("'\"") > 1 && line("'\"") <= line("$") |
	\		let JumpCursorOnEdit_foo = line("'\"") |
	\		let b:doopenfold = 1 |
	\		if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
	\			let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
	\			let b:doopenfold = 2 |
	\		endif |
	\		exe JumpCursorOnEdit_foo |
	\	endif |
	\ endif
	" Need to postpone using "zv" until after reading the modelines.
	autocmd BufWinEnter *
	\ if exists("b:doopenfold") |
	\	exe "normal zv" |
	\	if(b:doopenfold > 1) |
	\		exe  "+".1 |
	\	endif |
	\	unlet b:doopenfold |
	\ endif
augroup END
" }}}

" Set the colorscheme for gvim
if has('gui_running')
	set background =dark
	colorscheme solarized
endif

" }}}

" Plugin stuff -------------------------------------------------{{{

" Plugin mappings are in 'Keybindings/remappings' or 'Leaders'

" For autoclose {{{
let g:AutoClosePairs = "() [] \" '"
" }}}

" For ctrlp {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
" }}}

" For nerdtree {{{
set autochdir
let NERDTreeChDirMode=2
" }}}

" For conqueterm {{{
"let g:ConqueTerm_Color = 1
" }}}

" For airline {{{
"let g:airline_powerline_fonts = 1
" Always show airline status
set laststatus=2
" Hide the default mode text (e.g. -- INSERT -- below the statusline
set noshowmode
" }}}

" }}}

" Keybindings/remappings ---------------------------------------{{{

noremap H ^
noremap L $
inoremap {<CR> {<CR>}<Esc>O
cmap W w<CR>
cmap Q q<CR>
cmap w! !sudo tee %
noremap / /\v
noremap S :%s/

" }}}

" Leaders ------------------------------------------------------{{{

" Map the leader to...
let mapleader =","
" And the localleader to...
let maplocalleader ="\\"

nnoremap <Leader>c :setlocal spell!<CR>
nnoremap <Leader>x :ConqueTermVSplit bash --norc<CR>
nnoremap <Leader>z :ConqueTermSplit bash --norc<CR>
nnoremap <Leader>n :NERDTreeToggle .<CR>
nnoremap <Leader><Space> :let @/ = ""<CR>

" }}}

" Filetype options ---------------------------------------------{{{

" augroup stops autocmd spam caused by repeated reloading of vimrc
augroup vimrc_autocmd
	autocmd!

	" C and C++ {{{
	autocmd FileType c setlocal comments-=://
	autocmd FileType c setlocal comments+=://
	" }}}
	" HTML {{{
	autocmd FileType html set tabstop=2
	autocmd FileType html set shiftwidth=2
	autocmd FileType html set expandtab
	" }}}
	" Java {{{
	autocmd FileType java setlocal comments-=://
	autocmd FileType java setlocal comments+=f://
	" }}}
	" Perl {{{
	autocmd FileType perl setlocal comments-=:#
	autocmd FileType perl setlocal comments+=:#
	" }}}
	" Ruby {{{
	autocmd FileType ruby setlocal comments-=:#
	autocmd FileType ruby setlocal comments+=f:#
	autocmd FileType ruby set tabstop=2
	autocmd FileType ruby set shiftwidth=2
	autocmd FileType ruby set expandtab
	autocmd FileType ruby imap <S-CR> <CR><CR>end<Esc>-cc
	" }}}
	" Shell {{{
	autocmd FileType sh setlocal comments-=:#
	autocmd FileType sh setlocal comments+=:#
	" }}}
	" Vim {{{
	autocmd Filetype vim let g:AutoClosePairs = "() []"
	" }}}

augroup END

" }}}

