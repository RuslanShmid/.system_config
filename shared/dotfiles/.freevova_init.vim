" {{{                     VIM SETTINGS
"**************************************************************************

" {{{                     General functions
"**************************************************************************

" #############################
" ### FOLDING
" #############################
" Toggle fold at current position.
" (Using s-tab to avoid collision between <tab> and <C-i>).
nnoremap <s-tab> za

if has('folding')
  if has('windows')
    let &fillchars='vert: '           " less cluttered vertical window separators
  endif
  set foldmethod=indent               " not as cool as syntax, but faster
  set foldlevelstart=99               " start unfolded
endif

" Cycle through relativenumber + number, number (only), and no numbering.
function! Cycle_numbering() abort
  if exists('+relativenumber')
    execute {
          \ '00': 'set relativenumber   | set number',
          \ '01': 'set norelativenumber | set number',
          \ '10': 'set norelativenumber | set nonumber',
          \ '11': 'set norelativenumber | set number' }[&number . &relativenumber]
  else
    " No relative numbering, just toggle numbers on and off.
    set number!<CR>
  endif
endfunction

" autosave view
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

if has("termguicolors")
  set termguicolors
endif

set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum

" Auto resizing of focuesed window
" let &winwidth = &columns * 6 / 10

au BufWritePre * :%s/\s\+$//e       " trailing whitespaces

"}}}***********************************************************************
"{{{                     General configs
"**************************************************************************

set shell=/bin/zsh
" set runtimepath+=~/.config/nvim/bundle/Plug.vim/ " for NeoVim
set re=1                            " syntax highlighting enhancements
set rnu                             " relative line numbers
set mouse=a                         " enable mouse support
set noswapfile                      " turn off swap files
set nobackup                        " turn off backup files
set nowritebackup                   " turn off backup files
" set clipboard=unnamed,unnamedplus   " use system clipboard
set clipboard+=unnamedplus   " use system clipboard
set tags+=gems.tags                 " ctags
set nu                              " enable left numbers
set fillchars=vert:\                " disable vert div chars
set nocompatible                    " be iMproved, required
" set cursorline                      " highlight the cursor screen line #performance issues
" set cursorcolumn                    " highlight the cursor screen line
set scrolloff=5                     " minimal number of screen lines to keep above and below the cursor
set spell spelllang=en_us           " spellchecker
set colorcolumn=120                 " right margin

set ttyfast                         " Improve vim's scrolling speed
set lazyredraw                      " increase rendering speed
set splitbelow                      " split new horizontal tab bellow
set splitright                      " split new vertical tab right
set autoread                        " autoreload files (when change branch on git)
set encoding=utf-8                  " encoding
set nohlsearch                      " turn off highlighting
set title                           " show filename in title
set list                            " show spaces
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅ " customize spaces
set tabstop=2                       " auto indentation
set shiftwidth=2                    " auto indentation
set softtabstop=2                   " auto indentation
set expandtab                       " replace tabs to spaces
set smarttab                        " only even number of spaces (3 spaces + tab = 4 spaces, 2 spaces + tab = 4 spaces)
set backspace=2                     " make backspace work like most other apps
set fillchars+=vert:│               " sets vertical separator as it is in tmux

highlight Comment cterm=italic      " italic comments
let &showbreak='↪ '                 " break symbol


" To speed vim
set nocursorline
set lazyredraw
set synmaxcol=200


"}}}***********************************************************************
"{{{                     Plugins
"**************************************************************************

call plug#begin('~/.vim/plugged')
  Plug 'gmarik/Vundle.vim'                             " setup Vundle

" Navigation
  Plug 'scrooloose/nerdtree'                           " Nerdtree panel
    map <C-n> :NERDTreeToggle<CR>
    map <C-f> :NERDTreeFind<CR>
    let NERDTreeShowLineNumbers=1                      " enable line numbers
    autocmd FileType nerdtree setlocal relativenumber  " make sure relative line numbers are used
    let NERDTreeCascadeSingleChildDir=0                " for folder embeding
    let NERDTreeShowHidden=1                           " show hidden files
  Plug 'Xuyuanp/nerdtree-git-plugin'
    let g:NERDTreeIndicatorMapCustom = {
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
  Plug 'Lokaltog/vim-easymotion'                       " number | letter motions for vim
    let g:EasyMotion_smartcase = 1
    map  / <Plug>(easymotion-sn)
    omap / <Plug>(easymotion-tn)
    map  n <Plug>(easymotion-next)
    map  N <Plug>(easymotion-prev)
  Plug 'bkad/CamelCaseMotion'                          " uses CamelCase jumps
  Plug 'rking/ag.vim'                                  " search through the content
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
        \ --ignore "*.log"
        \ --ignore "*tags"
        \ --ignore "db/schema*"
        \ --ignore "yarn.lock"'

        if !exists(":Ag")
          command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
          nnoremap \ :Ag<SPACE>
        endif
    endif
  Plug 'majutsushi/tagbar'                             " you can set tags for lines
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " search file by name
  Plug 'junegunn/fzf.vim'                                           " search files by name
    let $FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
    let $FZF_DEFAULT_OPTS='--preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -500"'

    nnoremap <s-f> :FZF<CR>
    " nnoremap f :FZF<CR>

" Correction
  Plug 'w0rp/ale'                                      " async linter
    let g:ale_linters = {
    \  'ruby':       ['ruby', 'reek', 'rubocop', 'brakeman', 'rails_best_practices'],
    \  'javascript': ['eslint'],
    \}
    " let g:ale_fixers = {
    " \  'javascript': ['prettier', 'eslint']
    " \}
    nmap <C-M> <Plug>(ale_fix)
    let g:ale_completion_enabled = 1
    let g:airline#extensions#ale#enabled = 1
    let g:ale_echo_msg_error_str = '☠ '
    let g:ale_echo_msg_warning_str = '♿ '
    let g:ale_sign_error = '☠ '
    let g:ale_sign_warning = '♿ '
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
    let g:ale_sign_column_always = 1
  Plug 'Valloric/YouCompleteMe'                        " fast fuzzy-search code completion engine
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
    " let g:ycm_keep_logfiles = 1
    " let g:ycm_log_level = 'debug'
    " let g:EclimCompletionMethod = 'omnifunc'

  Plug 'junegunn/vim-easy-align'                       " align tool
    " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
    vmap <Enter> <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign) "
  Plug 'ntpeters/vim-better-whitespace'                " highlights trailing whitespaces
  Plug 'Raimondi/delimitMate'                          " automatic closing of quotes
  Plug 'Valloric/MatchTagAlways'                       " highlight XML/HTML tags that enclose your cursor location
    let g:mta_filetypes = {
        \ 'html'       : 1,
        \ 'xhtml'      : 1,
        \ 'xml'        : 1,
        \ 'jinja'      : 1,
        \ 'javascript' : 1,
        \}

