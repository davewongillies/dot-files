" Vi non-compatible mode
set nocompatible               " be iMproved
filetype off                   " required! Don't know what the hell for though

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
" original repos on github
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "honza/snipmate-snippets"
Bundle "tomtom/tlib_vim"
Bundle 'Lokaltog/powerline'
Bundle 'PotatoesMaster/i3-vim-syntax'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ervandew/supertab'
Bundle 'garbas/vim-snipmate'
Bundle 'godlygeek/tabular'
Bundle 'jamessan/vim-gnupg'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'kana/vim-smartinput'
Bundle 'myusuf3/numbers.vim'
Bundle 'rodjek/vim-puppet'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tempire/conque'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tsaleh/vim-tmux'
Bundle 'xuhdev/SingleCompile'

" vim-scripts repos
Bundle 'Align'
Bundle 'Gist.vim'
Bundle 'matchit.zip'
Bundle 'tComment'

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
set ttymouse=xterm2
set mouse=a
set showcmd        " Show (partial) command in status line.
set number         " Line numbers
set cursorline
set nofoldenable   " disable folds
set colorcolumn=80 " display a vertical coloured column at 80
set scrolloff=20

" Solarized colour theme
colorscheme solarized
let g:solarized_termtrans=1

if has('gui_running')
    set guifont=Monaco\ For\ Powerline\ 10
    set background=light
    " Number of horizontal lines on the screen
    " set lines=60
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
autocmd FileType yaml setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd FileType ruby setlocal tabstop=8 expandtab shiftwidth=2 softtabstop=2

" For some reason it has to be 3 for C for Uni
autocmd FileType c setlocal shiftwidth=3 tabstop=3

" ================= Syntastic settings ===============
" Syntax highlighting
if has("syntax")
  syntax on
  let g:syntastic_mode_map = { 'mode': 'active',
                                 \ 'active_filetypes': ['ruby', 'shell', 'python'],
                                 \ 'passive_filetypes': [ ] }
  let g:syntastic_check_on_open=1           " check syntax on file open
  let g:syntastic_python_checker=['flake8'] " use flake8 for python syntax checking
  let g:syntastic_python_flake8_args = '--max-line-length=1000'
  let g:puppet_module_detect=1              " enable puppet module detection
endif

" =============== Key Mappings ================
" ctrl-t movement for tabs
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>
map <C-t>n :tabnew<cr>
map <C-t>K :tabclose<cr>

" toggle NERDTree
map <C-n> :NERDTreeToggle<cr>
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

" ================= SingleCompile =====================
nmap <C-F9> :SCCompile<cr>
nmap <C-F10> :SCCompileRun<cr>
"call SingleCompile#SetCompilerTemplate('c', 'gcc', 'GNU C Compiler',
"             \'gcc', '-ansi -pedantic -Wall -o $(FILE_TITLE)$', l:common_run_command)
"call SingleCompile#SetOutfile('c', 'gcc', l:common_out_file)
"call SingleCompile#SetCompilerTemplate('c', 'clang',
"             \'LLVM C Compiler', 'clang', '-o $(FILE_TITLE)$',
"             \l:common_run_command)
"call SingleCompile#SetOutfile('c', 'clang', l:common_out_file)

"call SingleCompile#ChooseCompiler('c', 'clang')

" ================== Powerline ========================
" start powerline
" python from powerline.ext.vim import source_plugin; source_plugin()
" set fillchars+=stl:\ ,stlnc:\
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" for (old) Powerline (I think)
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
scriptencoding utf-8
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
let g:Powerline_symbols = 'unicode'

" If we make mods to ~/.vimrc, vim reloads the changes
autocmd BufWritePost .vimrc so ~/.vimrc
autocmd BufWritePost .gvimrc so ~/.gvimrc

" ============== List ==================
" We set the list then show special chars
set list listchars=trail:.,precedes:«,extends:»,eol:↲,tab:\░\░ 

" ================= NERDTree ==========================
" Open NERDTree on startup
autocmd vimenter * NERDTree $PWD
autocmd vimenter * wincmd w
