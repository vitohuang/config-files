"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
"NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'joonty/vdebug.git'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'vim-scripts/closetag.vim'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'edsono/vim-matchit'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'nelsyeung/twig.vim'
NeoBundle 'posva/vim-vue'
NeoBundle 'christoomey/vim-tmux-navigator'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" ---------- General ----------
" Syntax always on
syntax on

" Line number
set number

" Vim set terminal title
set title

" Unicode
set encoding=utf-8

" Dictionary
set dictionary=/usr/share/dict/words

" Undo and backup
"set undofile
"set undodir=~/.vim/tmp/undo/
"set backup
"set backupdir=~/.vim/tmp/backup/

" Always have filenames
set laststatus=2

" ---------- Appearance ----------
set number

" Show command in status line
set showcmd

" Don't redraw, lazy!
set lazyredraw

" Flash screen not bell
set visualbell

" Show match
set showmatch

" Wrap long lines
set wrap

" Ruler at the bottom
set ruler

"set the cursorline
set cursorline
hi cursorline guibg=#333333 
hi CursorColumn guibg=#333333

"command window height
set cmdheight=2

" ---------- Behaviors ----------
" Global chosen
set gdefault

" Vim internal tab-completion
set wildmenu
set wildmode=list:longest

" Search
"nnoremap / /\v
"vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set magic
set hlsearch

" Mouse
set mouse=a

" ----------- File type ----------
filetype off
"filetype on
"filetype plugin on
"filetype indent on
filetype plugin indent on

" Auto indent
set autoindent



" ---------- Style ----------
" Hightlight merge conflict
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
" set listchars, so when set list will using ▸ and 3 space instead of tab
" character and end of line as ¬
set listchars=tab:▸\ ,eol:¬
"set fillchars=vert:│

" Mark lines that have been wrapped
set showbreak=↪

" ---------- Key binding ----------
"map leader
let mapleader=","

" Open .vimrc to edit
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

"quickfix command
"display the next grep finding
map <leader>n :cn<cr> 
"display the previous grep finding
map <leader>p :cp<cr>
"display overview of grep findings
map <leader>c :cw<cr>
" JSON pretty the current buffer
map <leader>j :%!jq '.'<cr>

" Search the selected text
vnoremap // y/<C-R>"<CR>

" ---------- Plugins ----------
" Syntastic error highlight
NeoBundle 'scrooloose/syntastic'

" Airline
NeoBundle 'bling/vim-airline'
"let g:airline#extensions#tabline#enabled = 1
" when only one tab is open, show all of the open buffers
" user powerline patched fonts = no
"let g:airline_powerline_fonts = 0
"let g:airline#extensions#tabline#left_alt_sep = '|'
" dict of configurably unicode symbols. mmmmmmmmmm
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
"let g:airline = 1

" Tag bar
NeoBundle 'majutsushi/tagbar'
"if tagbar is loaded enable tagbar etension for airline
if (exists(":TagbarToggle"))
	let g:airline#extensions#tabline#enabled = 1
endif
map <leader>t :TagbarToggle<cr>

" Nerdtree
NeoBundle 'scrooloose/nerdtree'
map <silent> <F6> :NERDTreeToggle<CR>

" Solarized
NeoBundle 'altercation/vim-colors-solarized'

NeoBundle 'techlivezheng/vim-plugin-minibufexpl'

" Unite
" reload the cache with :Unite file_rec -force-redraw
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  let b:SuperTabDisabled=1
  setlocal noswapfile undolevels=-1
  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction

let g:unite_source_history_yank_enable = 1
nnoremap <Leader>y :Unite -no-split -start-insert -auto-resize -buffer-name=Yank_History<CR>
nnoremap <Leader>b :Unite -no-split -auto-resize -buffer-name=Buffer_List buffer<CR>
map <leader>f :Unite -start-insert file_rec buffer<cr>
map <leader>g :Unite -no-quit -keep-focus grep<cr>
map <leader>r :UniteResume<cr>

" Required:
call neobundle#end()

" Required:

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------
"
" Colour scheme - solarized
set background=dark
colorscheme solarized

" Set tag file
set tags+=~/.ctags/tags

" Snippets
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" neo complete
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:vdebug_options= {
    \    "port" : 9000,
    \    "server" : '',
    \    "timeout" : 20,
    \    "on_close" : 'detach',
    \    "break_on_open" : 1,
    \    "ide_key" : '',
    \    "path_maps" : {"/project": "/Users/vito/project"},
    \    "debug_window_level" : 0,
    \    "debug_file_level" : 0,
    \    "debug_file" : "",
    \    "watch_window_style" : 'expanded',
    \    "marker_default" : '⬦',
    \    "marker_closed_tree" : '▸',
    \    "marker_open_tree" : '▾'
    \}

"autocomdn can also tell vim to treat certain extension a specific file type
"autocmd BufNewFile, BufRead *.rss,*.atom setfiletype xml
"autocmd BufNewFile, BufRead *.config set filetype=config
"autocmd BufNewFile, BufRead *.scss set filetype=css
"autocmd BufNewFile, BufRead *.swig set filetype=scss
"au BufNewFile, BufRead *.vue set filetype=vue

" autocomdn FileType set file type specific settings, setlocal means only
" apply to the current session of vim 
" turn omni completion features on
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType php setlocal keywordprg=phpdoc
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType c setlocal omnifunc=ccomplete#Complete
autocmd FileType scss setlocal shiftwidth=2 tabstop=2 softtabstop=2
