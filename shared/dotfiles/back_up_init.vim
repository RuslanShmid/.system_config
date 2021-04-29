colorscheme monokai-phoenix

highlight Comment cterm=italic " italic comments

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif


"------------------- Vim settings -----------------------
"

" autosave view
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" vim configuration
au BufWritePre * :%s/\s\+$//e            " trailing whitespaces
set shell=/bin/bash                      " set shell
set clipboard=unnamed,unnamedplus        " use system clipboard
set tags+=gems.tags                      " ctags
set nu                                   " enable left numbers
set rnu                                  " increasing and decreasing left numbers
set fillchars=vert:\                     " disable vert div chars
set nocompatible                         " be iMproved, required
" set cursorline                           " highlight the cursor screen line # performance issues
" set cursorcolumn                         " highlight the cursor screen column
set scrolloff=5                          " minimal number of screen lines to keep above and below the cursor "
" set spell spelllang=en_us                " spellchecker
set colorcolumn=120                      " right margin
set lazyredraw                           " increase rendering speed
set splitbelow                           " split new horizontal tab bellow
set splitright                           " split new vertical tab right
set encoding=utf-8                       " encoding
set noswapfile                           " disable swap file (check it)
set ruler                                " show the cursor position all the time
set showcmd                              " display incomplete commands
set list listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace
set undofile                             " Maintain undo history between sessions
set undodir=~/.vim/undodir               " file with changes history
set re=1                                 " Use new syntax highlight engine

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

let mapleader="," " leader

" Auto resizing of focuesed window
let &winwidth = &columns * 6 / 10

" no highlight
nnoremap <esc> :noh<return><esc>

" ------ folding
" Enable folding based on syntax rules
set foldmethod=syntax
autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)')) " set min folding level to max available

" Map folding to Spacebar
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<Tab>"
    else
        return "\<C-p>"
    endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>
"nnoremap <Tab> za
vnoremap <Space> zf
" Auto resizing of focuesed window

let &winwidth = &columns * 6 / 10

"------------------- end of Vim settings -----------------------


"---------------- Plugins -------------------
call plug#begin('~/.vim/plugged')
  Plug 'gmarik/Vundle.vim' " plugin manager

" Navigation
  Plug 'christoomey/vim-tmux-navigator'                             " tmux + vim navigation

  Plug 'bkad/CamelCaseMotion'                                       " jump between camelcase words
    map <silent> w <Plug>CamelCaseMotion_w
    map <silent> b <Plug>CamelCaseMotion_b
    map <silent> e <Plug>CamelCaseMotion_e
    sunmap w
    sunmap b
    sunmap e

  Plug 'Lokaltog/vim-easymotion'                                    " jump between search matches
  let g:EasyMotion_smartcase = 1
    map  / <Plug>(easymotion-sn)
    omap / <Plug>(easymotion-tn)
    map  n <Plug>(easymotion-next)
    map  N <Plug>(easymotion-prev)

  Plug 'scrooloose/nerdtree'                                        " file tree
    map <C-n> :NERDTreeToggle<CR>
    map <C-f> :NERDTreeFind<CR>
    let NERDTreeShowHidden=1

    let NERDTreeShowLineNumbers=1
    let NERDTreeCascadeSingleChildDir=0

    " close nvim if nerdtree is the only window that is left
    autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  " Plug 'Xuyuanp/nerdtree-git-plugin'                                " show git status in nerd tree
  "   let g:NERDTreeIndicatorMapCustom = {
  "     \ "Modified"  : "✹",
  "     \ "Staged"    : "✚",
  "     \ "Untracked" : "✭",
  "     \ "Renamed"   : "➜",
  "     \ "Unmerged"  : "═",
  "     \ "Deleted"   : "✖",
  "     \ "Dirty"     : "✗",
  "     \ "Clean"     : "✔︎",
  "     \ 'Ignored'   : '☒',
  "     \ "Unknown"   : "?"
  "     \ }

  Plug 'rking/ag.vim'                                               " search in files
    if executable('ag')
      " AG
      map <Leader>g :Ag<SPACE>
      let g:ag_prg='ag -S --nocolor --nogroup --column
        \ --ignore-dir "bin"
        \ --ignore-dir "coverage"
        \ --ignore-dir "data"
        \ --ignore-dir "design"
        \ --ignore-dir "doc"
        \ --ignore-dir "lib"
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
        \ --ignore "db/schema*"'

        if !exists(":Ag")
          command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
          nnoremap \ :Ag<SPACE>
        endif
    endif

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " search file by name
  Plug 'junegunn/fzf.vim'                                           " search files by name
    let $FZF_DEFAULT_OPTS="--preview 'coderay {}'"                  " setup preview window for fuzzy finder
    " shortkey for fuzzy finder
    nnoremap <C-p> :FZF<CR>

