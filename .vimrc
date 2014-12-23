" ------------ ajh's .vimrc ------------
" Plugins {{{1
execute pathogen#infect()
runtime macros/matchit.vim

" Syntax, FileType, Colorscheme {{{1
syntax on
filetype plugin indent on
colorscheme spacegray

" General Settings {{{1
set backspace=indent,eol,start
set clipboard^=unnamed
set completeopt-=preview
set dictionary+=/usr/share/dict/words
set fileformats+=mac
set formatoptions+=1j
set hidden
set laststatus=2
set lazyredraw
set list listchars=eol:\ ,tab:▸\ ,trail:·
set mouse=n ttymouse=sgr
set nostartofline
set number relativenumber
set path=.,**
set report=0
set showcmd showbreak=↪
set splitbelow splitright
set switchbuf=useopen,usetab
set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8
set ttimeoutlen=50
set wildmenu wildcharm=<C-z>

" Search Settings {{{1
set hlsearch incsearch
set ignorecase smartcase
set showmatch matchtime=2
set grepprg=ag\ --vimgrep grepformat^=%f:%l:%c:%m

" Indent and Fold Settings {{{1
set softtabstop=4 shiftwidth=4 shiftround
set smarttab expandtab
set autoindent breakindent breakindentopt=sbr
set nofoldenable

" Status Line {{{1
set statusline=%<%f\ %m%r%w%y\ %{fugitive#head()}%=[%{&fenc},\ %{&ff}]\ L:%l/\%L\ C:%c

" Wildignore Settings {{{1
set wildignore+=.hg,.git,.svn,*.pyc,*.spl,*.o,*.out,*.DS_Store,*.class,*.manifest,*~,#*#,%*
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,*.xc*,*.pbxproj,*.xcodeproj/**,*.xcassets/**

" History, Backup, Undo {{{1
set history=10000
set noswapfile
set backup backupdir=~/.vim/backup/
set undofile undodir=~/.vim/backup/undo/

" GUI Settings {{{1
if has("gui_running")
    set guioptions= lines=40 columns=140 guifont=Fira\ Mono:h13
endif

" Filetype Settings {{{1
let [html_indent_script1, html_indent_style1] = ["inc", "inc"]
let [python_highlight_all, java_highlight_all] = [1, 1]

" General Mappings {{{1
let mapleader = ' '

" Switch between splits
nnoremap <silent> <C-h> <C-w><C-h>
nnoremap <silent> <C-j> <C-w><C-j>
nnoremap <silent> <C-k> <C-w><C-k>
nnoremap <silent> <C-l> <C-w><C-l>

" Move by display lines
nnoremap <expr> j  v:count == 0 ? 'gj' : 'j'
nnoremap <expr> k  v:count == 0 ? 'gk' : 'k'
nnoremap <expr> gj v:count == 0 ? 'j' : 'gj'
nnoremap <expr> gk v:count == 0 ? 'k' : 'gk'

" Expand buffer list similar to ## for the argslist
cnoremap %% <C-R>=functions#general#bufferList()<CR>

" Remap some default keys to be more useful
nnoremap Q gq
nnoremap Y y$
xnoremap < <gv
xnoremap > >gv
nnoremap S i<CR><ESC>^m`gk:silent! s/\v +$//<CR>:noh<CR>``
nnoremap + za
xnoremap * :<C-u>call functions#general#vSSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call functions#general#vSSearch('?')<CR>/<C-R>=@/<CR><CR>
nnoremap zS :<C-u>echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')<CR>

" Visually Select a line without indentation
nnoremap <leader>v ^vg_

" Autoclose
inoremap {<CR> {<CR>}<ESC>O
inoremap (<CR> (<CR>)<ESC>O

" re-indent file while retaining cursor position.
nnoremap <leader>ef m`gg=G``

" Remove trailing whitespace
nnoremap <leader>W m`:%s/\s\+$//<CR>:let @/=''<CR>``

" Open a buffer horizontally or vertically.
nnoremap <expr> <leader>b functions#general#bufNav("horizontal")
nnoremap <expr> <leader>B functions#general#bufNav("vertical")

" Search mappings
nnoremap g/ /\<\><left><left>
nnoremap [I [I:
nnoremap <leader>i :ilist /

" Plugin Settings and Mappings {{{1
" Netrw {{{2
let [netrw_winsize, netrw_banner, netrw_liststyle] = [20, 0, 3]

" Emmet {{{2
let [user_emmet_expandabbr_key, use_emmet_complete_tag, user_emmet_mode] = ["<c-b>", 1, 'i']

" Fist of Vim {{{2
let [fist_in_private, fist_anonymously] = [0, 0]

" CtrlP {{{2
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>F :CtrlPCurWD<CR>
let [ctrlp_use_caching, ctrlp_user_command] = [0, 'ag %s -l --nocolor --hidden -g ""']

" Dispatch {{{2
nnoremap d<space> :Dispatch<space>
nnoremap d<CR> :Dispatch<CR>
nnoremap m<CR> :Make<CR>

" Fugitive {{{2
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gs :Gstatus<CR>

" Clang_Complete {{{2
let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'

" Tabular {{{2
let g:no_default_tabular_maps=1
xnoremap <leader>t :Tabularize<space>/
nnoremap <leader>t :Tabularize<space>/

" Jedi {{{2
let [jedi#auto_vim_configuration, jedi#popup_on_dot] = [0, 0]

" Commands {{{1
autocmd VimEnter * call functions#cursorshape#CursorShapeMode()
autocmd BufReadPost * if line ("'\"") > 1 && line("'\"") <= line("$") | exe "norm! g`\"" | endif
command! BD silent e# | bd#
