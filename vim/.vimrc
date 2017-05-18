set shell=/bin/bash
" Vi non-compatible mode
set nocompatible               " be iMproved
filetype off                   " required! Don't know what the hell for though

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'


Plugin 'tomtom/tlib_vim'
Plugin 'xolox/vim-misc'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'Valloric/YouCompleteMe'
Plugin 'godlygeek/tabular'
Plugin 'jamessan/vim-gnupg'
Plugin 'kana/vim-smartinput'
Plugin 'myusuf3/numbers.vim'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tsaleh/vim-tmux'
Plugin 'xolox/vim-session'
Plugin 'xuhdev/SingleCompile'

" Themes
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'edkolev/tmuxline.vim'

" Nerdtree
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Git plugins
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'gregsexton/gitv'

" Ctags plugins
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'

" Syntax plugins
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-jdaddy'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'hashivim/vim-hashicorp-tools'
Plugin 'tpope/vim-markdown'
Plugin 'rodjek/vim-puppet'
" Bundle 'tejr/vim-nagios'

" vim-scripts repos
Plugin 'Align'
Plugin 'Gist.vim'
Plugin 'matchit.zip'
Plugin 'tComment'

call vundle#end()            " required


" ==================== File type =========================
filetype plugin on
" The following will make Vim load indentation rules and plugins according to the detected filetype.
if has("autocmd")
    filetype plugin indent on
    " Arduino pde file support
    autocmd BufNewFile,BufRead *.pde setf arduino
endif

" enables proper mouse support
set ttyfast
" set ttymouse=xterm2
set mouse=a
set showcmd        " Show (partial) command in status line.
set number         " Line numbers
set cursorline
set nofoldenable   " disable folds
set colorcolumn=80 " display a vertical coloured column at 80
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

autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd FileType yaml setlocal tabstop=8 expandtab shiftwidth=2 softtabstop=2
autocmd FileType ruby setlocal tabstop=8 expandtab shiftwidth=2 softtabstop=2
autocmd FileType php setlocal tabstop=8 expandtab shiftwidth=2 softtabstop=2
autocmd FileType coffee setlocal tabstop=8 expandtab shiftwidth=2 softtabstop=2

" ================= Syntastic settings ===============
" Syntax highlighting
if has("syntax")
  syntax on
  let g:syntastic_mode_map = { 'mode': 'active',
                                 \ 'active_filetypes': ['ruby', 'shell', 'python'],
                                 \ 'passive_filetypes': [ ] }
  let g:syntastic_check_on_open=1            " check syntax on file open
  let g:syntastic_python_checkers=['flake8'] " use flake8 for python syntax checking
  let g:syntastic_python_flake8_args = '--max-line-length=1000'
  let g:puppet_module_detect=1               " enable puppet module detection
  let g:syntastic_puppet_puppetlint_args='--no-documentation-check --no-80chars-check --relative --no-selector_inside_resource-check'
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
" toggle paste mode
map <C-p> :set paste!<cr>
" toggle relative/absolute number (numbers.vim)
map <C-u> :NumbersToggle<cr>
" toggle between light/dark backgrounds
map <C-b> :let &background = ( &background == "dark"? "light" : "dark" )<cr>

" Align puppet resource attributes
map <C-a>a :Align =><cr>
" Open Tagbar
map <C-T> :TagbarToggle<cr>

nmap <F1> <nop>

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
set smartcase

" vim-session
let g:session_autosave='no'

let g:Gitv_OpenHorizontal = 0

autocmd FileType json,sh,eruby,spec,c,cpp,python,ruby,java,yaml,javascript,html,css,coffee,haml,php,puppet autocmd BufWritePre <buffer> :%s/\s\+$//e

let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"

let g:tagbar_type_puppet = {
  \ 'ctagstype': 'puppet',
  \ 'kinds': [
    \'c:class',
    \'s:site',
    \'n:node',
    \'v:variable',
    \'i:include',
    \'d:definition',
    \'r:resource',
    \'f:default'
  \]
\}
