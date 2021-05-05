" To install vimplug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" wget https://www.vim.org/scripts/download_script.php?src_id=24473;
" mv wrongname to perl-support.zip 
" cd .vim; unzip ~/perl-support.zip ./
"
"
"
"Due to the submodule way of handling plugins i think my plugin manager wont
"update anymore.  This command is needed to udpate the repos:
"git submodule foreach git checkout master && git submodule foreach git pull
"
"
"
"perl 
filetype plugin on
helptags ~/.vim/doc
noremap  <silent> <F5>    :copen<CR>
noremap  <silent> <F6>    :cclose<CR>
noremap  <silent> <F7>    :cp<CR>
noremap  <silent> <F8>    :cn<CR>

set t_u7=
map <SPACE> <leader>

set tags=./tags;

set completeopt=menuone
"let g:mucomplete#enable_auto_at_startup = 1


vnoremap <leader>p "_dp
nnoremap <leader>dd "_d

"
" perl
filetype plugin on
let g:Perl_Perl = '/usr/bin/perl'
let perl_extended_vars = 1


"=============
"== Plugins ==
"=============

call plug#begin('~/.vim/autoload')
Plug 'vim-utils/vim-man'
Plug 'vim-scripts/delimitMate.vim'
Plug 'konfekt/fastfold'
Plug 'mbbill/undotree'
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'henrik/vim-indexed-search'
Plug 'luochen1990/rainbow'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'lifepillar/vim-mucomplete'
call plug#end()

"====================
"== Basic Settings ==
"====================
syntax on
set nocompatible
set bg=dark
set hls
"set visualbell
set number
set relativenumber
set background=dark
set hidden
set mouse=a
set timeoutlen=1000
set ttimeoutlen=0
set cursorline
set ignorecase
set smartcase
" set clipboard+=unnamed
" set clipboard+=unnamedplus
set showcmd
set cindent
set smartindent
set autoindent
set incsearch
set backspace=indent,eol,start
set encoding=utf-8
set fileencoding=utf-8
set lazyredraw
set splitbelow
set splitright
set scrolloff=10
set tabstop=8
set noexpandtab

		

if &term =~ '256color'
	set t_ut=
endif

" perl
let perl_extended_vars=1

"perl tidy 
nnoremap <silent> <leader>t :%!perltidy -q<Enter>
vnoremap <silent> <leader>t :!perltidy -q<Enter>

"DelitMate
let delimitMate_expand_cr = 1
filetype indent plugin on

" tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

" folding
set foldmethod=manual
set foldlevelstart=999
let perl_fold=1
let javaScript_fold=1
let xml_syntax_folding=1
 let sh_fold_enabled=1
nmap <leader>ff za
" This needs some work
" Currently folds everything then unfolds one level
" Works great for perl modules but not really for JS
nmap <leader>fa zMzr
nmap <leader>fu zR


"==================
"== Key Bindings ==
"==================
" general

" semicolon to colon
"nmap ; :

" navigate between buffers
" using Ctrl+Arrow
nnoremap <C-Right> :bn<CR>
vnoremap <C-Right> :bn<CR>
nnoremap <C-Left> :bp<CR>
vnoremap <C-Left> :bp<CR>

" navigate between buffers
" using leader
nnoremap <leader>l :bn<CR>
nnoremap <leader>h :bp<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bu :bu<CR>

" toggle spell check
nmap <leader>ss :setlocal spell!<CR>

" navigate between windows
" using Shift+Arrow
nmap <silent> <S-Up> :wincmd k<CR>
nmap <silent> <S-Down> :wincmd j<CR>
nmap <silent> <S-Left> :wincmd h<CR>
nmap <silent> <S-Right> :wincmd l<CR>

" Set jj to exit insert mode 
:imap jj <Esc>

" Mouse mode
nnoremap <leader>m :set mouse=<CR>
nnoremap <leader>M :set mouse=a<CR>

" paste mode
nnoremap <leader>s :set paste<CR>

" buffer list
nnoremap <leader>b :buffers<CR>

" Set colurs
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle


colorscheme gruvbox
set background=dark


" Git/svn commit message settings
au FileType gitcommit,svn setlocal tw=72
au FileType gitcommit,svn setlocal cc=+1
hi SpellBad ctermbg=red ctermbg=white guibg=red guifg=white



" Ctrl p optimizations
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
	  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  endif
let g:ctrlp_open_multiple_files = 't'
"let g:ctrlp_working_path_mode = 'ca'
nnoremap <C-a> :CtrlP :pwd<CR>
nnoremap <C-h> :CtrlP ~<CR>
let g:ctrlp_show_hidden = 1
