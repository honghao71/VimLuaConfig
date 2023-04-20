
"============================================================
" >>>Honghao's Vim config
"------------------------------------------------------------
set nu
set rnu
let mapleader=" "
set scrolloff=3
" colorscheme torte
" set spell
hi SpellBad ctermbg=darkgrey
set t_Co=256
set wildmenu
set cursorline
set cursorcolumn
set ignorecase
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
" syntax enable
set encoding=UTF-8
set colorcolumn=80
set splitbelow
set linebreak
" set nowrap

"============================================================
" >>>plug
"------------------------------------------------------------
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('D:\software\Neovim\plugged')
" Make sure you use single quotes
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' 
Plug 'preservim/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
" Plug 'plasticboy/vim-markdown'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ap/vim-css-color'
Plug 'tpope/vim-commentary'
Plug 'voldikss/vim-floaterm'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'gcmt/wildfire.vim'
Plug 'morhetz/gruvbox'
Plug 'luochen1990/rainbow'
" Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/remote', 'do': ':UpdateRemotePlugins' }
" Plug 'kien/rainbow_parentheses.vim'
" Plug 'ryanoasis/vim-devicons'
" Plug 'tools-life/taskwiki'
" Initialize plugin system
call plug#end()
"============================================================
 

"============================================================
" >>>indentLine
"------------------------------------------------------------
let g:indentLine_char='|'
let g:indentLine_color_gui='#64765E'
let g:indentLine_color_term=23
"============================================================


"============================================================
" >>>Airline
"------------------------------------------------------------
" let g:airline#extensions#tabline#enabled=1 
let g:airline_theme='cobalt2'
"============================================================


"============================================================
" >>>NERDTree
"------------------------------------------------------------
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeWinSize=35
let g:NERDTreeBookmarksSort=0
let g:NERDTreeHijackNetrw=0
"============================================================

"============================================================
" >>>Markdown_preview
"------------------------------------------------------------
let g:mkdp_browser='chrome'
let g:mkdp_echo_preview_url=1
let g:mkdp_auto_close = 1
let g:vim_markdown_folding_disabled=1
let g:mkdp_theme = 'light'
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
	\ 'D:\文档\内贸\',
	\ 'C:\Users\honghao\AppData\Local\Programs\Python\Python38-32\project',
	\]
"============================================================


"============================================================
">>>Rainbow
"------------------------------------------------------------
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['seagreen3', 'firebrick','SlateBlue', 'Violet'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'guis': [''],
\	'cterms': [''],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'vimwiki': {
\			'parentheses_options': 'containedin=markdownCode contained', 
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'haskell': {
\			'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'], 
\		},
\		'vim': {
\			'parentheses_options': 'containedin=vimFuncBody', 
\		},
\		'perl': {
\			'syn_name_prefix': 'perlBlockFoldRainbow', 
\		},
\		'stylus': {
\			'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'], 
\		},
\		'css': 0, 
\	}
\}
"============================================================
 

"============================================================
" >>>Vimwiki
"------------------------------------------------------------
set nocompatible
filetype plugin on
syntax on
let g:vimwiki_conceal_pre=1
let g:vimwiki_hl_headers=1
let g:vimwiki_folding='expr'
" let g:vimwiki_ext2syntax={'.md': 'markdown'}

let Work={}
let Work.path='d:\wiki\Work\'
let Work.nested_syntaxes = {'python': 'python', 'c++': 'cpp','vim': 'vim'}
let Work.auto_tags=1

let Personal={}
let Personal.path='d:\wiki\Personal\'
let Personal.nested_syntaxes = {'python': 'python', 'c++': 'cpp','vim': 'vim'}
" let Personal.auto_tags=1

let g:vimwiki_list=[Work, Personal]
let g:vimwiki_camel_case = 0
let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,br,hr,font,span,div,img'
" let g:vimwiki_listsyms = '✗○◐●✓'
"============================================================


