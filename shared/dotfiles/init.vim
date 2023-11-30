let mapleader = ","
let g:mapleader = ","

set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" Deoplete
" NeoBundle 'Shougo/deoplete.nvim'
" NeoBundle 'Shougo/neco-vim'        "  search in source for deoplete
" NeoBundle 'Shougo/neoinclude.vim'  " search in included files for deoplete
" NeoBundle 'Shougo/neco-syntax'     " search in syntax for deoplete
if has('nvim')
  NeoBundle 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }  " autocompletion plugin (NeoVim)
else
  NeoBundle 'Shougo/deoplete.nvim'
  NeoBundle 'roxma/nvim-yarp'
  NeoBundle 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
# let g:python3_host_prog = substitute(system('which python3'), '\n', '', '')

" NeoBundle 'Valloric/YouCompleteMe'                        " fast fuzzy-search code completion engine
" NeoBundle 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }

" NeoBundle 'Yggdroot/indentLine'                      " prints vertical lines at each indentation level
"   let g:indentLine_char = '¦'

NeoBundle 'ntpeters/vim-better-whitespace'           " highlights trailing whitespaces
" NeoBundle 'Raimondi/delimitMate'                     " automatic closing of quotes
" NeoBundle 'rhysd/vim-grammarous'                     " Grammar checker based on LanguageTool
"   let g:grammarous#languagetool_cmd = 'languagetool'   " use system languagetool instead of downloading new
"
NeoBundle 'Bling/vim-airline'                        " bottom panel
  NeoBundle 'vim-airline/vim-airline-themes'         " airline thems
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_powerline_fonts = 1
  let g:airline_theme='dark'
  set laststatus=2
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
NeoBundle 'Asheq/close-buffers.vim'                  " helpful plugin to work with buffers
  nmap <leader>q :CloseBuffers<CR>
" NeoBundle 'direnv/direnv.vim'
NeoBundle 'blueyed/vim-diminactive'                  " dim inactive windows

NeoBundle 'tpope/vim-surround'                       " for manipulation with quotes :)
NeoBundle 'tomtom/tcomment_vim'                      " commenter
"  nnoremap // :TComment<CR>
"  vnoremap // :TComment<CR>
" NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'AndrewRadev/switch.vim'
  let g:switch_mapping = "-"
  " let g:switch_custom_definitions =
  "      \ [
  "      \   ['assert', 'refute']
  "      \ ]
" NeoBundle 'terryma/vim-multiple-cursors'             " ability to edit with multiple cursors
NeoBundle 'Chiel92/vim-autoformat'                   " install ruby-beautify gem
  noremap === :Autoformat<CR>
NeoBundle 'bkad/CamelCaseMotion'                     " uses CamelCase jumps
  map <silent> w <Plug>CamelCaseMotion_w
  map <silent> b <Plug>CamelCaseMotion_b
  map <silent> e <Plug>CamelCaseMotion_e
  map <silent> ge <Plug>CamelCaseMotion_ge
  sunmap w
  sunmap b
  sunmap e
  sunmap ge
NeoBundle 'kshenoy/vim-signature'                    " plugin to place, toggle and display marks.
"NeoBundle 'Lokaltog/vim-easymotion'                  " number | letter motions for vim
"  let g:EasyMotion_smartcase = 1
"  map  / <Plug>(easymotion-sn)
"  omap / <Plug>(easymotion-tn)
"  map  n <Plug>(easymotion-next)
"  map N <Plug>(easymotion-prev)
NeoBundle 'junegunn/vim-easy-align'                  " align tool
  vmap <Enter> <Plug>(EasyAlign)                     " align on Enter
  nmap ga <Plug>(EasyAlign) "<Paste>                 " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  xmap ga <Plug>(EasyAlign)                          " Start interactive EasyAlign in visual mode (e.g. vipga)
NeoBundle 'tpope/vim-endwise'                        " autocomplete end blocks
NeoBundle 'valloric/youcompleteme'
" NeoBundle 'AndrewRadev/splitjoin.vim'                " brake code expression into multiple lines

" TMUX
NeoBundle 'zaiste/tmux.vim'
NeoBundle 'jgdavey/tslime.vim'                                " Send commands to TMUX
  let g:tslime_always_current_session = 1                     " run in current session
  let g:tslime_always_current_window = 1                      " run in current window
  let g:rspec_command = 'call Send_to_Tmux("rspec {spec} --format progress\n")' " command to run