" Appearance
  Plug 'airblade/vim-gitgutter'                        " GIT commands
  Plug 'tpope/vim-fugitive'                            " the best Git wrapper
  Plug 'kshenoy/vim-signature'                         " plugin to place, toggle and display marks.
  Plug 'Bling/vim-airline'                             " status-bar
    set laststatus=2
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#branch#enabled = 0
    let g:airline_powerline_fonts = 1
    let g:airline_theme='dark'
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
  Plug 'gorodinskiy/vim-coloresque'                    " shows colors by names
  Plug 'mhinz/vim-startify'                            " provides a start screen for Vim

" General editing
  Plug 'tpope/vim-surround'                            " for manipulation with quotes :)
  Plug 'tomtom/tcomment_vim'                           " commenter
    nnoremap // :TComment<CR>
    vnoremap // :TComment<CR>
  Plug 'AndrewRadev/switch.vim'                        " useful switcher
    let g:switch_mapping = "-"
  Plug 'Yggdroot/indentLine'                           " prints vertical lines at each indentation level
    let g:indentLine_char = '¦'
  Plug 'terryma/vim-multiple-cursors'                  " ability to edit with multiple cursors
  Plug 'Chiel92/vim-autoformat'                        " install ruby-beautify gem
    noremap === :Autoformat<CR>

" Ruby/Rails
  Plug 'tpope/vim-endwise'                             " autocomplete ruby blocks
  Plug 'tpope/vim-rails'                               " for working with Ruby on Rails applications
  Plug 'vim-ruby/vim-ruby'
  Plug 'thoughtbot/vim-rspec'
  Plug 'victorfeijo/binding-pry-vim'

" Elixir
  Plug 'elixir-lang/vim-elixir'                        " support for elixir
  Plug 'slashmili/alchemist.vim'                       " uses ElixirSense to give inside information about your elixir project

" Languages
  Plug 'slim-template/vim-slim'
  Plug 'elzr/vim-json'
  Plug 'TAKAyukiatkwsk/vim-mongoid-syntax'
  Plug 'plasticboy/vim-markdown'
  Plug 'joker1007/vim-ruby-heredoc-syntax'             " highlights HEREDOC syntax

" JavaScript
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
    let g:jsx_ext_required = 0                         " Allow JSX in normal JS files

" TMUX
  Plug 'zaiste/tmux.vim'
  Plug 'jgdavey/tslime.vim'
    let g:tslime_always_current_session = 1                    " run in current session
    " let g:tslime_always_current_window = 1                      " run in current window
    let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")' " command to run<Paste>

call plug#end()

"}}}***********************************************************************
"{{{                     Color schemes
"**************************************************************************

" " NeoSolarized
" set termguicolors
" colorscheme NeoSolarized
" set background=dark
" " set background=light
" let g:neosolarized_vertSplitBgTrans = 1

" colorscheme railscasts
" colorscheme monokai-phoenix

colorscheme neodark
" let g:neodark#terminal_transparent = 1
" let g:neodark#use_custom_terminal_theme = 1
" let g:neodark#use_256color = 1


"}}}***********************************************************************
"{{{                     Key Settings
"**************************************************************************

let mapleader = ","
let g:mapleader = ","
let g:multi_cursor_next_key='<C-d>'

" Turn off arrow keys (this might not be a good idea for beginners,
" but it is
" the best way to ween yourself of arrow keys on to hjkl)
" http://yehudakatz.com/2010/07/29/everyone-who-tried-to-convince-me-to-use-vim-was-wrong/
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>"
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Map ESC
imap jj <ESC>
" move between splits by tab
nnoremap <Tab> <C-w>w

" navigate between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" navigate through autocomplete menu ()
inoremap <C-k> <C-Up>
inoremap <C-j> <C-Down>

" turn search highlight off
nnoremap <Leader><space> :noh<CR> :IndentLinesReset <CR>

" rails
map <Leader>h :AV<CR>

" open current file in browser
map <Leader>o :!open %<CR>

" rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

" jump to end of text you pasted
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" <Leader>r -- Cycle through relativenumber + number, number (only), and no
" numbering (mnemonic: relative).
nnoremap <silent> <Leader>r :call Cycle_numbering()<CR>

"}}}***********************************************************************
"{{{                     Other settings
"**************************************************************************

" set custom config file for RuboCop
let g:vimrubocop_config = '~/.config/nvim/rubocop.yml'

"}}}***********************************************************************
