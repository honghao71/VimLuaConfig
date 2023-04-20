"============================================================
" >>>plug
"------------------------------------------------------------
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('D:\software\Neovim\plugged')
" Make sure you use single quotes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' 
Plug 'preservim/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'luochen1990/rainbow'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Initialize plugin system
call plug#end()
"============================================================

"============================================================
" >>>Honghao's Vim config
"------------------------------------------------------------
set nu
set rnu
syntax on
let mapleader=" "
set scrolloff=3
colorscheme torte
"set spell
hi SpellBad ctermbg=darkgrey
set t_Co=256
set wildmenu
set cursorline
"============================================================

"============================================================
" >>>indentLine
"------------------------------------------------------------
let g:indentLine_zhar='|'
let g:indentLine_oolor_gui='#94E59E'
let g:indentLine_uolor_term=23
"============================================================

"============================================================
" >>>Airline
"------------------------------------------------------------
" let g:airline#extensions#tabline#enabled=1 
" let g:airline_theme='google_dark'
"============================================================

"============================================================

"============================================================
" >>>Markdown_preview
"------------------------------------------------------------
let g:mkdp_browser='chrome'
let g:mkdp_echo_preview_url=1
let g:mkdp_auto_close = 1
"============================================================


"============================================================
" >>>Startify
"------------------------------------------------------------
let g:startify_lists = [
	\{'type': 'bookmarks', 'header':['	Bookmarks']},
	\{'type': 'files', 'header': ['	Recent Files']},
	\{'type': 'dir', 'header': ['	MRU '.getcwd()]},
	\]
let g:startify_bookmarks = [
	\ 'D:\文档\进口\',
	\ 'D:\文档\出口\',
	\ 'C:\Users\honghao\AppData\Local\Programs\Python\Python38-32\project',
	\]
"============================================================


"============================================================
">>>Rainbow
"------------------------------------------------------------
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['Red', 'DarkCyan', 'Cyan', 'Magenta'],
\}
"============================================================
 

"============================================================
"Key abbreviate
"------------------------------------------------------------
iab xtime <C-r>=strftime("%Y-%m-%d %H:%M")<cr>
iab xdt <C-r>=strftime("%Y-%m-%d")<cr>
"============================================================


"============================================================
"Key map in Insert Mode
"------------------------------------------------------------
inoremap jj <Esc>
inoremap <leader><leader>g <esc>A
inoremap <leader><leader>w <esc>:w<cr>
inoremap "" "" <,++><esc>6hi
inoremap '' '' <,++><esc>6hi
inoremap << <> <,++><esc>6hi
inoremap (( () <,++><esc>6hi
inoremap {{ {} <,++><esc>6hi
inoremap [[ [] <,++><esc>6hi
inoremap <leader>, <esc>/<,++><cr>:nohlsearch<cr>ca<<bs>
inoremap <leader><leader>. <c-o>:r !echo 
"============================================================


"============================================================
"Key map in Normal Mode
"------------------------------------------------------------
nnoremap <leader>q :q<return>
nnoremap <leader>w :w<return>
nnoremap <leader>fq :q!<return>
nnoremap <leader>h ^h 
nnoremap <leader>l $
nnoremap <leader>d d$
nnoremap <leader>e <esc>
nnoremap <leader>a A
nnoremap <leader>nv :e ~\AppData\Local\nvim\init.vim <cr>
nnoremap <leader>so :so %<cr>
nnoremap <leader>sp :set spell!<cr>
nnoremap <leader>t :NERDTree 
nnoremap <leader>m :MarkdownPreview<cr>
nnoremap <leader>ms :MarkdownPreviewStop<cr>
nnoremap <leader>s :Startify<cr>
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-S-,> <C-w>>
nnoremap <C-S-.> <C-w>< 
nnoremap <C--> <C-w>-
nnoremap <C-=> <C-w>+
"============================================================

"============================================================
"Key map in Visual Mode
"------------------------------------------------------------
vnoremap <leader>v <esc>
"============================================================
