" ================ Plugins ==================== {{{
call plug#begin( '~/.config/nvim/bundle')

Plug 'christoomey/vim-tmux-navigator'
Plug 'w0rp/ale', { 'do': 'npm install -g prettier' }
Plug 'nelstrom/vim-visual-star-search'
Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'javascript.jsx'] }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'duff/vim-bufonly'
Plug 'gregsexton/MatchTag', { 'for': ['html', 'javascript.jsx'] }
Plug 'sheerun/vim-polyglot'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neosnippet'
Plug 'dyng/ctrlsf.vim'
Plug 'vimwiki/vimwiki'
Plug 'jreybert/vimagit'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'fatih/vim-go'
Plug 'sebdah/vim-delve'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
"}}}
" ================ General Config ==================== {{{

filetype plugin indent on                                                       "Enable plugins and indents by filetype

let g:mapleader = "\<Space>"                                                     "Change leader to a comma

let g:enable_bold_font = 1                                                      "Enable bold font in colorscheme
let g:enable_italic_font = 1                                                    "Enable italic font in colorscheme

set termguicolors
set title                                                                       "change the terminal's title
set number                                                                      "Line numbers are good
set relativenumber                                                              "Show numbers relative to current line
set history=500                                                                 "Store lots of :cmdline history
set showcmd                                                                     "Show incomplete cmds down the bottom
set noshowmode                                                                  "Hide showmode because of the powerline plugin
set gdefault                                                                    "Set global flag for search and replace
set gcr=a:blinkon500-blinkwait500-blinkoff500                                   "Set cursor blinking rate
set cursorline                                                                  "Highlight current line
set smartcase                                                                   "Smart case search if there is uppercase
set ignorecase                                                                  "case insensitive search
set mouse=                                                                      "Disable mouse usage
set showmatch                                                                   "Highlight matching bracket
set nostartofline                                                               "Jump to first non-blank character
set timeoutlen=1000 ttimeoutlen=0                                               "Reduce Command timeout for faster escape and O
set fileencoding=utf-8                                                          "Set utf-8 encoding on write
set wrap                                                                        "Enable word wrap
set linebreak                                                                   "Wrap lines at convenient points
set listchars=tab:\ \ ,trail:·                                                  "Set trails for tabs and spaces
set list                                                                        "Enable listchars
set lazyredraw                                                                  "Do not redraw on registers and macros
set background=dark                                                             "Set background to dark
set hidden                                                                      "Hide buffers in background
set conceallevel=2 concealcursor=i                                              "neosnippets conceal marker
set splitright                                                                  "Set up new vertical splits positions
set splitbelow                                                                  "Set up new horizontal splits positions
set path+=**                                                                    "Allow recursive search
set inccommand=split                                                            "Show substitute changes immidiately in separate split
set fillchars+=vert:\│                                                          "Make vertical split separator full line
set pumheight=30                                                                "Maximum number of entries in autocomplete popup
set exrc                                                                        "Allow using local vimrc
set secure                                                                      "Forbid autocmd in local vimrc

syntax on                                                                       "turn on syntax highlighting

silent! colorscheme hybrid_reverse

" }}}
" ================ Turn Off Swap Files ============== {{{

set noswapfile
set nobackup
set nowb

" }}}
" ================ Persistent Undo ================== {{{

" Keep undo history across sessions, by storing in file.
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile

" }}}
" ================ Indentation ====================== {{{

set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set smartindent
set nofoldenable
set colorcolumn=200

" }}}
" ================ Auto commands ====================== {{{

augroup vimrc
    autocmd!
augroup END

autocmd vimrc BufWritePre * :call StripTrailingWhitespaces()                    "Auto-remove trailing spaces
autocmd vimrc InsertEnter * :set nocul                                          "Remove cursorline highlight
autocmd vimrc InsertLeave * :set cul | NeoSnippetClearMarkers                   "Add cursorline highlight in normal mode and remove snippet markers
autocmd vimrc FileType php setlocal sw=4 sts=4 ts=4                             "Set indentation to 4 for php
autocmd vimrc FileType go setlocal sw=4 sts=4 ts=4                              "Set indentation to 4 for go

" }}}
" ================ Completion ======================= {{{

set wildmode=list:full
set wildignore=*.o,*.obj,*~                                                     "stuff to ignore when tab completing
set wildignore+=*.git*
set wildignore+=*.meteor*
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" }}}
" ================ Scrolling ======================== {{{

set scrolloff=8                                                                 "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=5

" }}}
" ================ Statusline ======================== {{{

"hi User1 guifg=#FF0000 guibg=#455A64
"set statusline=\ %{toupper(mode())}                                             "Mode
"set statusline+=\ \│\ %{fugitive#head()}                                        "Git branch
"set statusline+=\ \│\ %4F                                                       "File path
"set statusline+=\ %1*%m%*                                                       "Modified indicator
"set statusline+=\ %w                                                            "Preview indicator
"set statusline+=\ %r                                                            "Read only indicator
"set statusline+=\ %q                                                            "Quickfix list indicator
"set statusline+=\ %=                                                            "Start right side layout
"set statusline+=\ %{&enc}                                                       "Encoding
"set statusline+=\ \│\ %y                                                        "Filetype
"set statusline+=\ \│\ %p%%                                                      "Percentage
"set statusline+=\ \│\ %l/%L                                                     "Current line number/Total line numbers
"set statusline+=\ \│\ %c                                                        "Column number
"set statusline+=\ \│%1*%{ALEGetStatusLine()}%*                                  "Errors count

"}}}
" ================ Abbreviations ==================== {{{

cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev Bd bd
cnoreabbrev bD bd
cnoreabbrev wrap set wrap
cnoreabbrev nowrap set nowrap
cnoreabbrev bda BufOnly
cnoreabbrev t tabe
cnoreabbrev T tabe
cnoreabbrev f find
cnoreabbrev F find

" }}}
" ================ Functions ======================== {{{

function! StripTrailingWhitespaces()
  if &modifiable
    let l:l = line(".")
    let l:c = col(".")
    %s/\s\+$//e
    call cursor(l:l, l:c)
  endif
endfunction

function! Search()
    let term = input('Search for: ', '')
    if term != ''
        let path = input('Path: ', '', 'file')
        :execute 'CtrlSF "'.term.'" '.path
    endif
endfunction

" }}}
" ================ Custom mappings ======================== {{{

" swich buffers
nnoremap <Leader>x :bnext<CR>
nnoremap <Leader>z :bprev<CR>

" delete current buffer
nnoremap <Leader>q :bprevious<CR>:bdelete #<CR>

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Expand snippets on tab if snippets exists, otherwise do autocompletion
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\ : pumvisible() ? "\<C-n>" : "\<TAB>"
" If popup window is visible do autocompletion from back
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Fix for jumping over placeholders for neosnippet
smap <expr><TAB> neosnippet#jumpable() ?
\ "\<Plug>(neosnippet_jump)"
\: "\<TAB>"

" Copy to system clipboard
vnoremap <C-c> "+y
" Paste from system clipboard with Ctrl + v
inoremap <C-v> <Esc>"+p
nnoremap <Leader>p "0p
vnoremap <Leader>p "0p
nnoremap <Leader>h viw"0p

" Move to the end of yanked text after yank and paste
nnoremap p p`]
vnoremap y y`]
vnoremap p p`]

" Move selected lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Clear search highlight
nnoremap <Leader><space> :noh<CR>

" Handle syntastic error window
" nnoremap <Leader>e :lopen<CR>
" nnoremap <Leader>q :lclose<CR>

" Find current file in NERDTree
nnoremap <Leader>nff :NERDTreeFind<CR>
" Open NERDTree
nnoremap <F3> :NERDTreeToggle<CR>

" Toggle between last 2 buffers
nnoremap <leader><tab> <c-^>

" Filesearch plugin map for searching in whole folder
nnoremap <Leader>f :call Search()<CR>

" Toggle buffer list
nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>t :BTags<CR>
nnoremap <Leader>m :History<CR>

" Resize window with shift + and shift -
nnoremap + <c-w>5>
nnoremap _ <c-w>5<

" Center highlighted search
nnoremap n nzz
nnoremap N Nzz

"Disable ex mode mapping
map Q <Nop>

" Generate tags
nnoremap <Leader>gt :sp term://ctags -R --exclude=node_modules .<CR>G

" Jump to definition in vertical split
nnoremap <Leader>] <C-W>v<C-]>

" Reformat and fix linting errors
nnoremap <Leader>r :ALEFix<CR>

" }}}
" ================ Plugins Mapping ======================== {{{

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
" noremap <Leader>gsh :Gpush<CR>
" noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" }}}
" ================ Plugins setups ======================== {{{

let g:ctrlsf_auto_close = 0                                                     "Do not close search when file is opened
let g:ctrlsf_mapping = {'vsplit': 's'}                                          "Mapping for opening search result in vertical split

let g:gitgutter_realtime = 0                                                    "Disable gitgutter in realtime
let g:gitgutter_eager = 0                                                       "Disable gitgutter to eager load on tab or buffer switch

let g:user_emmet_leader_key = '<c-e>'                                           "Change trigger emmet key

let g:NERDTreeChDirMode = 2                                                     "Always change the root directory
let g:NERDTreeMinimalUI = 1                                                     "Disable help text and bookmark title
let g:NERDTreeShowHidden = 1                                                    "Show hidden files in NERDTree

let g:neosnippet#disable_runtime_snippets = {'_' : 1}                           "Snippets setup
let g:neosnippet#snippets_directory = ['~/.config/nvim/snippets']               "Snippets directory

let g:deoplete#enable_at_startup = 1                                            "Enable deoplete autocompletion
let g:deoplete#file#enable_buffer_path = 1                                      "Autocomplete files relative to current buffer
let g:deoplete#tag#cache_limit_size = 10000000                                  "Allow tags file up to ~10 MB

let g:delimitMate_expand_cr = 1                                                 "auto indent on enter

let g:ale_linters = {'javascript': ['eslint']}                                  "Lint js with eslint
let g:ale_fixers = {'javascript': ['prettier', 'eslint']}                       "Fix eslint errors
let g:ale_javascript_prettier_options = '--print-width 100'                     "Set max width to 100 chars for prettier
let g:ale_lint_on_save = 1                                                      "Lint when saving a file
let g:ale_sign_error = '✖'                                                      "Lint error sign
let g:ale_sign_warning = '⚠'                                                    "Lint warning sign
let g:ale_statusline_format =[' %d E ', ' %d W ', '']                           "Status line texts

let g:jsx_ext_required = 1                                                      "Force jsx extension for jsx filetype
let g:javascript_plugin_jsdoc = 1                                               "Enable syntax highlighting for js doc blocks

let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki'}]                            "Use dropbox folder for easier syncing of wiki

let g:magit_default_show_all_files = 0                                          "Fold all changes when Magit is opened

let g:tmux_navigator_disable_when_zoomed = 1                                    "Disable tmux navigation on fullscreen


" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

" vim-airline-themes
let g:airline_theme='wombat'

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif
" }}}
" vim:foldenable:foldmethod=marker

