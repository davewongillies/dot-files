" Vi non-compatible mode
set shell=bash
set nocompatible               " be iMproved
filetype off                   " required! Don't know what the hell for though

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup vimenter
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  augroup END
endif

call plug#begin('~/.vim/bundle')

" Then:
" $ vim -i NONE -c PlugInstall -c PlugClean! -c quitall

Plug 'tomtom/tlib_vim'
Plug 'xolox/vim-misc'

" Ctags plugins
Plug 'majutsushi/tagbar'
Plug 'lisongmin/markdown2ctags'

Plug 'MarcWeber/vim-addon-mw-utils'

" neocompletion
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" Vim script for text filtering and alignment
" Plug 'godlygeek/tabular'
" Plug 'jamessan/vim-gnupg'
Plug 'kana/vim-smartinput'
Plug 'myusuf3/numbers.vim'
Plug 'rking/ag.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tsaleh/vim-tmux'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'rhysd/committia.vim'
Plug 'KabbAmine/zeavim.vim'

" Themes
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'lifepillar/vim-solarized8'

" Nerdtree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Git plugins
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'gregsexton/gitv'

" Syntax plugins
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'KabbAmine/zeavim.vim'
Plug 'aliou/bats.vim'
Plug 'dag/vim-fish'
Plug 'davewongillies/vim-eyaml'
Plug 'davewongillies/vim-gradle'
Plug 'davewongillies/vim-i3-syntax'
Plug 'editorconfig/editorconfig-vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'fatih/vim-go'
Plug 'hashivim/vim-hashicorp-tools'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'kchmck/vim-coffee-script'
Plug 'rodjek/vim-puppet'
Plug 'sophacles/vim-processing'
Plug 'stevearc/vim-arduino'
Plug 'tolecnal/icinga2-vim'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-markdown'
Plug 'w0rp/ale'

" vim-scripts repos
Plug 'vim-scripts/Align'
Plug 'vim-scripts/Gist.vim'
Plug 'vim-scripts/matchit.zip'

" testing
Plug 'junegunn/vader.vim'

call plug#end()            " required

" === File type =============================================================
filetype plugin on

" enables proper mouse support
set ttyfast
" set ttymouse=xterm2
set mouse=a
set showcmd        " Show (partial) command in status line.
set number         " Line numbers
set cursorline
set nofoldenable   " disable folds
set colorcolumn=81 " display a vertical coloured column at 81
set scrolloff=20

" === Solarized ==============================================================
" Solarized colour theme
set background=dark
set termguicolors
colorscheme solarized8
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:solarized_old_cursor_style=1
let g:solarized_termtrans = 1
let g:solarized_contrast = 'high'
let g:solarized_visibility = 'high'
" let g:solarized_termcolors=256

" jump to the last position when reopening a file
augroup lastpos
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

" === Persistent Undo =======================================================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

set undodir=~/.vim/backups
set undofile

" === Indentation ===========================================================
" Default to 2 spaces for soft tabs
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=8

augroup filetypes
  autocmd FileType python    setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
  autocmd FileType python    setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
  autocmd FileType python    let b:ale_fixers = ['flake8', 'yapf']
  autocmd FileType terraform setlocal tabstop=8 expandtab shiftwidth=2 softtabstop=2 commentstring=#%s

  " Delete any whitespace at end of lines
  autocmd FileType json,sh,eruby,spec,c,cpp,python,ruby,java,yaml,javascript,html,css,coffee,haml,php,puppet,terraform autocmd BufWritePre <buffer> :%s/\s\+$//e
augroup END
" === Syntax settings ========================================================
" Syntax highlighting
if has('syntax')
  syntax on
  let g:airline#extensions#ale#enabled = 1
  nmap <silent> <C-k> <Plug>(ale_previous_wrap)
  nmap <silent> <C-j> <Plug>(ale_next_wrap)
  let g:ale_sign_error = ''
  let g:ale_sign_warning = ''
endif

" === Key Mappings ===========================================================
" ctrl-t movement for tabs
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>
map <C-t>n :tabnew<cr>
map <C-t>K :tabclose<cr>

" toggle hidden chars
map <C-l> :set list!<cr>
" toggle relative/absolute number (numbers.vim)
map <C-u> :NumbersToggle<cr>
" toggle between light/dark backgrounds
map <C-b> :let &background = ( &background == "dark"? "light" : "dark" )<cr>

" Align puppet resource attributes
" This can be replaced with :Tab />
" map <C-a>a :Align =><cr>
nmap <F1> <nop>
map <C-t>t :TagbarToggle<cr>


" === Airline ================================================================
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline_powerline_fonts = 1

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
scriptencoding utf-8
" set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors

" If we make mods to ~/.vimrc, vim reloads the changes
augroup vim_reload
    autocmd BufWritePost .vimrc so ~/.vimrc
    autocmd BufWritePost .gvimrc so ~/.gvimrc
augroup END

" === List ===================================================================
" We set the list then show special chars
set list listchars=trail:.,precedes:«,extends:»,eol:↲,tab:\░\░ 

" === NERDTree ===============================================================
" toggle NERDTree
map <C-n> :NERDTreeToggle<cr>
let g:NERDTreeShowHidden = 0
" Open NERDTree on startup
"
" let g:nerdtree_tabs_open_on_console_startup=1

" Doesn't open nerdtree on git commits
augroup nerdtree
    autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | endif
    " Closes vim is nerdtree is the last window open
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

" Can't remember why I've set these
set hlsearch
set showcmd
set ignorecase
set smartcase

" === gitv ===================================================================
let g:Gitv_OpenHorizontal = 0

" === deoplete ===============================================================
let g:deoplete#enable_at_startup = 1
let g:deoplete#complete_method = 'omnifunc'
let g:deoplete#enable_yarp = 1
call deoplete#initialize()

" === Ultisnips ==============================================================
let g:UltiSnipsExpandTrigger = '<nop>'
let g:ulti_expand_or_jump_res = 0
function! ExpandSnippetOrCarriageReturn()
    let l:snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return l:snippet
    else
        return "\<CR>"
    endif
endfunction

inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"

" === tagbar =================================================================
augroup tagbar
    autocmd VimEnter * nested :call tagbar#autoopen(1)
    autocmd FileType * nested :call tagbar#autoopen(0)
    " autocmd BufEnter * nested :call tagbar#autoopen(0)
augroup END

let g:tagbar_compact = 1

" === Ctrl-P =================================================================
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                          \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']

" === terraform ==============================================================
augroup misc
    " (Optional)Hide Info(Preview) window after completions
    autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif
augroup END

let g:terraform_fmt_on_save = 1
let g:terraform_align = 1

" Verbose mode needs to be set for terraform omnicompletion for some reason
set verbose=0

" With TF, make omnicompletion the default for tabbing
" autocmd FileType terraform let g:SuperTabDefaultCompletionType = '<c-x><c-o>'
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.terraform = '[^ *\t"{=$]\w*'

" === eyaml ==================================================================
let g:eyaml_encryption_method = 'gpg'
let g:eyaml_gpg_always_trust = 1
let g:eyaml_gpg_recipients_file = 'hiera-eyaml-gpg.recipients'


highlight badWords ctermbg=red ctermfg=white
fun! HiBadWords()
    match badWords /\c\<\(obviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however\|so,\|easy\)\>/
endfun

" obviously
augroup badwords
    autocmd InsertEnter *.md call HiBadWords()
    autocmd InsertLeave *.md call HiBadWords()
augroup END

" === Terminal =============
set splitbelow
set termwinsize=20x0
