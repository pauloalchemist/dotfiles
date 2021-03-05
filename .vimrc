syntax on

filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'bronson/vim-trailing-whitespace'
Plugin 'erickzanardo/vim-xclip'
Plugin 'ervandew/supertab'
" Plugin 'scrooloose/nerdcommenter'
" Plugin 'scrooloose/nerdtree'
" NERDTree
Plugin 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plugin 'scrooloose/nerdcommenter'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight', {'on': 'NERDTreeToggle'}

Plugin 'terryma/vim-multiple-cursors'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'tpope/vim-unimpaired'
Plugin 'isRuslan/vim-es6'
Plugin 'bling/vim-airline'

"Rust
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'
"Themes
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'liuchengxu/space-vim-dark'
Plugin 'kaicataldo/material.vim', { 'branch': 'main' }

""Plug 'pangloss/vim-javascript'
Plugin 'othree/yajs.vim', {'for': 'javascript'}
Plugin 'othree/es.next.syntax.vim', {'for': 'javascript'}
Plugin 'pearofducks/ansible-vim'
"Plug 'HerringtonDarkholme/yats.vim'
"
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

"Syntax support for graphql
Plugin 'jparise/vim-graphql'
"
""Search
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

"Onedark theme
Plugin 'joshdick/onedark.vim'

Plugin 'ryanoasis/vim-devicons'

Plugin 'sheerun/vim-polyglot'

Plugin 'tpope/vim-fugitive'
Plugin 'dense-analysis/ale'
Plugin 'frazrepo/vim-rainbow'

Plugin 'mattn/emmet-vim'

call vundle#end()

let g:rainbow_active = 1

let g:airline_left_sep = ''
let g:airline_right_sep = ''
" vim javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
"
" " ctrlp ignore folders
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
" coc.vim config
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
autocmd CursorHold * silent call CocActionAsync('highlight')
" end coc.vim config

" Few configurations:
set hlsearch " Highlight search results
set encoding=UTF-8
set ffs=unix,dos,mac
set modeline
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set backspace=indent,eol,start
set laststatus=2
set cpoptions+=n
set number
set vb
set smartindent
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=235 gui=NONE guifg=NONE guibg=NONE
set clipboard=unnamed,unnamedplus
"
" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>
"
" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

 set incsearch       " Find the next match as we type the search
 set hlsearch        " Highlight searches by default
 set ignorecase      " Ignore case when searching...
 set smartcase       " ...unless we type a capital

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" CtrlP to ignore
set wildignore+=*.swp,*.pyc
let g:ctrlp_show_hidden = 1
"
" NerdTree show hidden files
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.swp$', '\.pyc$']

" Short cuts:
let mapleader=","
map ; :Files<CR>
map <C-]> :NERDTreeToggle<CR>
map <C-F> :NERDTreeFind<CR>         " Open NERDTree and focus on current file
map <F5> :e!<CR>                    " force reload current file
map <F6> :CtrlPClearAllCaches<CR>   " clear all CtrlP cache
map <leader>W :w<CR>
map <leader>w :wincmd k<CR>        " go window up
map <leader>s :wincmd j<CR>        " go window down
map <leader>a :wincmd h<CR>        " go window left
map <leader>d :wincmd l<CR>        " go window right
map <leader>v :vertical :new<CR>   " open new vertical window
map <leader>h :new<CR>             " open a new horizontal window
map <leader>q :q<CR>               " it quit current vim buffer
map <leader>Q :q!<CR>              " it force quit current vim buffer
map <leader>n :tabnew<CR>          " create a new tab
map <leader>z :tabprevious<CR>     " move to previous tab
map <leader>x :tabnext<CR>         " move to next tab
map <leader>y :call system('xclip -selection clipboard', @0)<CR>  " move last yank selection to xclip
map <leader>b :CtrlPBuffer<cr>
map <leader>t :CtrlPTag<cr>
"nmap <ESC> :call coc#util#float_hide() <CR>
nmap <silent> k :call CocAction('doHover')<CR>
"autocmd CursorHold * silent call CocActionAsync('doHover')
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

autocmd BufNewFile,BufRead *.yaml.hbs   set syntax=ansible

set t_Co=256
"
if exists('$TMUX')
  " Colors in tmux
  let &t_8f = "<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "<Esc>[48;2;%lu;%lu;%lum"
endif

set background=dark
let g:airline_theme='onedark'

"Onedark theme
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1
let g:onedark_hide_endofbuffer=1
let g:onedark_color_overrides = {
      \ "purple": { "gui": "#56B6C2", "cterm": "170", "cterm16": "5" }
      \}
syntax enable

" set background=dark
set termguicolors
" colorscheme space-vim-dark
hi LineNr ctermbg=NONE guibg=NONE
let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'
let g:space_vim_dark_background = 233
" color space-vim-dark
colorscheme onedark

"set background=dark
"set termguicolors

"colorscheme material

"let g:material_terminal_italics = 1
"let g:material_theme_style = 'darker'

"hi Normal     ctermbg=NONE guibg=NONE
"hi LineNr     ctermbg=NONE guibg=NONE
"hi SignColumn ctermbg=NONE guibg=NONE
"hi htmlArg gui=italic
"hi Comment gui=italic
"hi Type    gui=italic
"hi htmlArg cterm=italic
"hi Comment cterm=italic
"hi Type    cterm=italic
"hi Special  cterm=italic
"hi ErrorMsg  cterm=italic

set guifont=FiraCodeRegular\ Nerd\ Font\ 11
let g:airline_powerline_fonts = 1

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
 if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
 endif
 "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
 "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
 " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
 if (has("termguicolors"))
  set termguicolors
 endif
endif

" lint
let g:ale_linters = {
\   'javascript': ['standard'],
\}
let g:ale_fixers = {'javascript': ['standard']}

let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

"Rust config

let g:rustfmt_autosave = 1
let g:racer_cmd = "/home/paulodev/.asdf/installs/rust/1.49.0/bin/racer"
" let g:racer_cmd="/Users/danirod/.cargo/bin/racer"
" let g:racer_cmd = expand(g:racer_cmd)
" let $RUST_SRC_PATH="/usr/local/src/rustc/src"
let $RUST_SRC_PATH="/home/paulodev/.asdf/installs/rust/1.49.0"

"supertab
let g:SuperTabContextDefaultCompletionType = "<c-n>"

set wildignore+=**/node_modules,**/bower_components,**/tmp,**/vendor,**/git

let NERDTreeIgnore=['node_modules', 'bower_components', 'tmp', 'vendor', 'git', 'target']
let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|tmp\|vendor\|DS_Store\|git'

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-Z>'

" multi-cursor
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
    autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
    autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
    autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
    autocmd FileType rust nmap <buffer> <leader>gD <Plug>(rust-doc-tab)
augroup END
