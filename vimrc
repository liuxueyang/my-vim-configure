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
se ls=2 ch=2 fdm=syntax cc=70 nofen
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

autocmd FileType javascript nnoremap <buffer>
      \ <localleader>c I//<esc>
autocmd FileType python nnoremap <buffer>
      \ <localleader>c I#<esc>
autocmd FileType vim nnoremap <buffer>
      \ <localleader>c I"<esc>
autocmd BufRead *.txt setl nu wrap

" some hotkeys configuration
let mapleader=","

vnoremap <leader>y "+y
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>
vnoremap jk <esc>

nnoremap <leader>ay ggVG"+y<c-o><c-o>
nnoremap <leader>q :q<cr>
nnoremap <leader>fq :q!<cr>
nnoremap <leader>xa :xa<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>e :e 
nnoremap <leader>s :sp<cr>
nnoremap <leader>v :vs<cr>
nnoremap <space> ve
nnoremap <leader>p "+p
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
iabbrev ssig -- <cr>Sabastian<cr>liuxueyang457@gmail.com

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
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

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

call plug#end()
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" Configuration for each plugin

" # 1 NERDTree
nnoremap <c-t> :NERDTree<cr>

" # 2 molokai
let g:molokai_original = 1
" color molokai

" # 3 vim-emoji
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
colo seoul256

" Light color scheme
" colo seoul256-light

" Switch
set background=dark
" set background=light

" # 7 c.vim
let g:C_CFlags='--std=c++1y -Wall -g'
if has('mac')
  let g:C_CplusCompiler='/usr/local/bin/g++-5'
endif
let g:C_ExeExtension = '.exe'
let g:C_ObjExtension = '.exe'

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

""""""""""""""""""""""""""""""""""""""""