"============================================================
" >>>float terminal
"------------------------------------------------------------
" Set floating window border line color to cyan, and background to orange
hi FloatermBorder guibg=black guifg=#992277
"============================================================


"============================================================
" >>>coc
"------------------------------------------------------------
so ~/AppData/Local/nvim/vimrc/coc.vim
" neovim-qt ugly tabline and popupmenu 
" below code can works. But change to setup in ginit.vim as official advice
" call rpcnotify(1, 'Gui', 'Option', 'Popupmenu', 0)
" call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
"============================================================


"============================================================
" >>>gruvbox
"------------------------------------------------------------
let g:gruvbox_contrast_dark="hard"
" let g:gruvbox_contrast='hard'
" set background=light   " Setting light mode
" let g:gruvbox_transparent_bg=0.3
" set background=dark    " Setting dark mode
colorscheme gruvbox
hi cursorline guibg=darkslategray
hi SpellBad gui=undercurl guisp=Tomato
hi VimwikiHtmlTag guifg=Green
"============================================================


"============================================================
">>>autocmd
"------------------------------------------------------------
augroup HH-vimrc
	au!
	au BufRead,BufNewFile *.edi set ft=edi
	au BufEnter,BufRead,BufNewFile *.md let g:vim_markdown_folding_disabled=1
	au BufEnter,BufRead,BufNewFile 内贸需求记录.md let g:vim_markdown_folding_disabled=0
	au BufEnter,BufRead,BufNewFile NERD_tree_* set relativenumber
	au filetype nerdtree nnoremap <silent> <buffer> <leader>yp :call NERDTreeCopyPath()<cr>
	au filetype nerdtree nnoremap <silent> <buffer> <leader>ex :silent call NERDTreeCopyPath()<cr>:silent !explorer "<c-r>+"<cr>
augrou END
" autocmd BufEnter *.wiki syntax on
" autocmd BufEnter *.wiki AirlineTheme kalisi
"============================================================


"============================================================
"Key abbreviate
"------------------------------------------------------------
iab timex <C-r>=strftime("%Y-%m-%d %H:%M")<cr>
iab datex <C-r>=strftime("%Y-%m-%d")<cr>
"============================================================


