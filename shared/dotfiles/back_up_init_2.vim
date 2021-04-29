"------------------Settings--------------------

" au BufWritePre * :%s/\s\+$//e            " trailing whitespaces
set shell=/bin/bash                      " set shell
set clipboard=unnamed,unnamedplus        " use system clipboard
" set tags+=gems.tags                      " ctags
set nu                                   " enable left numbers
set rnu                                  " increasing and decreasing left numbers
" set fillchars=vert:\                     " disable vert div chars
set nocompatible                         " be iMproved, required
" set cursorline                           " highlight the cursor screen line # performance issues !!!
" set cursorcolumn                         " highlight the cursor screen column # performance issues !!!
set scrolloff=5                          " minimal number of screen lines to keep above and below the cursor "
" set spell spelllang=en_us                " spellchecker
set colorcolumn=120                      " right margin
set lazyredraw                           " increase rendering speed
set splitbelow                           " split new horizontal tab bellow
set splitright                           " split new vertical tab right
set encoding=utf-8                       " encoding
set noswapfile                           " disable swap file (check it)
set ruler                                " show the cursor position all the time
" set showcmd                              " display incomplete commands
" set list listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace
set undofile                             " Maintain undo history between sessions
set undodir=~/.vim/undodir               " file with changes history
set re=1                                 " Use new syntax highlight engine

let mapleader = ","

" Auto indentation
set expandtab
set shiftwidth=2
set softtabstop=2
set backspace=2                          " make backspace work like most other apps
highlight Comment cterm=italic           " italic comments

" String to put at the start of lines that have been wrapped "
let &showbreak='↪ '

" jump to end of text you pasted
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" no highlight
nnoremap <esc> :noh<return><esc>


"---------------- Plugins -------------------
call plug#begin('~/.vim/plugged')
  Plug 'gmarik/Vundle.vim' " plugin manager

  " Navigation
  Plug 'christoomey/vim-tmux-navigator'                             " tmux + vim navigation

  " Plug 'Lokaltog/vim-easymotion'                                    " jump between search matches
  " let g:EasyMotion_smartcase = 1
  "   map  / <Plug>(easymotion-sn)
  "   omap / <Plug>(easymotion-tn)
  "   map  n <Plug>(easymotion-next)
  "   map  N <Plug>(easymotion-prev)

"  Plug 'scrooloose/nerdtree'                           " Nerdtree panel
"    map <C-n> :NERDTreeToggle<CR>
"    map <C-f> :NERDTreeFind<CR>
"    let NERDTreeShowLineNumbers=1                      " enable line numbers
"    autocmd FileType nerdtree setlocal relativenumber  " make sure relative line numbers are used
"    let NERDTreeCascadeSingleChildDir=0                " for folder embeding
"    let NERDTreeShowHidden=1                           " show hidden files

  Plug 'scrooloose/nerdtree'                                        " file tree
    map <C-n> :NERDTreeToggle<CR>
    map <C-f> :NERDTreeFind<CR>
    let NERDTreeShowHidden=1

    let NERDTreeShowLineNumbers=1
    let NERDTreeCascadeSingleChildDir=0

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " search file by name
  Plug 'junegunn/fzf.vim'                                           " search files by name
    let $FZF_DEFAULT_OPTS="--preview 'coderay {}'"                  " setup preview window for fuzzy finder
    " shortkey for fuzzy finder
    nnoremap <C-p> :FZF<CR>

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

  Plug 'ntpeters/vim-better-whitespace'                   " mark whitespaces

  Plug 'Bling/vim-airline'              " bottom panel
    Plug 'vim-airline/vim-airline-themes' " airline thems
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1
    let g:airline_theme='dark'
    set laststatus=2
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''

  Plug 'lilydjwg/colorizer'         " colors for color code #ffffff
  Plug 'tpope/vim-fugitive'         " git integration
  Plug 'tpope/vim-rhubarb'          " Enables :Gbrowse from fugitive.vim to open GitHub URLs.
  Plug 'Xuyuanp/nerdtree-git-plugin'

" General editing
  Plug 'tpope/vim-surround'   " change quoutes

