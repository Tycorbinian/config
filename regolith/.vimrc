""""""""""""""""""""""""""""""""""""""""""""""""
"Vim-plug initialization------------------------
""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
set rtp+=~/.vim
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
"Plug 'maximbaz/lightline-ale'
"Plug 'dense-analysis/ale'
Plug 'bfrg/vim-cpp-modern' 
Plug 'vim-syntastic/syntastic'
Plug 'ycm-core/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
Plug 'vim-scripts/a.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""
"PLUG-CONFIG-BEGIN------------------------------
""""""""""""""""""""""""""""""""""""""""""""""""
"YOU-COMPLETE-ME""""""""""""""""""""""""""""""""
let g:ycm_error_symbol = ">>"
let g:ycm_warning_symbol = ">>"
let g:ycm_autoclose_preview_window_after_completion = 1

"SYNTASTIC-------------------------------------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers=['perl']
""""""""""""""""""""""""""""""""""""""""""""""""
"LIGHTLINE-------------------------------------
let g:lightline = {'colorscheme': 'wombat',}
if !has('gui_running')
  set t_Co=256
endif
set laststatus=2
set noshowmode

""""""""""""""""""""""""""""""""""""""""""""""""
"LIGHTLINE-ALE----------------------------------
"let g:lightline.component_expand = {
"      \  'linter_checking': 'lightline#ale#checking',
"      \  'linter_warnings': 'lightline#ale#warnings',
"      \  'linter_errors': 'lightline#ale#errors',
"      \  'linter_ok': 'lightline#ale#ok',
"      \ }
"let g:lightline.component_type = {
"      \     'linter_checking': 'left',
"      \     'linter_warnings': 'warning',
"      \     'linter_errors': 'error',
"      \     'linter_ok': 'left',
"      \ }
"let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }

"let g:lightline#ale#indicator_checking = "\uf110"
"let g:lightline#ale#indicator_warnings = "\uf071"
"let g:lightline#ale#indicator_errors = "\uf05e"
"let g:lightline#ale#indicator_ok = "\uf00c"

""""""""""""""""""""""""""""""""""""""""""""""""
"ALE--------------------------------------------
"let g:ale_list_window_size = 36
"let g:ale_close_preview_on_insert = 1
"let g:ale_linters = {
"	\   'cpp': ['gcc'],
"	\   'go': ['gofmt'],
"	\   'perl': ['perlcritic'],
"	\}
"let g:ale_list_vertical = 1
"let g:ale_open_list = 1
"map <C-[> :lprev <CR>
"map <C-]> :lnext <CR>
""""""""""""""""""""""""""""""""""""""""""""""""
"NERDTREE---------------------------------------
map <C-n> :NERDTreeToggle<CR>
map <C-b> :NERDTreeFromBookmark 
let g:NERDTreeBookmarkSort = 1
let g:NERDTreeMarkBookmarks = 0
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
let g:NERDTreeHighlightCursorline = 1

""""""""""""""""""""""""""""""""""""""""""""""""
"NERDTREE-GIT-----------------------------------
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "＊",
    \ "Staged"    : "+",
    \ "Untracked" : "!",
    \ "Renamed"   : "~",
    \ "Unmerged"  : "=",
    \ "Deleted"   : "x",
    \ "Dirty"     : ">",
    \ "Clean"     : "・",
    \ 'Ignored'   : '^',
    \ "Unknown"   : "?"
    \ }

""""""""""""""""""""""""""""""""""""""""""""""""
"VIM-DEVICONS-----------------------------------
set encoding=UTF-8

""""""""""""""""""""""""""""""""""""""""""""""""
"VIM-WIKI---------------------------------------
let g:vimwiki_hl_headers = 1
let wiki_1 = {}
let wiki_1.path = '~/repos/vimwiki/'
let wiki_1.index = 'index'
let g:vimwiki_list = [wiki_1]
au BufRead,BufNewFile *.wiki set filetype=vimwiki

""""""""""""""""""""""""""""""""""""""""""""""""
"CALENDAR-VIM
function! ToggleCalendar()
  execute ":Calendar"
  execute ":vertical resize +5"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction
nmap <leader>c :call ToggleCalendar()

""""""""""""""""""""""""""""""""""""""""""""""""
"Make plugins work by forcing load
autocmd VimEnter * PlugInstall
autocmd VimEnter * bd 
""""""""""""""""""""""""""""""""""""""""""""""""
"PLUG-CONFIG END--------------------------------
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""
"QOL-changes
""""""""""""""""""""""""""""""""""""""""""""""""
"show menu for autocompletion
set wildmenu
"search as characters are entered
set incsearch
"highlight search matches
set hlsearch
"de-highlight search
nnoremap <leader><space> :nohlsearch<CR>
"Relative Numbers
set number relativenumber

"highlight most recently inserted text
nnoremap gV `[v`]

"Change split nav to something sane
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Set colors
colorscheme wombat256mod

"Code folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
nnoremap <space> za
"move up and down by visual lines
nnoremap j gj
nnoremap k gk

"Display indent guide for tabs and show trailing
"spaces
set tabstop=5
set shiftwidth=5
set noexpandtab
set list lcs=trail:·,tab:»·
""""""""""""""""""""""""""""""""""""""""""""""""
"Default vimrc options
""""""""""""""""""""""""""""""""""""""""""""""""
" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