NeoBundle 'christoomey/vim-tmux-navigator'                    " allow you to move between Vim panes and tmux splits
" NeoBundle 'benmills/vimux'                           " runs commands from vim in the tmux
"  prompt for a command to run
"  map <Leader>vp :VimuxPromptCommand<CR>

" Finders
NeoBundle 'rking/ag.vim'                                  " search through the content
  if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    map <Leader>g :Ag<SPACE>
    let g:ag_prg='ag -S --nocolor --nogroup --column
      \ --ignore-dir "bin"
      \ --ignore-dir "coverage"
      \ --ignore-dir "data"
      \ --ignore-dir "design"
      \ --ignore-dir "doc"
      \ --ignore-dir "log"
      \ --ignore-dir "public"
      \ --ignore-dir "spec_old"
      \ --ignore-dir "studios"
      \ --ignore-dir "template"
      \ --ignore-dir "tmp"
      \ --ignore-dir "vendor"
      \ --ignore-dir "vendor"
      \ --ignore-dir "verificator"
      \ --ignore "db/dev.dump"
      \ --ignore "*.log"
      \ --ignore "*tags"
      \ --ignore "db/schema*"
      \ --ignore "yarn.lock"'

      if !exists(":Ag")
        command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
        nnoremap \ :Ag<SPACE>
      endif
  endif
NeoBundle 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " search file by name
NeoBundle 'junegunn/fzf.vim'                                           " search files by name
  let $FZF_DEFAULT_OPTS="--preview 'coderay {}'"                  " setup preview window for fuzzy finder
  nnoremap <C-p> :FZF<CR>
  nnoremap <Leader>b :Buffers<CR>
  nnoremap <Leader>t :BTags<CR>
  " Customize fzf colors to match your color scheme
  let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }

" GIT
NeoBundle 'airblade/vim-gitgutter'                   " GIT commands
NeoBundle 'tpope/vim-fugitive'                       " the best Git wrapper
" NeoBundle 'tpope/vim-rhubarb'                        " Enables :Gbrowse from fugitive.vim to open GitHub URLs.
NeoBundle 'Xuyuanp/nerdtree-git-plugin'

" File manager
NeoBundle 'scrooloose/nerdtree'                                        " file tree
  map <C-n> :NERDTreeToggle<CR>
  map <C-f> :NERDTreeFind<CR>
  let NERDTreeShowHidden=1
  let NERDTreeShowLineNumbers=1
  let NERDTreeCascadeSingleChildDir=0
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
  let g:NERDTreeGitStatusIndicatorMapCustom = {
      \ "Modified"  : "✹",
      \ "Staged"    : "✚",
      \ "Untracked" : "✭",
      \ "Renamed"   : "➜",
      \ "Unmerged"  : "═",
      \ "Deleted"   : "✖",
      \ "Dirty"     : "✗",
      \ "Clean"     : "✔",
      \ 'Ignored'   : '☒',
      \ "Unknown"   : "?"
      \ }
" Correction
" NeoBundle 'w0rp/ale'                                 " async linter NEEDS TO BE FIXED
"   let g:ale_linters = {
"   \  'ruby':       ['ruby', 'reek', 'rubocop', 'brakeman', 'rails_best_practices'],
"   \  'javascript': ['eslint'],
"   \}
"   let g:ale_fixers = {
"   \  'javascript': ['prettier', 'eslint']
"   \}
"   nmap <C-M> <Plug>(ale_fix)
"   let g:ale_completion_enabled = 1
"   let g:airline#extensions#ale#enabled = 1
"   let g:ale_echo_msg_error_str = '☠ '
"   let g:ale_echo_msg_warning_str = '♿ '
"   let g:ale_sign_error = '☠ '
"   let g:ale_sign_warning = '♿ '
"   let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"   let g:ale_sign_column_always = 1

" Search engine
NeoBundle 'dense-analysis/ale'
" NeoBundle 'yegappan/taglist' " Source Code Browser plugin for Vim

" Ruby/Rails
NeoBundle 'tpope/vim-rails'                          " for working with Ruby on Rails applications
" NeoBundle 'joker1007/vim-ruby-heredoc-syntax'        " highlights HEREDOC syntax
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'thoughtbot/vim-rspec'
  map <Leader>t :call RunCurrentSpecFile()<CR>
  map <Leader>s :call RunNearestSpec()<CR>
  map <Leader>l :call RunLastSpec()<CR>
  map <Leader>a :call RunAllSpecs()<CR>
  let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")' " command to run<Paste>
NeoBundle 'victorfeijo/binding-pry-vim'

