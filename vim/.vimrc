" I have to set shell to /bin/bash because I use fish
" and vundle doesn't like non-POSIX shells
set shell=/bin/bash

" Vi non-compatible mode
set nocompatible               " be iMproved
filetype off                   " required! Don't know what the hell for though

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
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

Plug 'godlygeek/tabular'
Plug 'jamessan/vim-gnupg'
Plug 'kana/vim-smartinput'
Plug 'myusuf3/numbers.vim'
Plug 'rking/ag.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tsaleh/vim-tmux'
Plug 'xolox/vim-session'
Plug 'xuhdev/SingleCompile'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'lrvick/Conque-Shell'

" Themes
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'altercation/vim-colors-solarized'

" Nerdtree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Git plugins
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'gregsexton/gitv'

" Syntax plugins
" Plugin 'vim-syntastic/syntastic'
Plug 'w0rp/ale'
Plug 'tpope/vim-jdaddy'
Plug 'editorconfig/editorconfig-vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'hashivim/vim-hashicorp-tools'
Plug 'tpope/vim-markdown'
Plug 'rodjek/vim-puppet'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'ekalinin/Dockerfile.vim'
Plug 'tolecnal/icinga2-vim'
Plug 'dag/vim-fish'

Plug 'davewongillies/vim-gradle'
Plug 'davewongillies/vim-eyaml'

Plug 'KabbAmine/zeavim.vim'

" vim-scripts repos
Plug 'vim-scripts/Align'
Plug 'vim-scripts/Gist.vim'
Plug 'vim-scripts/matchit.zip'

call plug#end()            " required

" ==================== File type =========================
filetype plugin on

" enables proper mouse support
set ttyfast
" set ttymouse=xterm2
set mouse=a
set showcmd        " Show (partial) command in status line.
set number         " Line numbers
set cursorline
set nofoldenable   " disable folds
" set colorcolumn=80 " display a vertical coloured column at 80
set scrolloff=20

" Solarized colour theme
" colorscheme solarized
let g:solarized_termtrans = 1
let g:solarized_contrast = "high"
let g:solarized_visibility = "high"

if has('gui_running')
    set guifont=Monaco\ For\ Powerline\ 10
    set background=light
    " GUI Option to remove the Toolbar (T)
    set guioptions-=T
else
    set background=dark
endif

" jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

set undodir=~/.vim/backups
set undofile

" ================= Indentation ======================
" Default to 4 spaces for soft tabs
set expandtab
set shiftwidth=4
set tabstop=4

autocmd FileType python    setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python    setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd FileType yaml      setlocal tabstop=8 expandtab shiftwidth=2 softtabstop=2
autocmd FileType ruby      setlocal tabstop=8 expandtab shiftwidth=2 softtabstop=2
autocmd FileType php       setlocal tabstop=8 expandtab shiftwidth=2 softtabstop=2
autocmd FileType coffee    setlocal tabstop=8 expandtab shiftwidth=2 softtabstop=2
autocmd FileType terraform setlocal tabstop=8 expandtab shiftwidth=2 softtabstop=2 commentstring=#%s

" Delete any whitespace at end of lines
autocmd FileType json,sh,eruby,spec,c,cpp,python,ruby,java,yaml,javascript,html,css,coffee,haml,php,puppet,terraform autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd BufNewFile,BufRead *.pde setf arduino

" ================= Syntastic settings ===============
" Syntax highlighting
if has("syntax")
  syntax on
  let g:airline#extensions#ale#enabled = 1
  nmap <silent> <C-k> <Plug>(ale_previous_wrap)
  nmap <silent> <C-j> <Plug>(ale_next_wrap)
endif

" =============== Key Mappings ================
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
map <C-a>a :Align =><cr>
nmap <F1> <nop>
map <C-t>t :TagbarToggle<cr>


" Airline
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline_powerline_fonts = 1

" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline#extensions#tabline#left_sep = '▶'
" let g:airline#extensions#tabline#left_alt_sep = '»'
" let g:airline_symbols = {}
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.whitespace = 'Ξ'

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
scriptencoding utf-8
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors

" If we make mods to ~/.vimrc, vim reloads the changes
autocmd BufWritePost .vimrc so ~/.vimrc
autocmd BufWritePost .gvimrc so ~/.gvimrc

" ============== List ==================
" We set the list then show special chars
set list listchars=trail:.,precedes:«,extends:»,eol:↲,tab:\░\░ 

" ================= NERDTree ==========================
" toggle NERDTree
map <C-n> :NERDTreeToggle<cr>
let NERDTreeShowHidden = 0
" Open NERDTree on startup
let g:nerdtree_tabs_open_on_console_startup=1

" Can't remember why I've set these
set hlsearch
set showcmd
set ignorecase
set smartcase

" vim-session
let g:session_autosave='no'

" gitv
let g:Gitv_OpenHorizontal = 0

" YouCompleteMe
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go,groovy' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
\ }

let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

let g:deoplete#enable_at_startup = 1
let g:deoplete#complete_method = "omnifunc"
let g:deoplete#enable_yarp = 1

" Ultisnips
let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function! ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction

inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"

" tagbar options
autocmd VimEnter * nested :call tagbar#autoopen(1)
autocmd FileType * nested :call tagbar#autoopen(0)
" autocmd BufEnter * nested :call tagbar#autoopen(0)
let g:tagbar_compact = 1

let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                          \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']

" Terraform
" (Optional)Hide Info(Preview) window after completions
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

let g:terraform_fmt_on_save = 1
let g:terraform_align = 1

let g:eyaml_encryption_method = 'gpg'
let g:eyaml_gpg_always_trust = 1
let g:eyaml_gpg_recipients_file = 'hiera-eyaml-gpg.recipients'
