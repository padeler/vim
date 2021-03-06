"""""""""""""""""""""""""
" Vim config by padeler "
" Created 23-04-2014    "
"""""""""""""""""""""""""

" Initially disable filetype and syntax.
" These are re-enabled below.
syntax off
filetype off

set encoding=utf-8

" Initialize Vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle, required
Plugin 'gmarik/vundle' 
" YCM 
"Bundle 'Valloric/YouCompleteMe'
" Better file browser
Bundle 'scrooloose/nerdtree'
" Class/module browser
Bundle 'majutsushi/tagbar'
" Airline
Bundle 'bling/vim-airline'
" Airline themes
Plugin 'vim-airline/vim-airline-themes'
" Drag visual blocks arround
Bundle 'fisadev/dragvisuals.vim'
" Syntastic syntax checking
Bundle 'scrooloose/syntastic'
" Nerd-commenter
Bundle 'scrooloose/nerdcommenter'
" Jedi-vim
Bundle 'davidhalter/jedi-vim'
" ctrlp fuzzy search
Bundle 'ctrlpvim/ctrlp.vim'
" fugitive git integration
"Bundle 'tpope/vim-fugitive'
" Tabman 
"Bundle 'kien/tabman.vim'
" vim markdown plugin
Bundle 'gabrielelana/vim-markdown'
" Proper folding
Plugin 'tmhedberg/SimpylFold'
" Bclose close buffer without closing the windows it is displayed in.
Plugin 'rbgrouleff/bclose.vim'

" Automatic reloading of .vimrc
autocmd! bufwritepost ~/.vim/vimrc source %

" ctrlp settings
" search by filename
let g:ctrlp_by_filename = 1
" use the nearest .git directory as cwd
let g:ctrlp_working_path_mode = 'r'


" vim-markdown options
" disable spellcheck
let g:markdown_enable_spell_checking = 0

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
" XXX This is working only with Scemes that define the ExtraWhitespace field.
" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
" au InsertLeave * match ExtraWhitespace /\s\+$/

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
set t_Co=256
set background=dark
color wombat256mod
"color candy
"color distinguished
"color adrian

" set another theme for the airline 
let g:airline_theme = 'papercolor'
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

filetype plugin indent on
filetype plugin on

au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setf glsl 

" Enable syntax highlighting
syntax on

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233 guibg=Gray10
set cursorline
highlight cursorline ctermbg=17 term=bold cterm=NONE guibg=#000030

autocmd WinLeave * set nocursorline
autocmd WinEnter * set cursorline



" Enable mouse support. 
" NOTE: This breaks copy-paste. Use shift when highlighting text to 
" fall back to the default copy-paste behaivior of the terminal.
set mouse=a

" Auto read files that have changed on disk.
" set autoread
" au WinEnter,TabEnter,FocusGained,BufEnter * :silent! !

" Useful settings
set history=1000
set undolevels=1000

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Split behavior
set splitbelow
set splitright

" system clipboard
set clipboard=unnamed

" Enable folding
set foldmethod=indent
set foldlevel=99
" enable folding with spacebar
nnoremap <space> za
" show docstrings of folds (simplyforl plugin)
let g:SimpylFold_docstring_preview=1



" ============================================================================
" ================= Cool stuff found on vimbits.com ========================== 
" ============================================================================

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" MAP SUWrite to sudo w!
" Sometimes I forget to run vim with sudo privileges especially when editing
" files under /etc. I use w!! to override the permissions and saves the file as
" sudo.
command! SUwrite % !sudo tee > /dev/null % 

" Bind nohl
" Removes highlight of your last search
noremap <leader>n :nohl<CR>

" Map ZZ to ZQ, to avoid accidental :wq! (bad habits)
nnoremap ZZ ZQ

" absolute line numbers in insert mode, relative otherwise for easy movement
"au InsertEnter * :set nu nornu
"au InsertLeave * :set nonu rnu
" turns out both always is better
set nu rnu


function! ToggleNumbers()
    set invnu
    set invrnu
endfunction

" Toggle line number easilly
map <Leader>1 <ESC>:call ToggleNumbers()<CR>

" easier moving between buffers
map <Leader>, <esc>:tabprevious<CR>
map <Leader>. <esc>:tabnext<CR>
map <Leader>t <esc>:tabnew<CR>

" Close current buffer (but not the window)
map <Leader>q <esc>:Bclose<CR>


" Bad habbits: ctrl-s saves documents in most IDEs.
" Note: To disable ctrl-s scroll lock in your terminal 
" add the following to .bashrc
" bind -r '\C-s'
" stty -ixon
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" allow modified buffers to be hidden 
set hidden


" move between buffers
nnoremap <silent> <A-Right> <esc>:bnext<CR>
nnoremap <silent> <A-Left> <esc>:bprev<CR> 

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Easilly move lines up/down in normal, insert or visual mode.
nnoremap <A-Down> :m .+1<CR>==
nnoremap <A-Up> :m .-2<CR>==
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv

" Map the CTRL-F9 key to run Python code. Test your
" code the easy way. Press to run the code, then to return to Vim. This will
" allow you to easily press the letter 'u' to undo anything that does not work.
" Of course you can substitute :!python % for :!bash % to run your Bash
" scripts!
map <C-F9> :w<CR>:!ipython % <CR>
map <F9> :w<CR>:!ipdb % <CR>

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j


" Bash style auto-complete for paths on 'command mode :' 
set wildmenu
set wildmode=list:longest


" enable python specific syntax highlight
let python_highlight_all=1 

" ===========================================================================
" ========================= Plugin Settings ================================= 
" ===========================================================================
"
" YCM settings
" Set the global ycm_extra_conf file for C/C++ auto complete.
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
let g:ycm_goto_buffer_command = 'new-or-existing-buffer'
let g:ycm_extra_conf_globlist = ['~/work/*','/media/storage/home/padeler/work/*','!~/*']
map <silent> <F3> <esc>:YcmCompleter GoTo<CR>
let g:ycm_autoclose_preview_window_after_completion=0

"
" Airline config
set laststatus=2
let g:airline_powerline_fonts = 1

" Nerd Commenter Toggle comment
map ./ <plug>NERDCommenterToggle


" Drag Visual blocks config
vmap <expr> <M-LEFT> DVB_Drag('left')
vmap <expr> <M-RIGHT> DVB_Drag('right')
vmap <expr> <M-DOWN> DVB_Drag('down')
vmap <expr> <M-UP> DVB_Drag('up')
vmap <expr> D DVB_Duplicate()

" Syntastic config
let g:syntastic_python_checkers = ['python'] ", 'pyflakes' ]
highlight SyntasticError cterm=undercurl ctermfg=Red term=underline
highlight SyntasticWarn cterm=undercurl ctermfg=Yellow term=underline
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
" Thanks to http://superuser.com/questions/558876/how-can-i-make-the-sign-column-show-up-all-the-time-even-if-no-signs-have-been-a
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
"
" Map item list (which is where :Errors are stored by syntastic) to Alt-Left and Alt-Right 
"nnoremap <A-Right> :lnext<CR>
"nnoremap <A-Left> :lprev<CR>

 "TagBar Config
map <C-o> :TagbarToggle<CR>

 "NERD Tree Config
" NERD Tree is a file browser for VIM
map <C-n> :NERDTreeToggle<CR>
" Open nerd tree on startup:
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p " move to the editor window
" Close vim is the last window open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Settings for text and tex files 
"if &ft=='text' || &ft=='tex' 
" set formatoptions+=t
" set wrap linebreak nolist
"endif

function! ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction
noremap <silent> <Leader>w :call ToggleWrap()<CR>


