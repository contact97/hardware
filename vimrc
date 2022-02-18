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


