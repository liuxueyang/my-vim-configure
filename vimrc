""""""""""""""""""""""""""""""""""""""""""
" Date:    2016/06/05 11:05              "
" Author:  by Sabastian                  "
" Github:  https://github.com/liuxueyang "
" Website: liuxueyang.github.io          "
""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" General configurations

se hls is nowrap mouse=a ts=2 nu rnu cul cuc
se nuw=5 cindent sw=2 sr
se et "vim-indent set" softtabstop=2 autoindent autochdir ruler 
se ls=2 ch=2 fdm=manual cc=70 nofen
" set guifont on Mac OS X, Linux and Windows
if has('mac')
  se gfn=Monaco:h19
else
  se gfn=Hermit\ 13
endif
"remove toolbar, menu"
se go-=T go-=m gcr=a:block-blinkon0

syntax on
syntax enable
filetype plugin indent on
match ErrorMsg /\%>70v.\+/

let localleader="\\"

augroup comment
  autocmd!
  autocmd FileType javascript nnoremap <buffer>
        \ <localleader>c I//<esc>
  autocmd FileType python nnoremap <buffer>
        \ <localleader>c I#<esc>
  autocmd FileType vim nnoremap <buffer>
        \ <localleader>c I"<esc>
augroup END

augroup others
  autocmd!
  autocmd BufRead *.txt setl nu wrap
  autocmd BufRead *.cnx setl nu wrap
  autocmd BufRead *.yaml setl ft=ansible
augroup END

augroup filetype_html
  autocmd!
  autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END

augroup filetype_cpp
  nnoremap <f9> <localleader>rr
augroup END

" some hotkeys configuration
let mapleader=","

vnoremap <localleader>y "+y
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>
vnoremap jk <esc>

