set nocompatible

"filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugin Settins

filetye off

set runtimepath^=~/.vim/bundle/ctrlp.vim                    " fuzzy file finder  - <C-p> filename
"set runtimepath^=~/.vim/bundle/VimCompletesMe               " Autocompletion     - <Tab>
set runtimepath^=~/.vim/bundle/syntastic                    " Lint Checker       - :SyntasticCheck
set runtimepath^=~/.vim/bundle/tabular                      " Tabularize data    - :Tab /<expression>
set runtimepath^=~/.vim/bundle/vim-colorschemes             " Fany colorschemes  - :colorscheme <Tab>
set runtimepath^=~/.vim/bundle/vim-commentary               " Easy Commenting    - gc{motion}
set runtimepath^=~/.vim/bundle/vim_easy-align               " Tabularize data    - ga{motion}{delimiter}, use <C-x> to use any regex
set runtimepath^=~/.vim/bundle/vim-easymotion               " Faster moving      - [y|d|c]<leader><leader>[{motion}{identifier}] | [s{target-key}{identifier}]
set runtimepath^=~/.vim/bundle/vim-multiple-cursors         " Multiple cursors   - <C-n> [<C-p>|<C-x>], can be used in visual mode also
set runtimepath^=~/.vim/bundle/vim-surround                 " Change surrounding text           - cs{previous_identifier}{new_identifier}
set runtimepath^=~/.vim/bundle/vim-verilog-instance         " Creating module instance          - gb{motion}, {visual selction}gb
set runtimepath^=~/.vim/bundle/vim-better-whitespace        " Highlight trailing whitespaces    - :StripWhitespace
set runtimepath^=~/.vim/bundle/vim-vinegar                  " Enhanced Netrw file explorer
set runtimepath^=~/.vim/bundle/VisIncr                      " Visual Increment of numbers       - <C-v>{select block}:I {increment by ?}
"set runtimepath^=~/.vim/bundle/vim-mark                     " Highlight multiple items together - <leader>m
"set runtimepath^=~/.vim/bundle/vim-airline                  " Fancy Status line
"set runtimepath^=~/.vim/bundle/rainbow                      " Different colors for nested parantheses
"set runtimepath^=~/.vim/bundle/vim-systemverilog
"set runtimepath^=~/.vim/bundle/vim-systemverilog.vim

runtime macros/matchit.vim
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin options

" Start interactive EasyAlignn in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlignn for a motion/text object) (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:rainbow_active = 1 " 0 if you want to enable it later via :RainbowToggle

let g:ctrlp_show_hidden = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Mapping to source .vimrc from inside vim anytime
command! ZVimrc :source ~/.vimrc | :noh

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Mapping the SPACE key as Leader key (Backslash is still the default leader)
map <space> <leader>
map <space><space> <leader><leader>

"Mapping to open ~/.vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

"Mapping to source ~/.vimrc
nnoremap <leader>sv :source $MYVIMRC<cr> :noh<scr>

" Leader commands for saving and quitting vim files
nnoremap <leader>q :q<cr>
nnoremap <leader>w :up<cr>
nnoremap <leader>x :x<cr>
nnoremap <leader>n :n<cr>

" Mapping Ctrl+L to remove highlighting and redraw screen (default functionality)
nnoremap <c-l> :nohl<cr><c-l>

nnoremap o o<esc>
nnoremap O O<esc>

map <leader>, :Tab /,/l0r1<cr>
map <leader>; :Tab /;/l0r1<cr>
map <leader>= :Tab / = /l0r1<cr>
map <leader>< :Tab /<=/l1r1<cr>
map <leader>( :Tab /(/l1r0<cr>
map <leader>) :Tab /)/l0r0<cr>

inoremap \fn <C-R>=expand("%:t:r")<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Settings for Vim

" Managing line numbers
set number relativenumber

" Always show status line
set laststatus=2

" Enable the use of mouse
set mouse+=a

"Remove the introduction message in Vim
set shortmess=I

"Enable syntax highlighting
syntax on


" Automatically indent when adding the curly bracket, etc.
set smartindent
set autoindent
set cindent

" Number spaces inserted when <Tab> is pressed
set tabstop=8
set softtabstop=4

" Number of spaces inserted in Auto indentation
set shiftwidth=4
" <Tab>s are converted to spaces
set expandtab

" Show line number and cursor position
set ruler

" Display normal mode commands as you type
set showcmd

" Show editing mode
set showmode

" Show file options above the command line
set widmenu
set wildignorecase

" highlight the current line and column
set cursorline
"set cursorcolumn

" Break lines so that words are not broken halfway, when using set wrap
"set wrap
"set linebreak

" Don't wrap lines by default
set nowrap

" Open vertical split on th right side of the current window
set splitright

" Display network directory as tree type by default
set g:netrw_liststyle=3

" Open help topics on the right side vertical split
autocmd FileType help wincmd L

" Stting backspace to work as it should
set backspace=indent,eol,start

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Managing Line numbers

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FOcusLost,InsertEnter   * set norelativenumber
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setting the colorscheme