" Ruby/Rails
  " Plug 'tpope/vim-endwise'           " closes end
  " Plug 'tpope/vim-rails'             " rails integration
  Plug 'vim-ruby/vim-ruby'           " syntax, indents
  " Plug 'andymass/vim-matchup'        " highlight do-end blocks PERFORMANCE ISSUES
  Plug 'ngmy/vim-rubocop'            " code-style checker for ruby
  Plug 'thoughtbot/vim-rspec'        " run specs from vim
    map <Leader>t :call RunCurrentSpecFile()<CR>
    map <Leader>s :call RunNearestSpec()<CR>
    map <Leader>l :call RunLastSpec()<CR>
    map <Leader>a :call RunAllSpecs()<CR>

  Plug 'victorfeijo/binding-pry-vim' " put binding

" JavaScript/React
  Plug 'pangloss/vim-javascript'         " javascript
  Plug 'mxw/vim-jsx'
  Plug 'chemzqm/vim-jsx-improve'
  Plug 'kchmck/vim-coffee-script'

" Languages
  Plug 'slim-template/vim-slim'         " slim
  Plug 'elzr/vim-json'                  " json
  Plug 'ekalinin/Dockerfile.vim'        " dockerfile
  Plug 'zaiste/tmux.vim'                " tmux vim syntax
  Plug 'plasticboy/vim-markdown'        " markdown syntax
  " Plug 'nelstrom/vim-textobj-rubyblock' " select ruby blocks
  " Plug 'kana/vim-textobj-user'          " dependencies
  Plug 'mattn/emmet-vim'                " write html easy
  Plug 'scrooloose/nerdcommenter'
"  Plug 'tomtom/tcomment_vim'            " commenter

" Theme
  Plug 'sheerun/vim-polyglot'
  Plug 'trevordmiller/nova-vim'

" other
  Plug 'jgdavey/tslime.vim'      " Send commands to TMUX
    let g:tslime_always_current_session = 1                     " run in current session
    let g:tslime_always_current_window = 1                      " run in current window
    let g:rspec_command = 'call Send_to_Tmux("rspec {spec} --format progress\n")' " command to run

  " Plug 'Yggdroot/indentLine'        " prints vertical lines at each indentation level PERFORMANCE ISSUES IN VISUAL MODE
  "  let g:indentLine_char_list = ['|', '¦', '┆', '┊']

  " Plug 'terryma/vim-multiple-cursors' " investigate how does it work

  " Plug 'bkad/CamelCaseMotion'                                       " jump between camelcase words
  "   map <silent> w <Plug>CamelCaseMotion_w
  "   map <silent> b <Plug>CamelCaseMotion_b
  "   map <silent> e <Plug>CamelCaseMotion_e
  "   sunmap w
  "   sunmap b
  "   sunmap e

  " Plug 'rhysd/vim-grammarous'        " Grammar checker based on LanguageTool
  "   let g:grammarous#languagetool_cmd = 'languagetool' " use system languagetool instead of downloading new

  " Utils
  Plug 'AndrewRadev/switch.vim' " useful switcher
    " switch on -
    let g:switch_mapping = "-"
    let g:switch_custom_definitions =
        \ [
        \   ['assert', 'refute']
        \ ]


  " Plug 'Chiel92/vim-autoformat' " + install ruby-beautify gem
  Plug 'dkprice/vim-easygrep'   " Fast and Easy Find and Replace Across Multiple Files

  Plug 'Valloric/YouCompleteMe'                        " fast fuzzy-search code completion engine
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
    " let g:ycm_keep_logfiles = 1
    " let g:ycm_log_level = 'debug'
    " let g:EclimCompletionMethod = 'omnifunc'

  " Deoplete
  " Plug 'Shougo/deoplete.nvim'
  " Plug 'Shougo/neco-vim'        "  search in source for deoplete
  " Plug 'Shougo/neoinclude.vim'  " search in included files for deoplete
  " Plug 'Shougo/neco-syntax'     " search in syntax for deoplete

  " Translate
  " Plug 'haya14busa/vim-open-googletranslate'
  " Plug 'tyru/open-browser.vim'  " dependency for vim-open-googletranslate

  Plug 'chrisbra/csv.vim'       " csv editor and viewer

  " Plug 'reasonml-editor/vim-reason-plus' " investigate
call plug#end()

colorscheme monokai-phoenix
" colorscheme nova

