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