" Correction
  Plug 'w0rp/ale'                                         " async lint
    " ale config
    let g:ale_linters = {
    \   'ruby': ['ruby', 'rubocop', 'reek', 'rails_best_practices'],
    \}

    let g:ale_completion_enabled         = 1
    let g:airline#extensions#ale#enabled = 1
    let g:ale_echo_msg_error_str         = '☠'
    let g:ale_echo_msg_warning_str       = '♿'
    " let g:ale_sign_error                 = '☠'
    " let g:ale_sign_warning               = '♿'
    let g:ale_echo_msg_format            = '[%linter%] %s [%severity%]'
    let g:ale_sign_column_always         = 1
    let g:ale_fixers = { 'ruby': ['rubocop'] }

    map <Leader>f :ALEFix<CR>

  " Autocompleete
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
  let g:deoplete#enable_at_startup = 1
    Plug 'fishbullet/deoplete-ruby', { 'for': 'ruby' }          " ruby autocomplete
    Plug 'ujihisa/neco-look'                                    " English autocomplete

    " use tab to forward cycle
    inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
    " use tab to backward cycle
    inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

  Plug 'junegunn/vim-easy-align'                          " align items
    " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
    vmap <Enter> <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. gaip)<Paste>
    nmap ga <Plug>(EasyAlign)

  Plug 'ntpeters/vim-better-whitespace'                   " mark whitespaces

" Appearance
  " Plug   'airblade/vim-gitgutter'         " changes in file
  Plug   'Bling/vim-airline'              " bottom panel
    Plug 'vim-airline/vim-airline-themes' " airline thems
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1
    let g:airline_theme='dark'
    set laststatus=2
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''

  Plug 'gorodinskiy/vim-coloresque' " colors for color code
  Plug 'tpope/vim-fugitive'         " git integration
  Plug 'tpope/vim-rhubarb'          " Enables :Gbrowse from fugitive.vim to open GitHub URLsz
  "Plug 'Yggdroot/indentLine'        " vertical lines for indentation

" General editing
  Plug 'wincent/command-t'
  Plug 'tpope/vim-surround'   " change quoutes
  Plug 'jiangmiao/auto-pairs' " autoclose parentheses
  Plug 'tomtom/tcomment_vim'  " comments

" Ruby/Rails
  Plug 'tpope/vim-endwise'           " closes end
  Plug 'tpope/vim-rails'             " rails integration
  Plug 'vim-ruby/vim-ruby'           " syntax, indents
  Plug 'andymass/vim-matchup'        " highlight do-end blocks
  Plug 'thoughtbot/vim-rspec'        " run specs from vim
    map <Leader>t :call RunCurrentSpecFile()<CR>
    map <Leader>s :call RunNearestSpec()<CR>
    map <Leader>l :call RunLastSpec()<CR>
    map <Leader>a :call RunAllSpecs()<CR>

  Plug 'victorfeijo/binding-pry-vim' " put binding

" JavaScript/React
  Plug 'pangloss/vim-javascript'         " javascript
  Plug 'mxw/vim-jsx'

" Languages
  Plug 'slim-template/vim-slim'          " slim
  Plug 'zaiste/tmux.vim'                 " tmux conf
  " Plug  'elzr/vim-json'                 " json
  Plug 'plasticboy/vim-markdown'        " markdown
  Plug 'ekalinin/Dockerfile.vim'        " dockerfile
  Plug 'zaiste/tmux.vim'                " tmux vim syntax
  Plug 'plasticboy/vim-markdown'        " markdown syntax
  Plug 'nelstrom/vim-textobj-rubyblock' " select ruby blocks
  Plug 'kana/vim-textobj-user'          " dependencies
  Plug 'mattn/emmet-vim'                " write html easy
  Plug 'scrooloose/nerdcommenter'

" Track the engine.
  Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
  Plug 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
  let g:UltiSnipsJumpForwardTrigger='<Tab>'
  let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'

" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
  let g:UltiSnipsEditSplit="vertical"

" Theme
"  Plug 'sheerun/vim-polyglot'
"  Plug 'trevordmiller/nova-vim'
"    let g:nova_transparent = 1
"  colorscheme nova

" other

  Plug 'jgdavey/tslime.vim'      " Send commands to TMUX
    let g:tslime_always_current_session = 1                     " run in current session
    let g:tslime_always_current_window = 1                      " run in current window
    let g:rspec_command = 'call Send_to_Tmux("rspec {spec} --format progress\n")' " command to run
call plug#end()

