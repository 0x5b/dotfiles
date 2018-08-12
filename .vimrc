set nocompatible

"=====================================================
"" Vundle settings
"=====================================================
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'                  " let Vundle manage Vundle, required

"-------------------=== Code/Project navigation ===-------------
Plugin 'scrooloose/nerdtree'                " Project and file navigation
"Plugin 'majutsushi/tagbar'                 " Project and file navigation
"Plugin 'kien/ctrlp.vim'                    " Fast transitions on project files
Plugin 'ctrlpvim/ctrlp.vim'                 " Fast transitions on project files
Plugin 'scrooloose/nerdcommenter'           " Intensely orgasmic commenting

"-------------------=== Other ===-------------------------------
Plugin 'vim-airline/vim-airline'            " Lean & mean status/tabline for vim
Plugin 'vim-airline/vim-airline-themes'     " Lean & mean status/tabline for vim
"Plugin 'powerline/fonts'                   " Powerline fonts plugin
"Plugin 'fisadev/FixedTaskList.vim'         " Pending tasks list
Plugin 'rosenfeld/conque-term'              " Consoles as buffers
Plugin 'tpope/vim-surround'                 " Parentheses, brackets, quotes, XML tags, and more
Plugin 'Chiel92/vim-autoformat'
"Plugin 'tpope/vim-dotenv'
Plugin 'evgsolntsev/vim-dotenv'
Plugin 'tpope/vim-fugitive'                 " git blame

"-------------------=== Snippets support ===--------------------
"Plugin 'garbas/vim-snipmate'                " Snippets manager
"Plugin 'MarcWeber/vim-addon-mw-utils'       " dependencies #1
"Plugin 'tomtom/tlib_vim'                    " dependencies #2
"Plugin 'honza/vim-snippets'                 " snippets repo

"-------------------=== Languages support ===-------------------
"Plugin 'scrooloose/syntastic'               " Syntax checking plugin for Vim
"Plugin 'tpope/vim-commentary'               " Comment stuff out
"Plugin 'mitsuhiko/vim-sparkup'              " Sparkup(XML/jinja/htlm-django/etc.) support
"Plugin 'Rykka/riv.vim'                      " ReStructuredText plugin
Plugin 'vim-scripts/ruscmd'                  " Normal mode on russian

"-------------------=== Python  ===-----------------------------
Plugin 'python-mode/python-mode'             " Python mode (docs, refactor, lints...)
Plugin 'davidhalter/jedi-vim'               " Jedi-vim autocomplete plugin
" Plugin 'Valloric/YouCompleteMe'
Plugin 'mitsuhiko/vim-jinja'                 " Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'       " Combined Python 2/3 for Vim

call vundle#end()                           " required
filetype on
filetype plugin on
filetype plugin indent on

"=====================================================
"" General settings
"=====================================================
syntax enable                               " syntax highlight
set number                                  " show line numbers
set ruler
set ttyfast                                 " terminal acceleration
set tabstop=4                               " 4 whitespaces for tabs visual presentation
set shiftwidth=4                            " shift lines by 4 spaces
"set smarttab                                " set tabs for a shifttabs logic
set noexpandtab                               " expand tabs into spaces
set autoindent                              " indent when moving to the next line while writing code

set cursorline                              " shows line under the cursor's line
set showmatch                               " shows matching part of bracket pairs (), [], {}
set listchars=tab:<-
set list

set t_Co=256                                " set 256 colors
colorscheme wombat256                       " set color scheme
"colorscheme dracula                           " set color scheme

if g:colors_name == "wombat256"
    hi String gui=none
    hi Comment gui=none
    hi Todo guibg=NONE guifg=#FF00FB gui=bold
    hi Todo ctermbg=NONE ctermfg=201 cterm=bold
endif

set enc=utf-8                             " utf-8 by default

set nobackup
" no backup files
set nowritebackup                           " only in case you don't want a backup file while editing
set noswapfile                              " no swap files

if has('mouse')
    set mouse=a