if has("gui_running")
  colorscheme gruvbox
else
  colorscheme badwolf
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search Settings
" Search as you type (incremental search)
set incsearch

" Highlight your Searchs
set hlsearch

" Case settings for searching
set ignorecase
set smartcase

" Automatically cd into directory in which the file is present
set autochdir

" Instead of a fancy statusline plugin manager
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" To save and load folds automatically
" set foldmethod=manual
" set foldclose=all 
"autgroup file folding
"  autocmd!
"  autocmd BufWinLeave ?* mkview
"  autocmd BufWinEnter ?* silent loadview
"  autocmd BufWinEnter ?* :normal zM
"augroup END11

"Vimscript file settings.....................
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType cpp setlocal foldmethod=marker
  autocmd FileType verilog setlocal foldmethod=marker
augroup END

" To keep cursor at middle of the screen, remove if want to use <C-e>/<C-y> to scroll up and down
" set scrolloff=999

" Stop vim from rerendering the screen after every step of the macro, only rerender at the end
set lazyredraw

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"------------ Keyboard Mappings--------------------

nnoremap H ^
nnoremap L $

" To repeat last macro faster
nnoremap Q @@

" Will not work in terminal vim due to timeoutlen setting done
" inoremap jk <esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"searching the visually selected text using * or # from visual mode directly
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '/V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" User defined persisten macros
" let @a='4j6dd'

" Center the screen on the highlighted search result
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" 'gf' command open file under cursor in a new vertical split
nnoremap gf <C-w>vgf
nnoremap gf <C-w>vgF

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" RTL snippets : use :z<TAB>
command! ZAlways       :-1r~/.vim/mysnippets/always
"command! ZAlways       :-1r~/.vim/mysnippets/always
"command! ZAlways       :-1r~/.vim/mysnippets/always
"command! ZAlways       :-1r~/.vim/mysnippets/always
"command! ZAlways       :-1r~/.vim/mysnippets/always
"command! ZAlways       :-1r~/.vim/mysnippets/always

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatic Banner/Header generation
" Fix it to be more generic and autonomous
autocmd BufNewFile *.{c,cpp,v,py} silent :0r ~/.vim/mysnippets/header
autocmd BufNewFile *.{c,cpp,v,py} exe "1," . 8 . "g/File Name       :.*/s//File Name     : " .expand("%") 
autocmd BufNewFile *.{c,cpp,v,py} exe "1," . 8 . "g/Creation Date   :.*/s//Creation Date : " .strftime("%d-%m-%Y")
autocmd BufWritePre,FileWritePre ?* : StripWhitespace
autocmd BufWritePre,FileWritePre *.{c,cpp,v,py} execute "normal ma"
autocmd BufWritePre,FileWritePre *.{c,cpp,v,py} exe  "Silent 1," . 8 . "g/Last Modified   :.*/s//Last Modified : " .strftime("%c")
autocmd BufWritePre,FileWritePre *.{c,cpp,v,py} execute "normal `a"

" Directories for swp files
set nobackup
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! OutputSplitWindow(...)
  " this function output the result of the Ex command into a split scratch buffer
  let cmd = join(a:000, ' ')
  let temp_reg = @"
  redir @"
  execute cmd
  redir END
  let output = copy(@")
  let @" = temp_reg
  if empty(output)
    echoerr "no output"
  else
    vnew
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted
    put! =ouput
    silent! %s/^M//g
  endif
endfunction
command! -nargs=+ -complete=command Output call OutputSplitWindow(<f-args>)

set guioptions-=m " remove menubar
set guioptions-=T " remove toolbar
set guioptions-=r " remove right-hand scrollbar
set guioptions-=L " remove left-hand scroll bar
set guioptions-=c " remove left-hand scroll bar 
set guiheadroom=0

set virtualedit=all

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Multiply/Divide number under the cursor by count

function! Multivide(divide)
  let cnt = v:count1
  let old_reg = getreg("v")
  call search('\d\([^0-9\.]\|$\)', 'cW')
  normal v
  call search('\(^\([^0-9\.]\d\)', 'becW')
  normal "vygv
  if a:divide == 1
    execute 'normal "_c' . @v / cnt
  else
    execute 'normal "_c' . @v * cnt
  endif
  call setreg("v", old_reg)
endfunction

nnoremap <F5> :<C-u>call Multivide(0)<CR>
nnoremap <F6> :<C-u>call Multivide(1)<CR>

nnoremap <expr> gp '`[' . strpart(getregtype(), 0,1) . '`]'

if &diff
  map gs :call IwhiteToggle()<CR>
  function! IWhiteToggle()
    if &diffopt =~ 'iwhite'
      set diffopt-=iwhite
    else
      set diffopt+=iwhite
  endfunction
endif

set tags+=tags;/

augroup set_syntax
  autocmd!
  autocmd BufNewFile,BufRead *.vh  set syntax=verilog
  autocmd BufNewFile,BufRead *.vh  set filetype=verilog
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