" Markdown
NeoBundle 'godlygeek/tabular'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'iamcco/markdown-preview.vim'

" JS, HTML, CSS
NeoBundle 'scrooloose/syntastic'
NeoBundle 'slime-lang/vim-slime-syntax'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'chemzqm/vim-jsx-improve'
NeoBundle 'kchmck/vim-coffee-script'
" NeoBundle 'Valloric/MatchTagAlways'                  " highlight XML/HTML tags that enclose your cursor location PERFORMANCE LOSS
NeoBundle 'mxw/vim-jsx'
NeoBundle 'mattn/emmet-vim'                " write html easy
" NeoBundle 'Raimondi/delimitMate'
" NeoBundle 'gorodinskiy/vim-coloresque'               " shows colors by names(conflicts with alchemist)
" NeoBundle 'elzr/vim-json'
" NeoBundle 'Valloric/MatchTagAlways'                  " highlight XML/HTML tags that enclose your cursor location
"   let g:mta_filetypes = {
"       \ 'html'       : 1,
"       \ 'xhtml'      : 1,
"       \ 'xml'        : 1,
"       \ 'jinja'      : 1,
"       \ 'javascript' : 1,
"       \}

" Different
NeoBundle 'lilydjwg/colorizer'                       " colors for color code #ffffff
NeoBundle 'ekalinin/Dockerfile.vim'
NeoBundle 'dkprice/vim-easygrep'
" NeoBundle 'chrisbra/csv.vim'       " csv editor and viewer
" NeoBundle 'reasonml-editor/vim-reason-plus' " investigate

" Theme
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'trevordmiller/nova-vim'
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"------------------Settings--------------------

colorscheme monokai-phoenix

" au BufWritePre * :%s/\s\+$//e            " trailing whitespaces
set shell=/bin/bash                      " set shell
set clipboard=unnamed,unnamedplus        " use system clipboard
" set tags+=gems.tags                      " ctags
set nu                                   " enable left numbers
set rnu                                  " increasing and decreasing left numbers
set mouse=a                              " enable mouse support
" set nobackup                             " turn off backup files
" set nowritebackup                        " turn off backup files
" set fillchars=vert:\                     " disable vert div chars
set ttyfast                              " Improve vim's scrolling speed
" set fillchars=vert:\                     " disable vert div chars
set nocompatible                         " be iMproved, required
" set cursorline                           " highlight the cursor screen line # performance issues !!!
" set cursorcolumn                         " highlight the cursor screen column # performance issues !!!
set scrolloff=5                          " minimal number of screen lines to keep above and below the cursor "
" set spell spelllang=en_us                " spellchecker
set colorcolumn=120                      " right margin
set autoread                             " autoreload files (when change branch on git)
" set nohlsearch                           " turn off highlighting
set title                                " show filename in title
set list                                 " show spaces
set lazyredraw                           " increase rendering speed
" set listchars=tab:▷⋅,trail:⋅,nbsp:⋅      " customize spaces
set splitbelow                           " split new horizontal tab bellow
set splitright                           " split new vertical tab right
set encoding=utf-8                       " encoding
set noswapfile                           " disable swap file (check it)
set ruler                                " show the cursor position all the time
" set showcmd                              " display incomplete commands
" set list listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace
set undofile                             " Maintain undo history between sessions
set smarttab                             " only even number of spaces (3 spaces + tab = 4 spaces, 2 spaces + tab = 4 spaces)
" set fillchars+=vert:│                    " sets vertical separator as it is in tmux
" set fillchars=vert:\                     " disable vert div chars
set undodir=~/.vim/undodir               " file with changes history
set re=1                                 " Use new syntax highlight engine
set hidden                                 " hidden mode for buffers

" Auto indentation
set expandtab
set shiftwidth=2
set softtabstop=2
set backspace=2                          " make backspace work like most other apps
highlight Comment cterm=italic           " italic comments

" String to put at the start of lines that have been wrapped "
let &showbreak='↪ '

"**************************************************************************
" ### Key Settings
"**************************************************************************

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>"
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" jump to end of text you pasted
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" move between buffers by tab
nmap <Tab> :bnext<CR>
nmap <C-Tab> :bprev<CR>

" navigate between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" open current file in browser
map <Leader>o :!open %<CR>

" no highlight
nnoremap <esc> :noh<return><esc>

" Toggle fold at current position.
" (Using s-tab to avoid collision between <tab> and <C-i>).
nnoremap <s-tab> za

" copy selected word into search input
vnoremap /s y/<C-R>"<CR>