"============================================================
"Key map
"------------------------------------------------------------
"Key map in Insert Mode
"------------------------------------------------------------
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap jj <Esc>
inoremap <leader><leader>f <esc>A
inoremap <leader><leader>w <esc>:w<cr>a
inoremap "" "" <,++><esc>6hi
inoremap '' '' <,++><esc>6hi
inoremap << <> <,++><esc>6hi
inoremap (( () <,++><esc>6hi
inoremap {{ {} <,++><esc>6hi
inoremap [[ [] <,++><esc>6hi
inoremap $$ $$ <,++><esc>6hi
inoremap <leader><leader>p <esc>"+pa
" to delete (星期X) which paste from mail time
inoremap <leader><leader>dw <esc>F(df A

inoremap <leader>, <esc>/<,++><cr>:nohlsearch<cr>ca<<bs>
"------------------------------------------------------------

"------------------------------------------------------------
"Key map in Normal Mode
"------------------------------------------------------------
nnoremap Y y$
nnoremap <leader>q :q<return>
nnoremap <leader>w :w<return>
nnoremap <leader>fq :q!<return>
nnoremap <leader>h ^
nnoremap <leader>l $
nnoremap <leader>r "*
nnoremap <leader>y "+yy
nnoremap <leader>p "+p
nnoremap <leader>nv :e ~\AppData\Local\nvim\init.vim <cr>
nnoremap <leader>ng :e ~\AppData\Local\nvim\ginit.vim <cr>
nnoremap <leader>so :so %<cr>
nnoremap <leader>sp :set spell!<cr>
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>sf :Startify<cr>
" hotkey for windows
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <A-,> <C-w>>
nnoremap <A-.> <C-w><
nnoremap <C--> <C-w>-
nnoremap <C-=> <C-w>+

nnoremap <leader>t :CocCommand translator.popup<cr>
nnoremap <leader>, /<,++><cr>:nohlsearch<cr>ca<<bs><esc>
" formant json file
nnoremap <leader>jf :%!python -m json.tool<cr>:set foldmethod=indent<cr>:set filetype=json<cr>
" for edi file add return behind ' and set file type
nnoremap <leader>edi :%s/'/'\r/g<cr>:nohl<cr>:set filetype=edi<cr>gg
" for work needs item to complete folder
nnoremap <leader>c ^f求la完成<Bslash><esc>za
" execute command in '' deleted it and put return message in []
nnoremap <leader>co da':let b:pu=trim(execute(<c-r><c-r>"))<bar>pu='[' .. b:pu .. ']' <bar>unlet b:pu<cr>kgJf]
"------------------------------------------------------------
"
"map for vmimwiki
"------------------------------------------------------------
" toggle vimwiki list
nmap <leader>wl <Plug>VimwikiToggleListItem

nnoremap <leader>mo :MarkdownPreview<cr>
nnoremap <leader>ms :MarkdownPreviewStop<cr>
nnoremap <leader>gwt :!del d:\wiki\work\.vimwiki_tags<cr>:VimwikiRebuildTags<cr>:VimwikiGenerateTagLinks<cr><cr>
" change the line to comment for markdown
nnoremap <leader>mc ^i<!-- <esc>$a --><esc>
" in markdown file change font color of below characters
nnoremap <leader>fr ^la<space><esc>Da<font color=red><esc>pa</font><esc>?=red><cr>:nohl<cr>e2lxi
nnoremap <leader>fg ^la<space><esc>Da<font color=green><esc>pa</font><esc>?=green><cr>:nohl<cr>e2lxi
nnoremap <leader>fy ^la<space><esc>Da<font color=yellow><esc>pa</font><esc>?=yellow><cr>:nohl<cr>e2lxi
" change selected characters to comment for markdown
vnoremap <leader>mc <esc>`<i<!-- <esc>`>5la --><esc>
" input markdown comment
inoremap <leader><leader>mc <!--  --><esc>3hi
" set for markdown block quote style
inoremap <leader><leader>sq <style><cr>blockquote {<cr>  border-left: 5px double #bde !important;<cr>background: linear-gradient(to bottom, #fff -10%, #39f 700%) !important;<cr><bs>}<cr></style><esc>
" add img in markdown
inoremap <leader><leader>i <img src='./IMG' align=center width=100%/><esc>F'i/
" in markdown file change font color of below characters
inoremap <leader><leader>fr <space><esc>Da<font color=red><esc>pa</font><esc>?=red><cr>:nohl<cr>e2lxi
inoremap <leader><leader>fg <space><esc>Da<font color=green><esc>pa</font><esc>?=green><cr>:nohl<cr>e2lxi
inoremap <leader><leader>fy <space><esc>Da<font color=yellow><esc>pa</font><esc>?=yellow><cr>:nohl<cr>e2lxi
"------------------------------------------------------------

"Key map in Visual Mode
"------------------------------------------------------------
vnoremap <leader>v <esc>
"------------------------------------------------------------

"Key map in Command Line Mode
"------------------------------------------------------------
cnoremap <c-h> <left>
cnoremap <c-l> <right>
cnoremap <c-j> <nop>
" to redirect command return message to clipboard
cnoremap <leader><leader>co redir @" \|  \| redir END<left><left><left><left><left><left><left><left><left><left><left><left>
"------------------------------------------------------------

"Key map in Terminal Mode
"------------------------------------------------------------
tnoremap jj <c-\><c-n>
tnoremap <leader>p <c-\><c-n>"*pA
tnoremap <c-b> <home>
tnoremap <c-e> <end>
tnoremap <c-u> <esc>
tnoremap <c-h> <c-left>
tnoremap <c-l> <c-right>
tnoremap <c-x> <delete>
"============================================================