onoremap p i(
onoremap b /return<cr>

nnoremap <localleader>ay ggVG"+y
nnoremap <leader>q :q<cr>
nnoremap <leader>fq :q!<cr>
nnoremap <leader>xa :xa<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>e :e 
nnoremap <leader>s :sp<cr>
nnoremap <leader>v :vs<cr>
nnoremap <space> ve
nnoremap <localleader>p "+p
nnoremap <leader>ev :vs $MYVIMRC<cr>
nnoremap <leader>pv :sp $MYVIMRC<cr>
nnoremap <leader>egv :vs $MYGVIMRC<cr>
nnoremap <leader>pgv :sp $MYGVIMRC<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>
nnoremap <leader>sgv :so $MYGVIMRC<cr>
nnoremap nw <C-w><C-w>
nnoremap <leader>l <C-w>l
nnoremap <leader>h <C-w>h
nnoremap <leader>on :only<CR>
nnoremap <leader>k <C-w>k
nnoremap <leader>j <C-w>j
nnoremap <Leader>c :set cursorline!<CR> guibg=#771c1c
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>< viw<esc>a><esc>'<i<<esc>lw
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
nnoremap <leader>r :so %<cr>
nnoremap <leader>_ ddp
nnoremap <leader>- kddpk
nnoremap <leader><c-u> viwUe
nnoremap <leader><c-a>l viw~e
nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>
nnoremap <c-a> :Tlist<cr>
"nnoremap <f5> :!ctags -R *<cr>

inoremap <leader><c-d> <esc>dd$a
inoremap <leader><c-u> <esc>viwUwa
inoremap jk <esc>
" disable old keys to learn the new map
inoremap <c-[> <nop>
inoremap <esc> <nop>
inoremap <c-u> <esc>veU
inoremap ( ()<esc>i
inoremap ) <c-r>=ClosePair(')')<cr>
inoremap { {}<esc>i
inoremap } <c-r>=ClosePair('}')<cr>
inoremap [ []<esc>i
inoremap ] <c-r>=ClosePair(']')<cr> 
inoremap <c-d> <esc>ddi

iabbrev @@ Blog: liuxueyang.github.io
iabbrev ccopy Copright 2016 Sabastian, all rights reserved.
iabbrev ssig -- <cr>Sabastian<cr>liuxueyang457@163.com

function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
endf

"set statusline=%F%m%r%h%w\ 😃\ [FORMAT=%{&ff}]\ 😄\
"      \ [TYPE=%Y]\ 😟\
"      \ [ASCII=\%03.3b]\ 😮\ [HEX=\%02.2B]\ 😱\
"      \ [POS=%04l,%04v]\ 😭\
"      \ [%p%%]\ 😂\ [LEN=%L]\ 😎
"""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" use vim-plug to manage Vim plugins

" Make sure you use single quotes
" run `:PlugInstall` to install plugins

call plug#begin('~/.vim/plugged')

" # 1 NERDTree
" Shorthand notation: fetches https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" # 2 molokai
" Any valid git URL is allowed
Plug 'https://github.com/tomasr/molokai'

" # 3 vim-emoji
Plug 'junegunn/vim-emoji'

" # 4 vim-gitgutter
Plug 'airblade/vim-gitgutter'

" # 5 seoul256 color theme
Plug 'junegunn/seoul256.vim'

" # 6 vim-github-dashboard
Plug 'junegunn/vim-github-dashboard'

" # 7 c.vim
Plug 'vim-scripts/c.vim'

" # 8 taglist.vim
Plug 'vim-scripts/taglist.vim'

" # 9 gitv
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" # 10 fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" # 11 vim-sensible
Plug 'tpope/vim-sensible'

" # 12 YouCompleteMe
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
"function! BuildYCM(info)
"  " info is a dictionary with 3 fields
"  " - name:   name of the plugin
"  " - status: 'installed', 'updated', or 'unchanged'
"  " - force:  set on PlugInstall! or PlugUpdate!
"  if a:info.status == 'installed' || a:info.force
"    !./install.py --clang-completer
"  endif
"endfunction

"Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

" # 13 vim-easy-align
Plug 'junegunn/vim-easy-align'

" # 14 vim-peekaboo
Plug 'junegunn/vim-peekaboo'

" # 15 vim-powerline
" manually installed and updated
Plug '~/.vim/plugged/vim-powerline'

" # 16 vim-instant-markdown
" manually installed and updated
Plug '~/.vim/plugged/vim-markdown-preview'

" # 17 vim-ansible-yaml
Plug 'chase/vim-ansible-yaml'

" # 18 vim-rails
Plug 'tpope/vim-rails'

" # 19 emmet-vim
Plug 'mattn/emmet-vim'

" # 20 supertab
Plug 'ervandew/supertab'

" # 21 vim-ruby
Plug 'vim-ruby/vim-ruby'

" # 22 rainbow
Plug 'luochen1990/rainbow'

" # 23 tabular
Plug 'godlygeek/tabular'

" # 24 vim-bookmarks
"Plug 'MattesGroeger/vim-bookmarks'

" # 25 vim-airline
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" # 26 lh-cpp
"Plug 'luchermitte/lh-cpp'

" # 27 neocomplete
" I replace youcompleteme with neocomplete, because ycm is too
" hard to install. such as compiling clang 3.9 :(
Plug 'Shougo/neocomplete'

call plug#end()
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" Configuration for each plugin

" # 1 NERDTree
nnoremap <c-t> :NERDTree<cr>

" # 2 molokai
let g:molokai_original = 1
" color evening

" # 3 vim-emoji
let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
let g:gitgutter_sign_modified_removed = emoji#for('collision')

set completefunc=emoji#complete
nnoremap <leader>mo :%s/:\([^:]\+\):/\=emoji#for
      \(submatch(1), submatch(0))/g<cr>

" # 4 vim-gitgutter
let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
let g:gitgutter_sign_modified_removed = emoji#for('collision')

" # 5 seoul256 color theme
" Unified color scheme (default: dark)
" colo seoul256

" Light color scheme
" colo seoul256-light

" Switch
set background=dark
"set background=light

" # 7 c.vim

augroup others
  autocmd!
  autocmd BufNewFile,BufRead *.c let g:C_CFlags='-Wall -g -O0 -c -DDEBUG'
  autocmd BufNewFile,BufRead *.cpp let g:C_CFlags='--std=c++1y -Wall -g -DDEBUG '
augroup END

if has('mac')
  let g:C_CplusCompiler='/usr/local/bin/g++-6'
else
  let g:C_CplusCompiler='g++'
endif

"let g:C_CCompiler='gcc'
"let g:C_Ctrl_j = 'off'

" # 8 taglist.vim
let Tlist_File_Fold_Auto_Close=1
let Tlist_Show_One_File = 1            "只显示当前文件的taglist，默认是显示多个
let Tlist_Exit_OnlyWindow = 1          "如果taglist是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist
let Tlist_GainFocus_On_ToggleOpen = 1  "打开taglist时，光标保留在taglist窗口

if has('mac')
else
  let Tlist_Ctags_Cmd = "/usr/bin/ctags-exuberant"
endif
"nnoremap <leader>tl : Tlist<CR>        "设置关闭和打开taglist窗口的快捷键

" # 12 YouCompleteMe
let g:ycm_global_ycm_extra_conf =
      \'~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/
      \.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" # 13 vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" # 14 vim-peekaboo
" Default peekaboo window
let g:peekaboo_window = 'vertical botright 30new'

" Delay opening of peekaboo window (in ms. default: 0)
let g:peekaboo_delay = 750

" Compact display; do not display the names of the register groups
let g:peekaboo_compact = 1

" # 15 vim-powerline
let g:Powerline_symbols = 'fancy'
" If `PlugInstall` failed, just run the following command in 
" `~/.vim/plugged/` directory:
" git submodule add https://github.com/Lokaltog/vim-powerline

" # 16 vim-instant-markdown
let g:instant_markdown_slow = 1

" # 22 rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}

" # 25 vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" # 27 neocomplete
let g:neocomplete#enable_at_startup = 1
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
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
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

""""""""""""""""""""""""""""""""""""""""

