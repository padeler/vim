"
" Vim config by padeler 
" 23-04-2014
"

" Initially disable filetype and syntax.
" These are re-enabled below.
syntax off
filetype off

" Initialize Vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle, required
Plugin 'gmarik/vundle' 
" YCM 
Bundle 'Valloric/YouCompleteMe'
" Code and files fuzzy finder
Bundle 'kien/ctrlp.vim'
" Extension to ctrlp, for fuzzy command finder
Bundle 'fisadev/vim-ctrlp-cmdpalette'
" Better file browser
Bundle 'scrooloose/nerdtree'
" Class/module browser
"Bundle 'majutsushi/tagbar'
" Airline
Bundle 'bling/vim-airline'
" Drag visual blocks arround
Bundle 'fisadev/dragvisuals.vim'
" Tab list panel
Bundle 'kien/tabman.vim'
" Syntastic syntax checking
"Bundle 'scrooloose/syntastic'
" Nerd-commenter
Bundle 'scrooloose/nerdcommenter'
" Jedi-vim
Bundle 'davidhalter/jedi-vim'

" Since we are using YCM for autocomplete, disable the jedi-vim autocomple
let g:jedi#completions_enabled = 0

" Automatic reloading of .vimrc
autocmd! bufwritepost ~/.vim/vimrc source %


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
let g:airline_theme = 'bubblegum'

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
au InsertEnter * :set nu nornu
au InsertLeave * :set nonu rnu
set nonu rnu

" easier moving between tabs
map <Leader>, <esc>:tabprevious<CR>
map <Leader>. <esc>:tabnext<CR>
map <Leader>t <esc>:tabnew<CR>

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

" Map the CTRL-F11 key to run Python code. Test your
" code the easy way. Press to run the code, then to return to Vim. This will
" allow you to easily press the letter 'u' to undo anything that does not work.
" Of course you can substitute :!python % for :!bash % to run your Bash
" scripts!
map <C-F11> :w<CR>:!ipython % <CR>

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
" let python_highlight_all=1 

" ===========================================================================
" ========================= Plugin Settings ================================= 
" ===========================================================================
"
" Airline config
set laststatus=2

" Remap CtrlPCmdPallette to auto complete commands
nnoremap <leader>p :CtrlPCmdPalette<CR>

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
" Map item list (which is where :Errors are stored by syntastic) to Alt-Left and Alt-Right 
nnoremap <A-Right> :lnext<CR>
nnoremap <A-Left> :lprev<CR>



" Settings for jedi-vim
"" XXX Maybe switch to YouCompleteMe.
"let g:jedi#usages_command = "<leader>z"
"let g:jedi#popup_on_dot = 0
"let g:jedi#popup_select_first = 0
" "map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

 "TagBar Config
map <C-o> :TagbarToggle<CR>

 "NERD Tree Config
" NERD Tree is a file browser for VIM
map <C-n> :NERDTreeToggle<CR>
" Close vim is the last window open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

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