endif

set backspace=indent,eol,start              " backspace removes all (indents, EOLs, start) What is start?

set scrolloff=10                            " let 10 lines before/after cursor during scroll

set clipboard=unnamed                       " use system clipboard

"=====================================================
"" Tabs / Buffers settings
"=====================================================
tab sball
set switchbuf=useopen
set laststatus=2
nmap <F9> :bprev<CR>
nmap <F10> :bnext<CR>
nmap <silent> <leader>q :SyntasticCheck # <CR> :bp <BAR> bd #<CR>

"" Search settings
"=====================================================
set incsearch                             " incremental search
set hlsearch                             " highlight search results
nnoremap <silent> _ :noh<CR>
nnoremap <silent> <C-x> :bdelete<CR>
nnoremap <silent> + :call RunPython()<CR>
nnoremap <silent> <C-l> :call ShowList()<CR>
inoremap <C-U> <C-G>u<C-U>
nnoremap <F3> :Autoformat<CR>
nnoremap <C-b> :Gblame<CR>
set autochdir

let g:Orien = 1
function! RunPython()
 if g:Orien == 0
  :vs
  :ConqueTerm bash
"  let g:Orien = 1
 else
  :sp
  :ConqueTerm bash
  let g:Orien = 0
 endif
endfunction

let g:Slist = 0
function! ShowList()
 if g:Slist == 0
  :set list
  let g:Slist = 1
 else
  :set nolist
  let g:Slist = 0
 endif
endfunction


"=====================================================
"" AirLine settings
"=====================================================
"let g:airline_theme='badwolf'
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1

"=====================================================
"" TagBar settings
"=====================================================
"let g:tagbar_autofocus=0
"let g:tagbar_width=35
"autocmd BufEnter *.py :call tagbar#autoopen(0)
"autocmd BufWinLeave *.py :TagbarClose
"nmap <F8> :TagbarToggle<CR>

"=====================================================
"" NERDTree settings
"=====================================================
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\~$']        " Ignore files in NERDTree
let NERDTreeWinSize=35
" autocmd VimEnter * NERDTree                          " NERDTree autoload
autocmd VimEnter * if !argc() | NERDTree | endif
nmap <F2> :NERDTreeToggle<CR>

"=====================================================
"" SnipMate settings
"=====================================================
let g:snippets_dir='~/.vim/vim-snippets/snippets'

"=====================================================
"" Riv.vim settings
"=====================================================
let g:riv_disable_folding=1

"=====================================================
"" Python settings
"=====================================================
" omnicomplete
set completeopt-=preview                    " remove omnicompletion dropdown

" highlight 'long' lines (>= 80 symbols) in python files
augroup vimrc_autocmds
    autocmd!
    autocmd FileType python,rst highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python,rst match Excess /\%81v.*/
    autocmd FileType python,rst set nowrap
augroup END

set guifont=Terminus\ 14
set guioptions-=T
set guioptions-=m
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions+=c
set linespace=0

" jedi-vim
let g:jedi#popup_select_first=0             " Disable choose first option on autocomplete
let g:jedi#popup_on_dot=1                   " Enable autocomplete on dot
let g:jedi#goto_assignments_command = "<C-g>"
let g:jedi#goto_command = "<C-d>"
let g:jedi#show_call_signatures = "1"

set noexpandtab

" pymode
let g:pymode_run = 1
let g:pymode_run_bind = '<C-r>'

let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pylint']
let g:pymode_lint_ignore = ['W191', 'E128', 'E501', 'E124', 'C901', 'E131', 'E201', 'E202', 'E722']
let g:pymode_lint_unmodified = 1
let g:pymode_lint_message = 1

let g:pymode_virtualenv=1

let g:pymode_rope = 0

" syntax highlight
let g:pymode_syntax=1
let g:pymode_syntax_all=1
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all

" documentation
let g:pymode_doc=1
let g:pymode_doc_key='K'

" code folding
let g:pymode_folding=0

let dotenv_autoload = 1
